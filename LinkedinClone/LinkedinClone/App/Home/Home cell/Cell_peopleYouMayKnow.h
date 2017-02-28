//
//  Cell_peopleYouMayKnow.h
//  LinkedinClone
//
//  Created by macmini on 27/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Common.h"


@interface Cell_peopleYouMayKnow : UITableViewCell
{
    
}
@property (weak, nonatomic) IBOutlet UIView *subview;
@property (nonatomic, strong) UICollectionView *collectionView;

- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath;

@end
