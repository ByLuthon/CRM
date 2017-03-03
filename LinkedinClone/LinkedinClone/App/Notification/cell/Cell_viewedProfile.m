//
//  Cell_viewedProfile.m
//  LinkedinClone
//
//  Created by macmini on 02/03/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "Cell_viewedProfile.h"

@implementation Cell_viewedProfile

- (void)awakeFromNib
{
    // border radius
    [_subview.layer setCornerRadius:0.0f];
    // border
    [_subview.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [_subview.layer setBorderWidth:0.0f];
    // drop shadow
    [_subview.layer setShadowColor:[UIColor grayColor].CGColor];
    [_subview.layer setShadowOpacity:0.8];
    [_subview.layer setShadowRadius:1.0];
    [_subview.layer setShadowOffset:CGSizeMake(0.8, 0.8)];

    
    [_lbl_title sizeToFit];

    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
