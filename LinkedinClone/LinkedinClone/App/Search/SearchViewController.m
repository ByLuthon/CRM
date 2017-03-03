//
//  SearchViewController.m
//  LinkedinClone
//
//  Created by macmini on 03/03/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "SearchViewController.h"

@interface SearchViewController ()

@end

@implementation SearchViewController

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
    view_recentSearch.hidden = FALSE;
    
    //Tranding
    [collectionview registerClass:[CollectionViewCell_search class] forCellWithReuseIdentifier:@"CollectionViewCell_search"];
    [collectionview reloadData];

    arrRecentSearch = [[NSMutableArray alloc] initWithObjects:@"What people are saying about Rlogical Techsoft",@"Rlogical Techsoft Jobs",@"New Connection at Rlogical Techsoft", nil];
    
    TableMethod = SEARCH_RecentSearch;
    [tbl_RecentSearch reloadData];
    
    
    arrSegment = [[NSMutableArray alloc] initWithObjects:@"Top",@"People",@"Jobs",@"Posts",@"Companies",@"Groups",@"Schools", nil];
    
    int x = 10;

    for (int i = 0; i < [arrSegment count]; i++)
    {

        UIButton *btntype = [UIButton buttonWithType:UIButtonTypeCustom];
        CGRect buttonFrame = CGRectMake(x, 0, 80, 45);
        btntype.frame=buttonFrame;
        [btntype setTitle:[arrSegment objectAtIndex:i] forState:UIControlStateNormal];
        btntype.titleLabel.font= setFontMedium(14);
        btntype.tag = i;
        
        [btntype setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        [btntype setTitleColor:ColorFromHEX(@"#368BD7") forState:UIControlStateSelected];
        [btntype addTarget:self action:@selector(btnselectType:) forControlEvents:UIControlEventTouchUpInside];
        [scrlSegment addSubview:btntype];
        
        if(i == 0)
        {
            [btntype setSelected:YES];
        }

        
        x = x + 80;
    }
    
    [APP_DELEGATE setBorderToView:tbl_searchResult withBorderWidth:0 radious:5 color:[UIColor clearColor]];
    
    scrlSegment.contentSize = CGSizeMake(x+10, 0);

    lblUnderline = [[UILabel alloc] initWithFrame:CGRectMake(0, 38, 80, 2)];
    lblUnderline.backgroundColor = ColorFromHEX(@"#368BD7");
    [scrlSegment addSubview:lblUnderline];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

-(IBAction)btnselectType:(id)sender
{
    UIButton *btn = (UIButton *)sender;
    NSLog(@"%ld",(long)btn.tag);
    
    for (UIButton *btn in scrlSegment.subviews)
    {
        if ([btn isKindOfClass:[UIButton class]]) {
            btn.selected = FALSE;
        }
    }
    [tbl_searchResult setContentOffset:CGPointZero animated:YES];
    
    lblUnderline.frame = CGRectMake(btn.frame.origin.x, 38, btn.frame.size.width, 2);
    btn.selected = TRUE;
    
    if (btn.tag == 0)
    {
        TableMethod = SEARCH_Top;
    }
    else if (btn.tag == 1)
    {
        TableMethod = SEARCH_people;
    }
    else if (btn.tag == 2)
    {
        TableMethod = SEARCH_jobs;
    }
    else if (btn.tag == 3)
    {
        TableMethod = SEARCH_posts;
    }
    else if (btn.tag == 4)
    {
        TableMethod = SEARCH_companies;
    }
    else if (btn.tag == 5)
    {
        TableMethod = SEARCH_groups;
    }
    else
    {
        TableMethod = SEARCH_scchool;
    }

    [tbl_searchResult reloadData];
}

#pragma mark - Searchbar
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar;                      // return NO to not become first responder
{
    
    
    //[searchbar becomeFirstResponder];
    //searchbar.showsCancelButton = YES;
    
    TableMethod = SEARCH_Top;
    [tbl_searchResult reloadData];
    
    return YES;
}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar
{

    searchbar.showsCancelButton = NO;
    [searchbar resignFirstResponder];
    
    searchbar.text = @"";
    
    TableMethod = SEARCH_RecentSearch;
    [tbl_RecentSearch reloadData];
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar; // called when keyboard search button pressed
{
    [APP_DELEGATE animateWithShow:NO withView:view_recentSearch];
    [tbl_searchResult reloadData];
    
    [searchbar resignFirstResponder];
}
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText
{
    if ([searchText length] == 0)
    {
        [self performSelector:@selector(calledCloseSearch)
                   withObject:nil
                   afterDelay:0];
        
        
    }
}
-(void)calledCloseSearch
{
    TableMethod = SEARCH_RecentSearch;
    [tbl_RecentSearch reloadData];
    
    [searchbar resignFirstResponder];
    [APP_DELEGATE animateWithShow:YES withView:view_recentSearch];
}


#pragma mark - collectionview delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}


- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout  *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(80, 100); // as per your cell size
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CollectionViewCell_search";
    CollectionViewCell_search *cell = (CollectionViewCell_search *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    // Return the cell
    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{


}

#pragma mark - Tableview Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    if (tableView == tbl_RecentSearch)
    {
        UIView *headerVw = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 50)] ;
        headerVw.backgroundColor = self.view.backgroundColor;

        UILabel *lblusername = [[UILabel alloc]initWithFrame:CGRectMake(8, 20, WIDTH, 30)];
        lblusername.text = @"Try searching for";
        lblusername.textColor = [UIColor darkGrayColor];
        [headerVw addSubview:lblusername];
        
        return headerVw;
    }
    else
    {
        UIView *headerVw = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 0)] ;
        headerVw.backgroundColor = self.view.backgroundColor;
        
        
        return headerVw;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (tableView == tbl_RecentSearch)
    {
        return 50;
    }
    else
    {
        return 0;
    }
    return 110;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if (tableView == tbl_RecentSearch)
    {
        return 60;
    }
    else
    {
        if (TableMethod == SEARCH_Top)
        {
            return 266.0;
        }
        else if (TableMethod == SEARCH_people)
        {
            return 88.0;
        }
        else if (TableMethod == SEARCH_jobs)
        {
            return 122.0f;
        }
        else if (TableMethod == SEARCH_posts)
        {
            return 266.0;
        }
        else if (TableMethod == SEARCH_companies)
        {
            return 175.0f;
        }
        else if (TableMethod == SEARCH_groups)
        {
            return 70.0f;
        }
        else if (TableMethod == SEARCH_scchool)
        {
            return 85.0f;
        }

        return 44;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == tbl_RecentSearch)
    {
        return arrRecentSearch.count;
    }
    else
    {
        if (TableMethod == SEARCH_Top)
        {
            return 10;
        }
        else if (TableMethod == SEARCH_people)
        {
            return 10;
        }
        else if (TableMethod == SEARCH_jobs)
        {
            return 10;
        }
        else if (TableMethod == SEARCH_posts)
        {
            return 10;
        }
        else if (TableMethod == SEARCH_companies)
        {
            return 10;
        }
        else if (TableMethod == SEARCH_groups)
        {
            return 10;
        }
        else if (TableMethod == SEARCH_scchool)
        {
            return 10;
        }
        else
        {
            return 0;
        }
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (tableView == tbl_RecentSearch)
    {
        return [self recentSearchresult:tableView indexPath:indexPath Message:[arrRecentSearch objectAtIndex:indexPath.row]];
    }
    
    if (TableMethod == SEARCH_Top)
    {
        return  [self NormalPostCell:tableView indexPath:indexPath Message:nil];
    }
    else if (TableMethod == SEARCH_people)
    {
        return  [self PeopleYouMayKnowCell:tableView indexPath:indexPath Message:nil];
    }
    else if (TableMethod == SEARCH_jobs)
    {
        return [self jobslistCell:tableView indexPath:indexPath Message:nil];
    }
    else if (TableMethod == SEARCH_posts)
    {
        return  [self NormalPostCell:tableView indexPath:indexPath Message:nil];
    }
    else if (TableMethod == SEARCH_companies)
    {
        return [self jobsCompaniesCell:tableView indexPath:indexPath Message:nil];
    }
    else if (TableMethod == SEARCH_groups)
    {
        return  [self groupsCell:tableView indexPath:indexPath Message:nil];
    }
    else if (TableMethod == SEARCH_scchool)
    {
        return [self schoolCell:tableView indexPath:indexPath Message:nil];
    }

    
    return nil;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{
    
}

#pragma mark - Recent search Post
-(Cell_RecentSearch *)recentSearchresult:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSString *)strTitle
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_RecentSearch *cell = (Cell_RecentSearch *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_RecentSearch" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor clearColor];
        
        NSMutableAttributedString *attString = [[NSMutableAttributedString alloc] initWithString:strTitle];
        [attString addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(0, strTitle.length)];
        [attString addAttribute:NSFontAttributeName value:setFontMedium(16) range:NSMakeRange(0, strTitle.length)];
        
        NSRange range = [strTitle rangeOfString:@"Rlogical Techsoft"];
        [attString addAttribute:NSForegroundColorAttributeName value:[UIColor darkGrayColor] range:range];
        [attString addAttribute:NSFontAttributeName value:setFontMedium(16) range:range];
        
        
        cell.lbl_title.attributedText = attString;
        
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
        cell.backgroundColor = [UIColor whiteColor];
        
        cell.more.hidden = TRUE;
        cell.withdraw.hidden = TRUE;
        cell.AddPeople.hidden = FALSE;

        
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


#pragma mark - Normal Post
-(Cell_NormalPost *)NormalPostCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_NormalPost *cell = (Cell_NormalPost *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_NormalPost" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor whiteColor];
        
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

#pragma mark - Groups Post
-(Cell_groups *)groupsCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_groups *cell = (Cell_groups *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_groups" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor whiteColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


#pragma mark - school Post
-(Cell_School *)schoolCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_School *cell = (Cell_School *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_School" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor whiteColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    return cell;
}


@end
