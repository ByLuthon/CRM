//
//  FindConnectionViewController.h
//  LinkedinClone
//
//  Created by macmini on 02/03/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface FindConnectionViewController : UIViewController
{
    
    __weak IBOutlet UITableView *tbl;
    IBOutlet UIView *view_header;
}
- (IBAction)close:(id)sender;

@end
