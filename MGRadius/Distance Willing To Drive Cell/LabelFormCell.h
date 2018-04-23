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
@end
