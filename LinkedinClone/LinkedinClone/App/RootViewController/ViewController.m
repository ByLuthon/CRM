//
//  ViewController.m
//  LinkedinClone
//
//  Created by macmini on 27/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    self.navigationController.navigationBarHidden = TRUE;
    
    [self setInitParam];
    
    
    
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)setInitParam
{
    /*
    for (UIView *view in subview.subviews)
    {
        CGRect f = view.frame;
        f.size.width = WIDTH;
        view.frame = f;
    }
     */
 
    subview.frame = CGRectMake(0, 0, WIDTH*4, HEIGHT);
    
    [scrl addSubview:subview];
    scrl.contentSize = CGSizeMake(subview.frame.size.width, 0);
    scrl.pagingEnabled = TRUE;
    pagController.currentPage = 0;

    
    scrl.showsVerticalScrollIndicator = FALSE;
    scrl.showsHorizontalScrollIndicator = FALSE;

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark - ScrollView Delegate
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrllView
{
    CGFloat pageWidth = scrllView.frame.size.width;
    int page = floor((scrllView.contentOffset.x - pageWidth / 2) / pageWidth) + 1;
    
    NSLog(@"%d",page);
    pagController.currentPage = page;
    
    if (page == 0)
    {
        btnJoinNow.backgroundColor = ColorFromHEX(@"368BD7");
        [btnJoinNow setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        btnJoinNow.layer.borderWidth = 0;
        btnJoinNow.layer.borderColor = [[UIColor clearColor] CGColor];
        btnJoinNow.layer.cornerRadius = 0.0;
        btnJoinNow.layer.masksToBounds = YES;
        
    }
    else
    {
        btnJoinNow.backgroundColor = [UIColor clearColor];
        [btnJoinNow setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
        btnJoinNow.layer.borderWidth = 1;
        btnJoinNow.layer.borderColor = [[UIColor whiteColor] CGColor];
        btnJoinNow.layer.cornerRadius = 5.0;
        btnJoinNow.layer.masksToBounds = YES;
    }
    btnSignIn.backgroundColor = btnJoinNow.backgroundColor;


}


- (IBAction)pagecontrollerValueChanged:(id)sender {
}

- (IBAction)JoinNow:(id)sender
{
    SignupViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"SignupViewController"];
    [self presentViewController:move animated:YES completion:nil];
}

- (IBAction)SignIn:(id)sender
{
    LoginViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"LoginViewController"];
    [self presentViewController:move animated:YES completion:nil];
}
@end
