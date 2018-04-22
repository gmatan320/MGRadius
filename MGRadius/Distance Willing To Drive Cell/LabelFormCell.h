//
//  LabelFormCell.h
//  WeFix
//
//  Created by Matan Genezia on 14/02/2018.
//  Copyright © 2018 ininja. All rights reserved.
//

#import "BaseSupplierCollectionViewCell.h"

//@protocol LabelFormCellDelegate;

@interface LabelFormCell : BaseSupplierCollectionViewCell
@property (weak, nonatomic) IBOutlet UILabel    *lblDistanceInKm;
@property (nonatomic)       BOOL                isEditMode;
//@property (weak, nonatomic) id<LabelFormCellDelegate> delegate;
@end


//@protocol LabelFormCellDelegate <NSObject>
//- (void) LabelFormCell: (LabelFormCell *) cell didSelectItemInIndexPath: (NSIndexPath *) indexPath;
//
//@end

//
//@protocol RegisterDescriptionSupplierFormCellDelegate;
//
//@interface RegisterDescriptionSupplierFormCell : BaseSupplierCollectionViewCell
//@property (weak, nonatomic) id <RegisterDescriptionSupplierFormCellDelegate> delegate;
//
//@property (strong, nonatomic) IBOutlet  UIImageView *avatarImageView;
//@property (nonatomic)                   NSString    *supplierDescription;
//
//@end
//
//@protocol RegisterDescriptionSupplierFormCellDelegate <NSObject>
//
//- (void) updateTempDataSourceValue:(id)value key:(NSString*)key;
//- (void) RegisterDescriptionSupplierFormCell: (RegisterDescriptionSupplierFormCell *) supplierCell textFieldDidChange: (int) numberOfChars;
//
//@end

