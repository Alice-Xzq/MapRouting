//
//  GameScene.m
//  MapRoutingGame
//
//  Created by zxiao23 on 5/27/21.
//  Copyright © 2021 zxiao23. All rights reserved.
// Here is the last part tp finish. It is
//

#import "GameScene.h"
#import "Dijkstras.h"
#import "Node.h"

@implementation GameScene {
    SKLabelNode *_label;
}

- (void)didMoveToView:(SKView *)view {
    // Setup your scene here
    Dijkstras *myGraph = [[Dijkstras alloc]init];
    // Get label node from scene and store it for use later
//    _label = (SKLabelNode *)[self childNodeWithName:@"//helloLabel"];
    
    for(int i = 0; i < [myGraph.vertices count]; i++){
        Node *cur = myGraph.vertices[i];
        SKShapeNode *newNode = [SKShapeNode shapeNodeWithCircleOfRadius:1];
        newNode.position = CGPointMake((cur.x-1800), (cur.y-2400));
        [self addChild:newNode];
    }
}


- (void)touchDownAtPoint:(CGPoint)pos {
    
}

- (void)touchMovedToPoint:(CGPoint)pos {
    
}

- (void)touchUpAtPoint:(CGPoint)pos {
    
}

- (void)keyDown:(NSEvent *)theEvent {
    switch (theEvent.keyCode) {
        case 0x31 /* SPACE */:
            // Run 'Pulse' action from 'Actions.sks'
            break;
            
        default:
            NSLog(@"keyDown:'%@' keyCode: 0x%02X", theEvent.characters, theEvent.keyCode);
            break;
    }
}

- (void)mouseDown:(NSEvent *)theEvent {
    [self touchDownAtPoint:[theEvent locationInNode:self]];
}
- (void)mouseDragged:(NSEvent *)theEvent {
    [self touchMovedToPoint:[theEvent locationInNode:self]];
}
- (void)mouseUp:(NSEvent *)theEvent {
    [self touchUpAtPoint:[theEvent locationInNode:self]];
}


-(void)update:(CFTimeInterval)currentTime {
    // Called before each frame is rendered
}

@end
