//
//  MovingCustomView.m
//  WeFix
//
//  Created by Matan Genezia on 14/02/2018.
//  Copyright © 2018 ininja. All rights reserved.
//

#import "MovingCustomView.h"

@interface MovingCustomView ()

@end

@implementation MovingCustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.allObjects[0];
    if ([self.delegate respondsToSelector: @selector(MovingCustomView:didStartDragingWithUITouch:)]) {
        [self.delegate MovingCustomView: self didStartDragingWithUITouch: touch];
    }
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.allObjects[0];
    if ([self.delegate respondsToSelector: @selector(MovingCustomView:movedDragingWithUITouch:)]) {
        [self.delegate MovingCustomView:self movedDragingWithUITouch: touch];
    }
}

-(void)touchesEnded:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    UITouch *touch = touches.allObjects[0];
//    CGPoint r = [touch locationInView: self];
//    self.frame = CGRectMake(r.x,
//                            self.y,
//                            self.width,
//                            self.height);
    
    if ([self.delegate respondsToSelector: @selector(MovingCustomView:endDragingWithUITouch:)]) {
        [self.delegate MovingCustomView:self endDragingWithUITouch: touch];
    }
    
}

@end
