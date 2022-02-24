//
//  main.m
//  MapRoutingGame
//
//  Created by zxiao23 on 5/27/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "Dijkstras.h"
#import "QueueNode.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // Setup code that might create autoreleased objects goes here.
        Dijkstras *myGraph = [[Dijkstras alloc]init];
        NSMutableArray *path = [myGraph findShortestPathFrom:1 To:100];
        for(int i = 0; i < [path count]; i++){
            QueueNode *cur = path[i];
            NSLog(@"Node: %d distance: %f", cur.ID, cur.distanceUntil);
        }
        
    }
    return NSApplicationMain(argc, argv);
}
