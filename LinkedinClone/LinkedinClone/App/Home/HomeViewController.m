//
//  HomeViewController.m
//  LinkedinClone
//
//  Created by macmini on 27/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "HomeViewController.h"
#import "FacebookStyleBar.h"
#import "FacebookStyleBarBehaviorDefiner.h"

@interface HomeViewController ()

@property (nonatomic) FacebookStyleBar *myCustomBar;


@end

@implementation HomeViewController

- (void)viewDidLoad
{
    self.navigationController.navigationBarHidden = TRUE;
    [self setInitParam];
    
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

-(void)setInitParam
{

    [self.view addSubview:self.myCustomBar];
    
    // Setup the table view
    //[_tbl registerClass:[UITableViewCell class] forCellReuseIdentifier:@"Cell"];
    //_tbl.contentInset = UIEdgeInsetsMake(self.myCustomBar.maximumBarHeight, 0.0, 0.0, 0.0);

    //Searcchbar
    [seachbar setBackgroundColor:ColorFromHEX(@"368BD7")];
    [seachbar setBarTintColor:ColorFromHEX(@"368BD7")]; //this is what you want
    seachbar.layer.borderWidth = 1;
    seachbar.layer.borderColor = [[UIColor clearColor] CGColor];
    seachbar.layer.cornerRadius = 0;
    seachbar.layer.masksToBounds = YES;
    
    arrPost = [[NSMutableArray alloc] initWithObjects:@"NormalPost",@"LikedPost",@"CommentedPost",@"SharedPost",@"TrendingPost",@"JobsRecommended",@"PeopleYouMayKnow",@"Recommeded",@"NormalPost",@"LikedPost",@"CommentedPost",@"SharedPost",@"TrendingPost",@"JobsRecommended",@"PeopleYouMayKnow",@"Recommeded",@"NormalPost",@"LikedPost",@"CommentedPost",@"SharedPost",@"TrendingPost",@"JobsRecommended",@"PeopleYouMayKnow",@"Recommeded", nil];
    [_tbl reloadData];
    
    [self.view bringSubviewToFront:view_navigation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/
#pragma mark - collectionview delegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 10;
}


- (CGSize)collectionView:(UICollectionView *)collectionView
                  layout:(UICollectionViewLayout  *)collectionViewLayout
  sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(270, 148); // as per your cell size
}
-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"CollectionViewCell_people";
    CollectionViewCell_people *cell = (CollectionViewCell_people *)[collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    // Return the cell
    
    [APP_DELEGATE setBorderToView:cell.subview withBorderWidth:0.5 radious:5.0 color:[UIColor lightGrayColor]];

    
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{

}
#pragma mark - scrollView Delegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    CGRect frame = view_navigation.frame;
    CGFloat size = frame.size.height - 21;
    CGFloat framePercentageHidden = ((20 - frame.origin.y) / (frame.size.height - 1));
    CGFloat scrollOffset = scrollView.contentOffset.y;
    CGFloat scrollDiff = scrollOffset - self.previousScrollViewYOffset;
    CGFloat scrollHeight = scrollView.frame.size.height;
    CGFloat scrollContentSizeHeight = scrollView.contentSize.height + scrollView.contentInset.bottom;
    
    if (scrollOffset <= -scrollView.contentInset.top) {
        frame.origin.y = 00;
    } else if ((scrollOffset + scrollHeight) >= scrollContentSizeHeight) {
        frame.origin.y = -size;
    } else {
        frame.origin.y = MIN(00, MAX(-size, frame.origin.y - scrollDiff));
    }
    
    NSLog(@"%f",frame.origin.y);
    [view_navigation setFrame:frame];
    [self updateBarButtonItems:(1 - framePercentageHidden)];
    self.previousScrollViewYOffset = scrollOffset;
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    [self stoppedScrolling];
}
- (void)stoppedScrolling
{
    CGRect frame = view_navigation.frame;
    if (frame.origin.y < 00) {
        [self animateNavBarTo:-(frame.size.height - 21)];
    }
}

- (void)updateBarButtonItems:(CGFloat)alpha
{
    [self.navigationItem.leftBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem* item, NSUInteger i, BOOL *stop) {
        item.customView.alpha = alpha;
    }];
    [self.navigationItem.rightBarButtonItems enumerateObjectsUsingBlock:^(UIBarButtonItem* item, NSUInteger i, BOOL *stop) {
        item.customView.alpha = alpha;
    }];
    
    NSLog(@"%f",alpha);
    subview_navigation.alpha = alpha;
    
    //view_navigation.backgroundColor = [view_navigation.backgroundColor colorWithAlphaComponent:alpha];
    //self.navigationController.navigationBar.tintColor = [self.navigationController.navigationBar.tintColor colorWithAlphaComponent:alpha];
}

- (void)animateNavBarTo:(CGFloat)y
{
    [UIView animateWithDuration:0.2 animations:^{
        CGRect frame = view_navigation.frame;
        CGFloat alpha = (frame.origin.y >= y ? 0 : 1);
        frame.origin.y = y;
        [view_navigation setFrame:frame];
        [self updateBarButtonItems:alpha];
    }];
}

- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView
                  willDecelerate:(BOOL)decelerate
{
    if (!decelerate) {
        [self stoppedScrolling];
    }
}

#pragma mark - Tableview Delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section
{
    UIView *headerVw = [[UIView alloc]initWithFrame:CGRectMake(0, 0, WIDTH, 110)] ;
    headerVw.backgroundColor = self.view.backgroundColor;
    
    
    return headerVw;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 110;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
{
    if ([[arrPost objectAtIndex:indexPath.row] isEqualToString:@"NormalPost"])
    {
        return 266;
    }
    else if ([[arrPost objectAtIndex:indexPath.row] isEqualToString:@"LikedPost"])
    {
        return 310;
    }
    else if ([[arrPost objectAtIndex:indexPath.row] isEqualToString:@"CommentedPost"])
    {
        return 498;
    }
    else if ([[arrPost objectAtIndex:indexPath.row] isEqualToString:@"SharedPost"])
    {
        return 490;
    }
    else if ([[arrPost objectAtIndex:indexPath.row] isEqualToString:@"TrendingPost"])
    {
        return 360;
    }
    else if ([[arrPost objectAtIndex:indexPath.row] isEqualToString:@"JobsRecommended"])
    {
        return 245;
    }
    else if ([[arrPost objectAtIndex:indexPath.row] isEqualToString:@"PeopleYouMayKnow"])
    {
        return 225;
    }
    else if ([[arrPost objectAtIndex:indexPath.row] isEqualToString:@"Recommeded"])
    {
        return 360;
    }
    else
    {
        return 0;
    }

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [arrPost count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if ([[arrPost objectAtIndex:indexPath.row] isEqualToString:@"NormalPost"])
    {
        return [self NormalPostCell:tableView indexPath:indexPath Message:nil];
    }
    else if ([[arrPost objectAtIndex:indexPath.row] isEqualToString:@"LikedPost"])
    {
        return [self LikedPostCell:tableView indexPath:indexPath Message:nil];
    }
    else if ([[arrPost objectAtIndex:indexPath.row] isEqualToString:@"CommentedPost"])
    {
        return [self CommentdPostCell:tableView indexPath:indexPath Message:nil];
    }
    else if ([[arrPost objectAtIndex:indexPath.row] isEqualToString:@"SharedPost"])
    {
        return [self SharedPostCell:tableView indexPath:indexPath Message:nil];
    }
    else if ([[arrPost objectAtIndex:indexPath.row] isEqualToString:@"TrendingPost"])
    {
        return [self TrendingCell:tableView indexPath:indexPath Message:nil];
    }
    else if ([[arrPost objectAtIndex:indexPath.row] isEqualToString:@"JobsRecommended"])
    {
        return [self JobsRecommendationCell:tableView indexPath:indexPath Message:nil];
    }
    else if ([[arrPost objectAtIndex:indexPath.row] isEqualToString:@"PeopleYouMayKnow"])
    {
        return [self PeopleYouMayKnowCell:tableView indexPath:indexPath Message:nil];
    }
    else if ([[arrPost objectAtIndex:indexPath.row] isEqualToString:@"Recommeded"])
    {
        return [self RecommendedCell:tableView indexPath:indexPath Message:nil];
    }
    else
    {

        return nil;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
{

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
        cell.backgroundColor = [UIColor clearColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;

        
    }
    return cell;
}

#pragma mark - Liked Post
-(Cell_likedPost *)LikedPostCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_likedPost *cell = (Cell_likedPost *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_likedPost" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor clearColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
    }
    return cell;
}

#pragma mark - Commented Post
-(Cell_commentedPost *)CommentdPostCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_commentedPost *cell = (Cell_commentedPost *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_commentedPost" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor clearColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
    }
    return cell;
}

#pragma mark - Shared Post
-(Cell_sharedPost *)SharedPostCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_sharedPost *cell = (Cell_sharedPost *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_sharedPost" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor clearColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
    }
    return cell;
}

#pragma mark - Trending
-(Cell_TrendingPost *)TrendingCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_TrendingPost *cell = (Cell_TrendingPost *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_TrendingPost" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor clearColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
    }
    return cell;
}

#pragma mark - Jobs Recommendation
-(Cell_JobsRecommended *)JobsRecommendationCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_JobsRecommended *cell = (Cell_JobsRecommended *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_JobsRecommended" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor clearColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
    }
    return cell;
}

#pragma mark - People you may know
-(Cell_peopleYouMayKnow *)PeopleYouMayKnowCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_peopleYouMayKnow *cell = (Cell_peopleYouMayKnow *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_peopleYouMayKnow" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor clearColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        [cell setCollectionViewDataSourceDelegate:self indexPath:indexPath];

    }
    return cell;
}

#pragma mark - People you may know
-(Cell_Recommended *)RecommendedCell:(UITableView *)tableView indexPath:(NSIndexPath *)indexPath Message:(NSMutableDictionary *)dic
{
    NSString *CellIdentifier = [NSString stringWithFormat:@"cell %ld",(long)indexPath.row];
    
    Cell_Recommended *cell = (Cell_Recommended *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    cell = nil;
    if (cell == nil)
    {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:@"Cell_Recommended" owner:nil options:nil];
        cell = [topLevelObjects objectAtIndex:0];
        cell.backgroundColor = [UIColor clearColor];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
        
    }
    return cell;
}


@end
