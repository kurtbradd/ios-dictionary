//
//  KBCardViewCell.h
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-09.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface KBCardViewCell : UICollectionViewCell

@property (nonatomic, strong) IBOutlet UILabel *titleLabel;
@property (strong, nonatomic) IBOutlet UIView *innerCard;
@property (strong, nonatomic) IBOutlet UILabel *wordType;

@end
