//
//  SearchViewController.h
//  LinkedinClone
//
//  Created by macmini on 03/03/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface SearchViewController : UIViewController
{
    int TableMethod;
    NSMutableArray *arrRecentSearch;
    UILabel *lblUnderline;
    
    NSMutableArray *arrSegment;
    
    __weak IBOutlet UISearchBar *searchbar;
    __weak IBOutlet UIView *view_recentSearch;
    __weak IBOutlet UICollectionView *collectionview;
    __weak IBOutlet UITableView *tbl_RecentSearch;
    
    
    __weak IBOutlet UIView *view_searchSegment;
    __weak IBOutlet UIScrollView *scrlSegment;
    __weak IBOutlet UITableView *tbl_searchResult;
}

@end
