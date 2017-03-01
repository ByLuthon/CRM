//
//  HomeViewController.h
//  LinkedinClone
//
//  Created by macmini on 27/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"

@interface HomeViewController : UIViewController <UICollectionViewDelegate, UICollectionViewDataSource>
{
    NSMutableArray *arrPost;
    
    __weak IBOutlet UISearchBar *seachbar;
    __weak IBOutlet UIView *view_navigation;
    __weak IBOutlet UIView *subview_navigation;
}
@property (nonatomic) CGFloat previousScrollViewYOffset;

@property (weak, nonatomic) IBOutlet UITableView *tbl;

- (IBAction)Profile:(id)sender;

@end
