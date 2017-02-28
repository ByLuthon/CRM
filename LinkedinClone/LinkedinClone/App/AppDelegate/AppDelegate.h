//
//  AppDelegate.h
//  LinkedinClone
//
//  Created by macmini on 27/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface AppDelegate : UIResponder <UIApplicationDelegate>
{
    
}

@property (strong, nonatomic) UIWindow *window;
@property (nonatomic, retain) UITabBarController *tabbar;

-(void)redirectHomeController;
-(void)setBorderToView:(UIView *)view withBorderWidth:(float)width radious:(float)radious color:(UIColor *)bordercolor;

@end

