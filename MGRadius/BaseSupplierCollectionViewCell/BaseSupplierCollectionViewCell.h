//
//  BaseSupplierCollectionViewCell.h
//  WeFix


#import <UIKit/UIKit.h>
//#import "Constants.h"
//#import "BaseViewController.h"

@protocol  BaseSupplierCollectionViewCellDelegate

-(void)requestModelDidChange;

@end

typedef enum : NSUInteger {
    CellTypeTop,
    CellTypeLeftTop,
    CellTypeRightTop,
    CellTypeLeft,
    CellTypeCenter,
    CellTypeRight,
    CellTypeBottom,
    CellTypeLeftBottom,
    CellTypeRightBottom
} CellType;


@interface BaseSupplierCollectionViewCell : UICollectionViewCell

@property (assign, nonatomic) CellType cellType;
@property (weak, nonatomic) id <BaseSupplierCollectionViewCellDelegate> baseDelegate;
//@property (strong, nonatomic) RequestModel *requestModel;

+ (UINib*)nib;

+ (NSString*)identifier;

+ (CGSize)heightWithCollectionViewWidth: (CGFloat) collectionViewWidth;

+ (CGSize)heightWithCollectionViewWidth: (CGFloat) collectionViewWidth andContent:(id)content;

- (void)setCellBordersForState;


@end
