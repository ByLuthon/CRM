//
//  ProfileViewController.m
//  LinkedinClone
//
//  Created by macmini on 27/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "ProfileViewController.h"

@interface ProfileViewController ()

@end

@implementation ProfileViewController
@synthesize strUserName, isLoginUser;

- (void)viewDidLoad
{
    [self setInitParam];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)setInitParam
{
    searchbar.text = strUserName;
    
    if (isLoginUser)
    {
        for (UIView *view in view_tableHeader.subviews)
        {
            if (view.tag == 10)
            {
                // border radius
                [view.layer setCornerRadius:view.frame.size.height/2];
                // border
                [view.layer setBorderColor:[UIColor whiteColor].CGColor];
                [view.layer setBorderWidth:5.0];
                // drop shadow
                [view.layer setShadowColor:[UIColor grayColor].CGColor];
                [view.layer setShadowOpacity:0.8];
                [view.layer setShadowRadius:0.8];
                [view.layer setShadowOffset:CGSizeMake(1.0,1.0)];
                
                //[APP_DELEGATE setBorderToView:view withBorderWidth:5 radious:view.frame.size.height/2 color:[UIColor whiteColor]];
            }
            else
            {
                // border radius
                [view.layer setCornerRadius:5.0f];
                // border
                [view.layer setBorderColor:[UIColor lightGrayColor].CGColor];
                [view.layer setBorderWidth:0.0f];
                // drop shadow
                [view.layer setShadowColor:[UIColor grayColor].CGColor];
                [view.layer setShadowOpacity:0.8];
                [view.layer setShadowRadius:0.5];
                [view.layer setShadowOffset:CGSizeMake(0.5, 0.5)];
                
                
                if (view.tag == 70)
                {
                    for (UIView *view1 in view.subviews)
                    {
                        [APP_DELEGATE setBorderToView:view1 withBorderWidth:0 radious:15 color:[UIColor clearColor]];
                    }
                }
            }
        }
        
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = lbl_grediantBG.bounds;
        gradientLayer.colors = [NSArray arrayWithObjects:(id)[view_tableHeader.backgroundColor CGColor],(id)[view_tableHeader.backgroundColor CGColor],(id)[view_tableHeader.backgroundColor CGColor],(id)[view_tableHeader.backgroundColor CGColor],(id)[self.view.backgroundColor CGColor], (id)[self.view.backgroundColor CGColor], nil];
        [lbl_grediantBG.layer insertSublayer:gradientLayer atIndex:0];
        
        
        view_tableHeader.backgroundColor = [UIColor clearColor];
        
        DTParallaxHeaderView *headerView = [[DTParallaxHeaderView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 100) withImage:[UIImage imageNamed:@"46955447-background-image.png"] withTabBar:nil];
        
        //    DTHeaderView *headerView = [[DTHeaderView alloc] initWithFrame:CGRectMake(0, 0, 320, 200) withImageUrl:@"http://s3.favim.com/orig/47/colorful-fun-girl-night-ocean-Favim.com-437603.jpg" withTabBar:tabbar];
        
        [_tbl setDTHeaderView:headerView];
        _tbl.showShadow = NO;
        
        [_tbl reloadData];
    }
    else
    {
        for (UIView *view in view_OtherUserHeader.subviews)
        {
            if (view.tag == 10)
            {
                // border radius
                [view.layer setCornerRadius:view.frame.size.height/2];
                // border
                [view.layer setBorderColor:[UIColor whiteColor].CGColor];
                [view.layer setBorderWidth:5.0];
                // drop shadow
                [view.layer setShadowColor:[UIColor grayColor].CGColor];
                [view.layer setShadowOpacity:0.8];
                [view.layer setShadowRadius:0.8];
                [view.layer setShadowOffset:CGSizeMake(1.0,1.0)];
            }
            else
            {
                // border radius
                [view.layer setCornerRadius:5.0f];
                // border
                [view.layer setBorderColor:[UIColor lightGrayColor].CGColor];
                [view.layer setBorderWidth:0.0f];
                // drop shadow
                [view.layer setShadowColor:[UIColor grayColor].CGColor];
                [view.layer setShadowOpacity:0.8];
                [view.layer setShadowRadius:0.5];
                [view.layer setShadowOffset:CGSizeMake(0.5, 0.5)];
                
                
                if (view.tag == 70)
                {
                    for (UIView *view1 in view.subviews)
                    {
                        [APP_DELEGATE setBorderToView:view1 withBorderWidth:0 radious:15 color:[UIColor clearColor]];
                    }
                }
            }
        }
        
        CAGradientLayer *gradientLayer = [CAGradientLayer layer];
        gradientLayer.frame = lbl_OtheUserGradiantBG.bounds;
        gradientLayer.colors = [NSArray arrayWithObjects:(id)[view_tableHeader.backgroundColor CGColor],(id)[view_tableHeader.backgroundColor CGColor],(id)[view_tableHeader.backgroundColor CGColor],(id)[view_tableHeader.backgroundColor CGColor],(id)[self.view.backgroundColor CGColor], (id)[self.view.backgroundColor CGColor], nil];
        [lbl_OtheUserGradiantBG.layer insertSublayer:gradientLayer atIndex:0];
        
        
        view_OtherUserHeader.backgroundColor = [UIColor clearColor];
        
        DTParallaxHeaderView *headerView = [[DTParallaxHeaderView alloc] initWithFrame:CGRectMake(0, 0, WIDTH, 100) withImage:[UIImage imageNamed:@"46955447-background-image.png"] withTabBar:nil];
        
        [_tbl setDTHeaderView:headerView];
        _tbl.showShadow = NO;
        
        [_tbl reloadData];
    }
    
    [self.view bringSubviewToFront:view_navigation];
}

/*
 #pragma mark - Navigation
 
 // In a storyboard-based application, you will often want to do a little preparation before navigation
 - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
 // Get the new view controller using [segue destinationViewController].
 // Pass the selected object to the new view controller.
 }
 */

- (IBAction)Back:(id)sender
{
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)search:(id)sender {
}


#pragma mark - Tableview Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (isLoginUser)
    {
        return view_tableHeader;
    }
    else
    {
        return view_OtherUserHeader;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (isLoginUser)
    {
        return view_tableHeader.frame.size.height;
    }
    else
    {
        return view_OtherUserHeader.frame.size.height;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 85;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 15;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_user *cell = (Cell_user *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_user" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor clearColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    ProfileViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
    move.strUserName = @"Emma Watson";
    move.isLoginUser = NO;
    [self.navigationController pushViewController:move animated:YES];
}

@end
