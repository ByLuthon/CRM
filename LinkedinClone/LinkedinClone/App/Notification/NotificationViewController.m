//
//  NotificationViewController.m
//  LinkedinClone
//
//  Created by macmini on 27/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "NotificationViewController.h"

@interface NotificationViewController ()

@end

@implementation NotificationViewController

- (void)viewDidLoad
{
    [self setInitParam];
    
    self.navigationController.navigationBarHidden = TRUE;
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)setInitParam
{
    arrNotificationList = [[NSMutableArray alloc] initWithObjects:@"Congratulate",@"CongratulateAnnniversaries",@"ViewedProfile",@"HappyBirthday",@"Congratulate",@"Congratulate",@"HappyBirthday",@"SharedJobs",@"Congratulate",@"IntrestedJobs",@"HappyBirthday",@"Congratulate",@"Congratulate",@"Congratulate",@"HappyBirthday",@"CongratulateAnnniversaries",@"HappyBirthday",@"Congratulate",@"ViewedProfile",@"SharedJobs",@"HappyBirthday",@"HappyBirthday",@"IntrestedJobs",@"IntrestedJobs",@"Congratulate",@"SharedJobs",@"ViewedProfile",@"CongratulateAnnniversaries",@"IntrestedJobs",@"HappyBirthday",@"ViewedProfile",@"Congratulate",@"Congratulate",@"IntrestedJobs",@"IntrestedJobs",@"SharedJobs",@"CongratulateAnnniversaries",@"HappyBirthday",@"SharedJobs", nil];
    
    
    
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

- (IBAction)search:(id)sender
{
    SearchViewController *move = [self.storyboard instantiateViewControllerWithIdentifier:@"SearchViewController"];
    [self.navigationController pushViewController:move animated:NO];
}

#pragma mark - Tableview Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if ([[arrNotificationList objectAtIndex:indexPath.row] isEqualToString:@"Congratulate"])
    {
        return 180.0;
    }
    else if ([[arrNotificationList objectAtIndex:indexPath.row] isEqualToString:@"CongratulateAnnniversaries"])
    {
        return 210.0;
    }
    else if ([[arrNotificationList objectAtIndex:indexPath.row] isEqualToString:@"IntrestedJobs"])
    {
        return 120.0;
    }
    else if ([[arrNotificationList objectAtIndex:indexPath.row] isEqualToString:@"HappyBirthday"])
    {
        return 135.0;
    }
    else if ([[arrNotificationList objectAtIndex:indexPath.row] isEqualToString:@"SharedJobs"])
    {
        return 190.0;
    }
    else if ([[arrNotificationList objectAtIndex:indexPath.row] isEqualToString:@"ViewedProfile"])
    {
        return 185.0;
    }
    else
    {
        return 0;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrNotificationList count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([[arrNotificationList objectAtIndex:indexPath.row] isEqualToString:@"Congratulate"])
    {
        return [self CongratulationsCell:tableView indexPath:indexPath Message:nil];
    }
    else if ([[arrNotificationList objectAtIndex:indexPath.row] isEqualToString:@"CongratulateAnnniversaries"])
    {
        return [self CongratulationsAnniversaryCell:tableView indexPath:indexPath Message:nil];
    }
    else if ([[arrNotificationList objectAtIndex:indexPath.row] isEqualToString:@"IntrestedJobs"])
    {
        return [self IntrestedCell:tableView indexPath:indexPath Message:nil];
    }
    else if ([[arrNotificationList objectAtIndex:indexPath.row] isEqualToString:@"HappyBirthday"])
    {
        return [self BirthdayCell:tableView indexPath:indexPath Message:nil];
    }
    else if ([[arrNotificationList objectAtIndex:indexPath.row] isEqualToString:@"SharedJobs"])
    {
        return [self sharedJobsCell:tableView indexPath:indexPath Message:nil];
    }
    else if ([[arrNotificationList objectAtIndex:indexPath.row] isEqualToString:@"ViewedProfile"])
    {
        return [self viewedProfileCell:tableView indexPath:indexPath Message:nil];
    }
    else
    {
        
        return nil;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
}

#pragma mark - Congratulation Post
-(Cell_congratulation *)CongratulationsCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_congratulation *cell = (Cell_congratulation *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_congratulation" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor clearColor];
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

#pragma mark - CongartulationAnniversary Post
-(Cell_CongratulationAniversary *)CongratulationsAnniversaryCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_CongratulationAniversary *cell = (Cell_CongratulationAniversary *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_CongratulationAniversary" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor clearColor];
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

#pragma mark - IntrestedJobs Post
-(Cell_IntrestedJobs *)IntrestedCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_IntrestedJobs *cell = (Cell_IntrestedJobs *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_IntrestedJobs" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor clearColor];
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

#pragma mark - Happy Birthday Post
-(Cell_HappyBirthday *)BirthdayCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_HappyBirthday *cell = (Cell_HappyBirthday *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_HappyBirthday" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor clearColor];
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

#pragma mark - Shared Jobs Post
-(Cell_sharedNotification *)sharedJobsCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_sharedNotification *cell = (Cell_sharedNotification *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_sharedNotification" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor clearColor];
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

#pragma mark - Viewed Profile Post
-(Cell_viewedProfile *)viewedProfileCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_viewedProfile *cell = (Cell_viewedProfile *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_viewedProfile" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor clearColor];
        
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}

@end
