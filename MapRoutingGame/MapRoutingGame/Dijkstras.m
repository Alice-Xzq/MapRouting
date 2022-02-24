//
//  Dijkstras.m
//  MapRouting
//
//  Created by zxiao23 on 5/26/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Dijkstras.h"

@implementation Dijkstras

-(instancetype)init{
    self = [super init];
    if(self){
        [self readFile];
    }
    return self;
}

-(void)readFile{
    //READ FILE
    NSURL *url = [[NSFileManager defaultManager] URLsForDirectory:NSDocumentDirectory inDomains:NSUserDomainMask][0]; //only read from the downloads directory, please remember to put the usa txt file inside the download directory
    NSError *error;
    url = [url URLByAppendingPathComponent:@"usa.txt"];
    NSString* content = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
    if (content == nil) {
    // an error occurred
        NSLog(@"Error reading file at %@\n%@", url, [error localizedFailureReason]);
    }
    NSArray *rawGraph = [content componentsSeparatedByString:@"\r"];
    NSArray *dataCount = [rawGraph[0] componentsSeparatedByString:@"\t"];
    self.n = [dataCount[0] intValue]; //number of vertices
    self.vertices = [[NSMutableArray alloc] initWithCapacity:self.n];
    self.graph = [[NSMutableArray alloc] initWithCapacity:self.n];
    self.visited = [[NSMutableArray alloc] initWithCapacity:self.n];
    
    for(int i = 0; i < self.n; i++){
        NSArray *curNode = [rawGraph[i+1] componentsSeparatedByString:@"\t"];
        [self.vertices addObject:[[Node alloc] initNode:[curNode[0] intValue] WithX:[curNode[1] intValue] andY:[curNode[2] intValue]]];
        [self.graph addObject:[[NSMutableArray alloc] init]];
        [self.visited addObject:[NSNumber numberWithBool:false]];
    }
    
    for(int i = 0; i < [dataCount[1] intValue]; i++){
        NSArray *curNode = [rawGraph[self.n+i+2] componentsSeparatedByString:@"\t"];
        Node *node1 = self.vertices[[curNode[0] intValue]];
        Node *node2 = self.vertices[[curNode[1] intValue]];
        [self.graph[node1.ID] addObject:[[Edge alloc] initWithStart:node1 WithEnd:node2]];
        [self.graph[node2.ID] addObject:[[Edge alloc] initWithStart:node2 WithEnd:node1]];
    }
}

-(NSMutableArray *)findShortestPathFrom : (int) s To : (int) e{
    Node *start = self.vertices[s];
    Node *end = self.vertices[e];
    QueueNode *node = [[QueueNode alloc] initWithprev:NULL andID:start.ID andDistance:0];
    PriorityQueue *myQueue = [[PriorityQueue alloc] init];
    QueueNode *shortest;
    [myQueue add:node];
    while (![myQueue isEmpty]) {
        QueueNode *cur = [myQueue popMin];
        if([self.visited[cur.ID] boolValue]){
            continue;
        }
        if(cur.ID == end.ID){
            shortest = cur;
            NSLog(@"Found the shortest path!");
            break;
        }
        for (int i = 0; i < [self.graph[cur.ID] count]; i++) {
            Edge *newEdge = self.graph[cur.ID][i];
            [myQueue add:[[QueueNode alloc] initFromQueueNode:cur toNewNode:newEdge]];
        }
        self.visited[cur.ID] = [NSNumber numberWithBool:true];
    }
    NSMutableArray *path = [[NSMutableArray alloc] init];
    while(shortest){
        NSLog(@"Node: %d Total Distance: %f", shortest.ID, shortest.distanceUntil);
        [path insertObject:shortest atIndex:0];
        shortest = shortest.prevNode;
    }
    return path;
}

@end
                   
