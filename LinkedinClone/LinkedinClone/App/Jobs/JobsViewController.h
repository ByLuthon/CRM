//
//  JobsViewController.h
//  LinkedinClone
//
//  Created by macmini on 03/03/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface JobsViewController : UIViewController
{
    
    __weak IBOutlet UITableView *tbl;
    IBOutlet UIView *view_headerProfile;
    IBOutlet UIView *view_headerJobs;
    IBOutlet UIView *view_headerCompanies;
}
- (IBAction)search:(id)sender;
- (IBAction)profile:(id)sender;

@end
