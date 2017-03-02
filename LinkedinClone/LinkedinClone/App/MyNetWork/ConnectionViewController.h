//
//  ConnectionViewController.h
//  LinkedinClone
//
//  Created by macmini on 02/03/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface ConnectionViewController : UIViewController
{
    NSArray *sections;
    NSMutableArray *arrConnecction;
    
    __weak IBOutlet UITableView *tbl;
}
- (IBAction)sort:(id)sender;
- (IBAction)Close:(id)sender;

@end
