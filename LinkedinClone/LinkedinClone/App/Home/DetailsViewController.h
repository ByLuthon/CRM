//
//  DetailsViewController.h
//  LinkedinClone
//
//  Created by macmini on 03/03/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface DetailsViewController : UIViewController
{
    __weak IBOutlet UIView *view_navigation;
    __weak IBOutlet UIScrollView *scrl;
    __weak IBOutlet UIView *view_AddPost;
    __weak IBOutlet UIButton *btn_AddPost;
    __weak IBOutlet UIView *subview_likes;
    __weak IBOutlet UIView *subview_comment;
    __weak IBOutlet UITableView *tbl;
    
    
    IBOutlet UIView *subview_scrl;

}
- (IBAction)Back:(id)sender;

@end
