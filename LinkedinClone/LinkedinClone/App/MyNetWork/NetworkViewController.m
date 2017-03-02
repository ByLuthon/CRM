//
//  NetworkViewController.m
//  LinkedinClone
//
//  Created by macmini on 27/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "NetworkViewController.h"

@interface NetworkViewController ()

@end

@implementation NetworkViewController

- (void)viewDidLoad
{
    self.navigationController.navigationBarHidden = TRUE;
    
    [self setInitparam];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setInitparam
{
    [tbl reloadData];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)profile:(id)sender
{
    ProfileViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
    move.strUserName = @"Bhavesh Nayi";
    move.isLoginUser = YES;
    [self.navigationController pushViewController:move animated:YES];
}

- (IBAction)connecions:(id)sender
{
    ConnectionViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"ConnectionViewController"];
    [self presentViewController:move animated:YES completion:nil];
}

- (IBAction)findConnections:(id)sender
{
    FindConnectionViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"FindConnectionViewController"];
    [self presentViewController:move animated:YES completion:nil];
}

#pragma mark - Tableview Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 88;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return view_connectionHeader;
    }
    else
    {
        return view_peopleHeader;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return view_connectionHeader.frame.size.height;
    }
    else
    {
        return view_peopleHeader.frame.size.height;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section == 0)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 30)] ;
        tableView.sectionHeaderHeight = view.frame.size.height;
        
        UIButton *btn =  [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setFrame:CGRectMake(0, 5, WIDTH, 25)];
        [btn setTitle:@"See more" forState:UIControlStateNormal];
        btn.titleLabel.font = setFontBold(18);
        [btn setTitleColor:ColorFromHEX(@"#368BD7") forState:UIControlStateNormal];
        [APP_DELEGATE setBorderToView:btn withBorderWidth:0.0 radious:1.0 color:[UIColor clearColor]];
        [btn setOnTouchUpInside:^(id sender, UIEvent *event)
         {
             InvationListingViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"InvationListingViewController"];
             //[self.navigationController pushViewController:move animated:YES];
             [self presentViewController:move animated:YES completion:nil];
         }];
        
        [view addSubview:btn];
        return view;
    }
    else
    {
        return nil;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 30;
    }
    else
    {
        return 0;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 0)
    {
        return 2;
    }
    else
    {
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0)
    {
        return [self ConnectionCell:tableView indexPath:indexPath Message:nil];
    }
    else
    {
        return [self PeopleYouMayKnowCell:tableView indexPath:indexPath Message:nil];
    }
}

#pragma mark - Connection Post
-(Cell_Invitations *)ConnectionCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_Invitations *cell = (Cell_Invitations *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_Invitations" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor clearColor];
        
        [cell.profile setOnTouchUpInside:^(UIEvent *event, id sender)
         {
             ProfileViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
             move.strUserName = @"Emma Watson";
             move.isLoginUser = NO;
             [self.navigationController pushViewController:move animated:YES];
         }];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
    }
    return cell;
}
#pragma mark - People Post
-(Cell_InvationsPeople *)PeopleYouMayKnowCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_InvationsPeople *cell = (Cell_InvationsPeople *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_InvationsPeople" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor clearColor];
        
        cell.withdraw.hidden = TRUE;
        cell.more.hidden = TRUE;
        
        [cell.profile setOnTouchUpInside:^(UIEvent *event, id sender)
         {
             ProfileViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
             move.strUserName = @"Emma Watson";
             move.isLoginUser = NO;
             [self.navigationController pushViewController:move animated:YES];
         }];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    /*
     EventDetailsViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"EventDetailsViewController"];
     [self.navigationController pushViewController:move animated:YES];
     */
}
@end
