//
//  NotificationViewController.h
//  LinkedinClone
//
//  Created by macmini on 27/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface NotificationViewController : UIViewController
{
    NSMutableArray *arrNotificationList;
    
    
    __weak IBOutlet UIView *view_navigation;
    __weak IBOutlet UIView *subview_Search;
    __weak IBOutlet UITableView *tbl;
}
- (IBAction)profile:(id)sender;
- (IBAction)search:(id)sender;

@end
