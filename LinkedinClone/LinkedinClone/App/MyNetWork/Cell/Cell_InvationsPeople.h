//
//  Cell_InvationsPeople.h
//  LinkedinClone
//
//  Created by macmini on 01/03/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Cell_InvationsPeople : UITableViewCell
{
    
}
@property (weak, nonatomic) IBOutlet UILabel *lbl_title;
@property (weak, nonatomic) IBOutlet UIButton *profile;
@property (weak, nonatomic) IBOutlet UIButton *more;
@property (weak, nonatomic) IBOutlet UIButton *AddPeople;
@property (weak, nonatomic) IBOutlet UIButton *withdraw;
@property (weak, nonatomic) IBOutlet UIView *subview_mutual;

@end
