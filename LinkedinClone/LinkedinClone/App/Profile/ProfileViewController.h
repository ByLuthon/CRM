//
//  ProfileViewController.h
//  LinkedinClone
//
//  Created by macmini on 27/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"
#import "DTParallaxTableView.h"

@interface ProfileViewController : UIViewController
{
    __weak IBOutlet UIView *view_navigation;
    __weak IBOutlet UISearchBar *searchbar;

    __weak IBOutlet UILabel *lbl_grediantBG;
    __weak IBOutlet UILabel *lbl_OtheUserGradiantBG;
    IBOutlet UIView *view_tableHeader;
    IBOutlet UIView *view_OtherUserHeader;
    __weak IBOutlet UIProgressView *progressView;
}
@property (nonatomic, retain) NSString *strUserName;
@property (readwrite) BOOL isLoginUser;


@property (weak, nonatomic) IBOutlet DTParallaxTableView *tbl;

- (IBAction)Back:(id)sender;
- (IBAction)search:(id)sender;

@end
