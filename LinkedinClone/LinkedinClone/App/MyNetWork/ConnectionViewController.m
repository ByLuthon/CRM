//
//  ConnectionViewController.m
//  LinkedinClone
//
//  Created by macmini on 02/03/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "ConnectionViewController.h"

@interface ConnectionViewController ()

@end

@implementation ConnectionViewController

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
    arrConnecction = [[NSMutableArray alloc] initWithObjects:@"Lipan",@"Petruta",@"Boice",@"Laurie",@"DeBerry",@"Sue",@"Krusee",@"Erin",@"Owczarczak",@"Leah",@"Signorino",@"Lynda",@"Toennies",@"Kaye",@"Jackson",@"Jaqueline",@"Johnson",@"Laura",@"Thebeau",@"Danielle",@"Russell",@"Amy",@"Frazer",@"Mary",@"Ellatif",@"Wafaa",@"Riley",@"Julie",@"Verhoff",@"Brandon",@"Colyott",@"Judy",@"Beasley",@"Anna",@"Perry",@"Terrie",@"Drexl",@"Mary",@"Halstead",@"MarieA",@"Amsler",@"Pam",@"Carter",@"Michelle",@"Kreevich",@"JeaneneA",@"Patrylo",@"Kathy",@"Scholl",@"Pam",@"Economon",@"Denise",@"Barbeau",@"Kathy CD",@"Scales",@"Ann Devock", nil];
    
    sections = [NSArray arrayWithObjects:@"a", @"b", @"c", @"d", @"e", @"f", @"g", @"h", @"i", @"j", @"k", @"l", @"m", @"n", @"o", @"p", @"q", @"r", @"s", @"t", @"u", @"v", @"w", @"x", @"y", @"z", nil];


}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)sort:(id)sender {
}

- (IBAction)Close:(id)sender
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return [sections count];
}

- (NSArray *)sectionIndexTitlesForTableView:(UITableView *)tableView
{
    return sections;
}

- (NSInteger)tableView:(UITableView *)tableView sectionForSectionIndexTitle:(NSString*)title atIndex:(NSInteger)index
{
    return index;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return [sections objectAtIndex:section];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    return 88;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    NSArray *sectionArray = [arrConnecction filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", [sections objectAtIndex:section]]];
    return sectionArray.count;
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
        
        cell.withdraw.hidden = TRUE;
        cell.AddPeople.hidden = TRUE;
        
        cell.more.hidden = FALSE;
        
        NSArray *sectionArray = [arrConnecction filteredArrayUsingPredicate:[NSPredicate predicateWithFormat:@"SELF beginswith[c] %@", [sections objectAtIndex:indexPath.section]]];
        cell.lbl_title.text = [NSString stringWithFormat:@"%@",[sectionArray objectAtIndex:indexPath.row]];

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
