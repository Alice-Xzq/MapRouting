//
//  Dijkstras.h
//  MapRouting
//
//  Created by zxiao23 on 5/26/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#ifndef Dijkstras_h
#define Dijkstras_h
#import "Edge.h"
#import "Node.h"
#import "QueueNode.h"
#import "PriorityQueue.h"

@interface Dijkstras : NSObject

@property NSMutableArray *vertices;
@property NSMutableArray *graph;
@property NSMutableArray *visited;
@property int n;

-(NSMutableArray *)findShortestPathFrom : (int) s To : (int) e;

@end

#endif /* Dijkstras_h */
