//
//  MovingCustomView.h
//  WeFix
//
//  Created by Matan Genezia on 14/02/2018.
//  Copyright © 2018 ininja. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol MovingCustomViewDelegate;

@interface MovingCustomView : UIView

@property (weak, nonatomic) id<MovingCustomViewDelegate>    delegate;
@property (nonatomic)       BOOL                            isEditMode;

@end

@protocol MovingCustomViewDelegate <NSObject>

- (void) MovingCustomView: (MovingCustomView *) view didStartDragingWithUITouch: (UITouch *) touch;
- (void) MovingCustomView: (MovingCustomView *) view movedDragingWithUITouch: (UITouch *) touch;
- (void) MovingCustomView: (MovingCustomView *) view endDragingWithUITouch: (UITouch *) touch;

@end

