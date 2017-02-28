//
//  ViewController.h
//  LinkedinClone
//
//  Created by macmini on 27/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface ViewController : UIViewController
{
    
    __weak IBOutlet UIScrollView *scrl;
    IBOutlet UIView *subview;
    __weak IBOutlet UIPageControl *pagController;
    __weak IBOutlet UIButton *btnJoinNow;
    __weak IBOutlet UIButton *btnSignIn;
}
- (IBAction)pagecontrollerValueChanged:(id)sender;

- (IBAction)JoinNow:(id)sender;
- (IBAction)SignIn:(id)sender;

@end

