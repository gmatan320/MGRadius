//
//  BaseSupplierCollectionViewCell.m
//  WeFix


#import "BaseSupplierCollectionViewCell.h"

@interface BaseSupplierCollectionViewCell ()

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topSpaceConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *leftSpaceConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *rightSpaceConstraint;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *bottomSpaceConstraint;
@end

@implementation BaseSupplierCollectionViewCell

+ (UINib*)nib {
    return [UINib nibWithNibName: NSStringFromClass([self class]) bundle: nil];
}

+ (NSString*)identifier {
    return NSStringFromClass([self class]);
}

+ (CGSize)heightWithCollectionViewWidth: (CGFloat) collectionViewWidth
{
    return CGSizeMake(0, 0);
}

+ (CGSize)heightWithCollectionViewWidth: (CGFloat) collectionViewWidth andContent:(id)content
{
    return CGSizeMake(0, 0);
}

-(void)awakeFromNib {
    [super awakeFromNib];
}

- (void)setCellBordersForState
{
    if (self.cellType == CellTypeLeftTop) {
        self.topSpaceConstraint.constant = 2;
        self.leftSpaceConstraint.constant = 0;
        self.rightSpaceConstraint.constant = 1;
        self.bottomSpaceConstraint.constant = 1;
    }else if (self.cellType == CellTypeTop){
        self.topSpaceConstraint.constant = 2;
        self.leftSpaceConstraint.constant = 1;
        self.rightSpaceConstraint.constant = 1;
        self.bottomSpaceConstraint.constant = 1;
    }else if (self.cellType == CellTypeRightTop){
        self.topSpaceConstraint.constant = 2;
        self.leftSpaceConstraint.constant = 1;
        self.rightSpaceConstraint.constant = 0;
        self.bottomSpaceConstraint.constant = 1;
    }else if (self.cellType == CellTypeLeft){
        self.topSpaceConstraint.constant = 1;
        self.leftSpaceConstraint.constant = 0;
        self.rightSpaceConstraint.constant = 1;
        self.bottomSpaceConstraint.constant = 1;
    }else if (self.cellType == CellTypeCenter){
        self.topSpaceConstraint.constant = 1;
        self.leftSpaceConstraint.constant = 1;
        self.rightSpaceConstraint.constant = 1;
        self.bottomSpaceConstraint.constant = 1;
    }else if (self.cellType == CellTypeRight){
        self.topSpaceConstraint.constant = 1;
        self.leftSpaceConstraint.constant = 1;
        self.rightSpaceConstraint.constant = 0;
        self.bottomSpaceConstraint.constant = 1;
    }else if (self.cellType == CellTypeLeftBottom){
        self.topSpaceConstraint.constant = 1;
        self.leftSpaceConstraint.constant = 0;
        self.rightSpaceConstraint.constant = 1;
        self.bottomSpaceConstraint.constant = 2;
    }else if (self.cellType == CellTypeBottom){
        self.topSpaceConstraint.constant = 1;
        self.leftSpaceConstraint.constant = 1;
        self.rightSpaceConstraint.constant = 1;
        self.bottomSpaceConstraint.constant = 2;
    }else if (self.cellType == CellTypeRightBottom){
        self.topSpaceConstraint.constant = 1;
        self.leftSpaceConstraint.constant = 1;
        self.rightSpaceConstraint.constant = 0;
        self.bottomSpaceConstraint.constant = 2;
    }
}

@end
