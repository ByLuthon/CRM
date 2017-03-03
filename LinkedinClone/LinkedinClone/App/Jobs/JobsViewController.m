
//
//  JobsViewController.m
//  LinkedinClone
//
//  Created by macmini on 03/03/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "JobsViewController.h"

@interface JobsViewController ()

@end

@implementation JobsViewController

- (void)viewDidLoad
{
    self.navigationController.navigationBarHidden = TRUE;
    
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
    
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)search:(id)sender
{
    SearchViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    [self.navigationController pushViewController:move animated:NO];
}

- (IBAction)profile:(id)sender
{
    ProfileViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"ProfileViewController"];
    move.strUserName = @"Bhavesh Nayi";
    move.isLoginUser = YES;
    [self.navigationController pushViewController:move animated:YES];
}

#pragma mark - Tableview Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (indexPath.section == 0)
    {
        return 0;
    }
    else if (indexPath.section == 1)
    {
        return 122.0f;
    }
    else
    {
        return 175.0f;
    }
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return view_headerProfile;
    }
    else if (section == 1)
    {
        return view_headerJobs;
    }
    else
    {
        return view_headerCompanies;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0)
    {
        return view_headerProfile.frame.size.height;
    }
    else if (section == 1)
    {
        return view_headerJobs.frame.size.height;
    }
    else
    {
        return view_headerCompanies.frame.size.height;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section
{
    if (section != 0)
    {
        UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 0, tableView.bounds.size.width, 40)] ;
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
    if (section != 0)
    {
        return 40;
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
        return 0;
    }
    else
    {
        return 10;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 1)
    {
        return [self jobslistCell:tableView indexPath:indexPath Message:nil];
    }
    else if (indexPath.section == 2)
    {
        return [self jobsCompaniesCell:tableView indexPath:indexPath Message:nil];
    }
    else
    {
        return nil;
    }
}

#pragma mark - Jobs Post
-(Cell_jobs *)jobslistCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_jobs *cell = (Cell_jobs *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_jobs" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor whiteColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}
#pragma mark - Companies Post
-(Cell_JobsCompanies *)jobsCompaniesCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_JobsCompanies *cell = (Cell_JobsCompanies *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_JobsCompanies" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor whiteColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{

}

@end
