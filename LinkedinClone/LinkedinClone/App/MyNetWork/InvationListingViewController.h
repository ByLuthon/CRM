//
//  InvationListingViewController.h
//  LinkedinClone
//
//  Created by macmini on 02/03/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface InvationListingViewController : UIViewController
{
    
    __weak IBOutlet UITableView *tbl;
    __weak IBOutlet UISegmentedControl *segmentController;
    
    int tableMethod;
}
- (IBAction)saegmentValueChanged:(id)sender;
- (IBAction)Close:(id)sender;

@end
