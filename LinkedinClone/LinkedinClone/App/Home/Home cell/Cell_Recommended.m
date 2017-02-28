//
//  Cell_Recommended.m
//  LinkedinClone
//
//  Created by macmini on 27/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "Cell_Recommended.h"

@implementation Cell_Recommended

- (void)awakeFromNib
{
    // border radius
    [_mainsubview.layer setCornerRadius:0.0f];
    // border
    [_mainsubview.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [_mainsubview.layer setBorderWidth:0.0f];
    // drop shadow
    [_mainsubview.layer setShadowColor:[UIColor grayColor].CGColor];
    [_mainsubview.layer setShadowOpacity:0.8];
    [_mainsubview.layer setShadowRadius:1.0];
    [_mainsubview.layer setShadowOffset:CGSizeMake(0.8, 0.8)];

    [APP_DELEGATE setBorderToView:_subview withBorderWidth:0.5 radious:1 color:[UIColor lightGrayColor]];
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
