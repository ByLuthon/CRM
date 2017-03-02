//
//  InvationListingViewController.m
//  LinkedinClone
//
//  Created by macmini on 02/03/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "InvationListingViewController.h"

@interface InvationListingViewController ()

@end

@implementation InvationListingViewController

- (void)viewDidLoad
{
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
    tableMethod = 0;
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

- (IBAction)saegmentValueChanged:(id)sender
{
    
    if (segmentController.selectedSegmentIndex == 0)
    {
        //stories
        tableMethod = 0;
    }
    else if (segmentController.selectedSegmentIndex == 1)
    {
        //People
        tableMethod = 1;
    }
    
    [tbl reloadData];
    
}

- (IBAction)Close:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
#pragma mark - Tableview Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 88;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [self PeopleYouMayKnowCell:tableView indexPath:indexPath Message:nil];
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
        
        cell.more.hidden = TRUE;

        if (tableMethod == 0)
        {
            cell.withdraw.hidden = TRUE;
        }
        else
        {
            cell.AddPeople.hidden = TRUE;
        }
        
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
