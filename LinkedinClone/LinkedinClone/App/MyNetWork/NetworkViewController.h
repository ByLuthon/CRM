//
//  NetworkViewController.h
//  LinkedinClone
//
//  Created by macmini on 27/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"


@interface NetworkViewController : UIViewController
{
    
    __weak IBOutlet UIView *view_connectionHeader;
    __weak IBOutlet UIView *view_peopleHeader;
    
    __weak IBOutlet UITableView *tbl;
}
- (IBAction)profile:(id)sender;
- (IBAction)connecions:(id)sender;
- (IBAction)findConnections:(id)sender;

@end
