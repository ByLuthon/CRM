//
//  Cell_peopleYouMayKnow.m
//  LinkedinClone
//
//  Created by macmini on 27/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "Cell_peopleYouMayKnow.h"

@implementation Cell_peopleYouMayKnow

- (void)awakeFromNib
{
    
    // border radius
    [_subview.layer setCornerRadius:0.0f];
    // border
    [_subview.layer setBorderColor:[UIColor lightGrayColor].CGColor];
    [_subview.layer setBorderWidth:0.0f];
    // drop shadow
    [_subview.layer setShadowColor:[UIColor grayColor].CGColor];
    [_subview.layer setShadowOpacity:0.8];
    [_subview.layer setShadowRadius:1.0];
    [_subview.layer setShadowOffset:CGSizeMake(0.8, 0.8)];

    
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    layout.sectionInset = UIEdgeInsetsMake(10, 10, 10, 10);
    layout.itemSize = CGSizeMake(270, 148);
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    
    self.collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 61, WIDTH, 161) collectionViewLayout:layout];
    [self.collectionView registerClass:[CollectionViewCell_people class] forCellWithReuseIdentifier:@"CollectionViewCell_people"];
    self.collectionView.backgroundColor = [UIColor whiteColor];
    self.collectionView.showsHorizontalScrollIndicator = NO;
    [self.contentView addSubview:self.collectionView];
    
    //return self;

    [super awakeFromNib];
    // Initialization code
}
- (void)setCollectionViewDataSourceDelegate:(id<UICollectionViewDataSource, UICollectionViewDelegate>)dataSourceDelegate indexPath:(NSIndexPath *)indexPath
{
    self.collectionView.dataSource = dataSourceDelegate;
    self.collectionView.delegate = dataSourceDelegate;
    //self.collectionView.indexPath = indexPath;
    [self.collectionView setContentOffset:self.collectionView.contentOffset animated:NO];
    
    [self.collectionView reloadData];
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
