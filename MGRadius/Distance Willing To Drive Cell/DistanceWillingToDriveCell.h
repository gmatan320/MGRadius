//
//  DistanceWillingToDriveCell.h
//  WeFix
//
//  Created by Matan Genezia on 13/02/2018.
//  Copyright © 2018 ininja. All rights reserved.
//

#import "BaseSupplierCollectionViewCell.h"

typedef enum : NSUInteger {
    FIRST,
    SECOND,
    THIRD,
    FOURTH,
    FIFTH
} KmWillingToDriveIndex;

@protocol DistanceWillingToDriveDelegate;

@interface DistanceWillingToDriveCell : BaseSupplierCollectionViewCell

@property (nonatomic, strong) id<DistanceWillingToDriveDelegate> delegate;
@property (nonatomic) BOOL isEditMode;
- (void) setKmTextWithIntegersArray: (NSArray *) intArr;
- (int) getRadiusKM;
- (void) setRadiusKM: (int) radius;
+ (CGSize) heightWithCollectionViewWidth:(CGFloat)collectionViewWidth;
- (void) setUserInteraction: (BOOL) available;
- (void) setMainColor: (UIColor *) color;
- (void) setTitle: (NSString *) title;
+ (void) initializeCellForCollectionView: (UICollectionView *) collectionView;

@end

@protocol DistanceWillingToDriveDelegate <NSObject>

-(void) distanceWillingToDrivedidStartMove: (DistanceWillingToDriveCell *) cell;
-(void) distanceWillingToDrivedidEndMove: (DistanceWillingToDriveCell *) cell;

@end
