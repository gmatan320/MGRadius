//
//  DistanceWillingToDriveCell.m
//  WeFix
//
//  Created by Matan Genezia on 13/02/2018.
//  Copyright © 2018 ininja. All rights reserved.
//

#import "DistanceWillingToDriveCell.h"
#import "LabelFormCell.h"
#import "MovingCustomView.h"

@interface DistanceWillingToDriveCell () <UICollectionViewDataSource, UICollectionViewDelegate, MovingCustomViewDelegate>

@property (weak, nonatomic) IBOutlet    UIView                  *containerView;
@property (weak, nonatomic) IBOutlet    UILabel                 *lblTitle;
@property (weak, nonatomic) IBOutlet    MovingCustomView        *viewForCarMove;
@property (weak, nonatomic) IBOutlet    UIImageView             *imgViewCar;
@property (weak, nonatomic) IBOutlet    UIView                  *lineView;
@property (weak, nonatomic) IBOutlet    MovingCustomView        *pointView;
@property (weak, nonatomic) IBOutlet    UICollectionView        *collectionView;

@property (nonatomic)                   NSArray                 *kmTxtArr;
@property (nonatomic)                   NSMutableArray          *xPositionArr;
@property (nonatomic)                   KmWillingToDriveIndex   kmWillingToDrive;


@end

@implementation DistanceWillingToDriveCell

- (void)awakeFromNib {
    [super awakeFromNib];
    [self registerNibs];
    [self setLocalization];
    [self setKmTextArray];
    self.xPositionArr = [NSMutableArray array];
    self.viewForCarMove.delegate = self;
    self.pointView.delegate = self;
    self.collectionView.delegate = self;
    self.collectionView.dataSource = self;
}

- (void) registerNibs {
    [self.collectionView registerNib: [LabelFormCell nib] forCellWithReuseIdentifier: [LabelFormCell identifier]];
}

- (void) setLocalization {
    self.lblTitle.text = @"will be";
}

+ (void)initializeCellForCollectionView:(UICollectionView *)collectionView {
    NSBundle *bundle = [NSBundle bundleForClass: [DistanceWillingToDriveCell class]];
    [bundle loadNibNamed: @"DistanceWillingToDriveCell" owner: nil options: nil];
    [collectionView registerNib: [DistanceWillingToDriveCell nib] forCellWithReuseIdentifier: [DistanceWillingToDriveCell identifier]];
}



- (void) setKmTextArray {
//    self.kmTxtArr = [[NSArray alloc]initWithObjects: @50, @40, @30, @20, @10, nil];
    self.kmTxtArr = [[NSArray alloc]initWithObjects: @150, @100, @50, @25, @10, nil];
}

- (void) moveCarImageToFrame: (CGFloat) centerX animation: (BOOL) animated {
    if (animated && centerX > self.viewForCarMove.center.x) {
        [UIView animateWithDuration:0.22
                         animations:^{
                             [self.imgViewCar setTransform: CGAffineTransformMakeScale(-1, 1)];
                         } completion:^(BOOL finished) {
                             [UIView animateWithDuration:0.2
                                              animations:^{
                                                  [self.viewForCarMove setCenter: CGPointMake(centerX, self.viewForCarMove.center.y)];
                                                  [self.pointView setCenter: CGPointMake(centerX, self.pointView.center.y)];
                                              } completion:^(BOOL finished) {
                                                  [UIView animateWithDuration:0.22
                                                                   animations:^{
                                                                       [self.imgViewCar setTransform: CGAffineTransformMake(1,
                                                                                                                            0,
                                                                                                                            0,
                                                                                                                            1,
                                                                                                                            0,
                                                                                                                            0)];
                                                                   }];
                                              }];
                         }];
    }
    else {
        [UIView animateWithDuration:0.2
                         animations:^{
                             [self.viewForCarMove setCenter: CGPointMake(centerX, self.viewForCarMove.center.y)];
                             [self.pointView setCenter: CGPointMake(centerX, self.pointView.center.y)];
                         }];
    }
}

- (int) getRadiusKM {
    switch (self.kmWillingToDrive) {
        case FIRST:
            return 10;
            break;
        case SECOND:
            return 25;
            break;
        case THIRD:
            return 50;
            break;
        case FOURTH:
            return 100;
            break;
        case FIFTH:
            return 150;
            break;
        default:
            return 0;
            break;
    }
}

- (void) setRadiusKM: (int) radius {
    int kmWillingToDrive = 0;
    
    if (radius < 18) {
        kmWillingToDrive = FIRST;
    }
    else if (radius >= 18 && radius < 38) {
        kmWillingToDrive = SECOND;
    }
    else if (radius >= 38 && radius < 75) {
        kmWillingToDrive = THIRD;
    }
    else if (radius >= 75 && radius < 125) {
        kmWillingToDrive = FOURTH;
    }
    else if (radius >= 125) {
        kmWillingToDrive = FIFTH;
    }
    self.kmWillingToDrive = kmWillingToDrive;
    
    if (kmWillingToDrive != THIRD) {
        int index = (int)self.xPositionArr.count - kmWillingToDrive - 1;
        [self moveCarImageToFrame: [self.xPositionArr[index] floatValue] animation:YES];
    }
}

-(void)setKmWillingToDrive:(KmWillingToDriveIndex) kmWillingToDrive {
    _kmWillingToDrive = kmWillingToDrive;
//    if (self.xPositionArr.count) {
//        CGFloat centerX = (int)[self.xPositionArr[kmWillingToDrive] floatValue];
//        [self moveCarImageToFrame: centerX animation:YES];
//    }
}

- (void) setUserInteraction: (BOOL) available {
    [self setUserInteractionEnabled: available];
    self.imgViewCar.image = [self.imgViewCar.image imageWithRenderingMode:UIImageRenderingModeAlwaysTemplate];
    if (available) {
        self.imgViewCar.tintColor = [UIColor blueColor];
        self.pointView.backgroundColor = [UIColor blueColor];
    }
    else {
        UIColor* defaultDray = [UIColor colorWithRed: 164.0 / 255 green:166.0 / 255 blue: 180.0 / 255 alpha: 1.0];
        self.imgViewCar.tintColor = defaultDray;
        self.pointView.backgroundColor = defaultDray;
    }
}



#pragma mark - collection view data source

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    return self.kmTxtArr.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    LabelFormCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier: [LabelFormCell identifier] forIndexPath: indexPath];
    cell.isEditMode = self.isEditMode;
    NSString *plus = @"";
    if (indexPath.item == 0) {
        plus = @"+";
    }
    NSString *text = [NSString stringWithFormat: @"%@%@",   [NSNumber numberWithInteger: [self.kmTxtArr[indexPath.item] integerValue]],
                                                            plus];
    [cell.lblDistanceInKm setText: text];
    [self.xPositionArr addObject: [NSNumber numberWithFloat: cell.center.x + 50]];
    return cell;
}

# pragma mark - collection view delegate

- (CGSize) collectionView:(UICollectionView *)collectionView
                   layout:(nonnull UICollectionViewLayout *)collectionViewLayout
   sizeForItemAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return CGSizeMake(collectionView.frame.size.width / (self.kmTxtArr.count + 2), collectionView.frame.size.height);
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    LabelFormCell *cell = (LabelFormCell *) [collectionView cellForItemAtIndexPath: indexPath];
    CGFloat centerX = cell.center.x + 50;
    self.kmWillingToDrive = 4 - indexPath.item;
    [self moveCarImageToFrame: centerX animation:YES];
    
}

# pragma mark - Moving custom view delegate methods

- (void)MovingCustomView:(MovingCustomView *)view endDragingWithUITouch:(UITouch *)touch {
    CGPoint movementPoint = [touch locationInView: self];
    int movementX = (int) movementPoint.x;
    int differenceBetweenCells = (int)[self.xPositionArr[1] floatValue] - (int)[self.xPositionArr[0] floatValue];
    int minimalX = [self.xPositionArr[0] intValue];
    int maximalX = [self.xPositionArr[self.xPositionArr.count - 1] intValue];
    
    if (movementX < minimalX) {
        self.kmWillingToDrive = FIFTH;
        [self moveCarImageToFrame: minimalX animation:NO];
    }
    else if (movementX > maximalX) {
        self.kmWillingToDrive = FIRST;
        [self moveCarImageToFrame: maximalX animation:NO];
    }
    else {
        for (int i = 0; i < self.xPositionArr.count; i++) {
            int xPosition = (int)[self.xPositionArr[i] floatValue];
            int movementMinus10 = xPosition - differenceBetweenCells / 2 - 1;
            int movementPlus10 = xPosition + differenceBetweenCells / 2 + 1;
            if ((movementX == xPosition) ||
                (movementX >= movementMinus10 && movementX <= movementPlus10)) {
                self.kmWillingToDrive = 4 - i;
                [self moveCarImageToFrame: xPosition animation:NO];
            }
        }
    }
    
    if ([self.delegate respondsToSelector: @selector(distanceWillingToDrivedidEndMove:)]) {
        [self.delegate distanceWillingToDrivedidEndMove: self];
    }
}

-(void)MovingCustomView:(MovingCustomView *)view movedDragingWithUITouch:(UITouch *)touch {
    int movementX = (int) [touch locationInView: self].x;
    if (movementX > self.lineView.frame.origin.x && movementX < self.lineView.frame.origin.x + self.lineView.frame.size.width) {
        [self.viewForCarMove setCenter: CGPointMake(movementX, self.viewForCarMove.center.y)];
        [self.pointView setCenter: CGPointMake(movementX, self.pointView.center.y)];
    }
}

-(void) MovingCustomView:(MovingCustomView *)view didStartDragingWithUITouch:(UITouch *)touch {
    if ([self.delegate respondsToSelector: @selector(distanceWillingToDrivedidStartMove:)]) {
        [self.delegate distanceWillingToDrivedidStartMove: self];
    }
}



#pragma mark - static methods
+ (CGSize) heightWithCollectionViewWidth:(CGFloat)collectionViewWidth {
    return CGSizeMake(collectionViewWidth, 175);
}


@end
