//
//  SignupViewController.h
//  LinkedinClone
//
//  Created by macmini on 27/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface SignupViewController : UIViewController
{
    
    __weak IBOutlet UITextField *txt_firstName;
    __weak IBOutlet UITextField *txt_lastName;
    __weak IBOutlet UITextField *txt_email;
    __weak IBOutlet UITextField *txt_password;
}
- (IBAction)close:(id)sender;
- (IBAction)joinNow:(id)sender;
- (IBAction)AlreadyAccount:(id)sender;

@end
