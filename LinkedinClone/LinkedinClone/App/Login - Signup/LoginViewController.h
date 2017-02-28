//
//  LoginViewController.h
//  LinkedinClone
//
//  Created by macmini on 27/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface LoginViewController : UIViewController
{
    
    __weak IBOutlet UITextField *txt_emailOrPhone;
    __weak IBOutlet UITextField *txt_password;
}
- (IBAction)SignIn:(id)sender;
- (IBAction)close:(id)sender;
- (IBAction)ForgotPassword:(id)sender;
- (IBAction)JoinNow:(id)sender;

@end
