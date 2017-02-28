//
//  CollectionViewCell_people.m
//  LinkedinClone
//
//  Created by macmini on 28/02/17.
//  Copyright © 2017 macmini. All rights reserved.
//

#import "CollectionViewCell_people.h"

@implementation CollectionViewCell_people

- (void)awakeFromNib
{
    [APP_DELEGATE setBorderToView:_subview withBorderWidth:0.5 radious:5.0 color:[UIColor lightGrayColor]];

    [super awakeFromNib];
    // Initialization code
}
- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        // Initialization code
        NSArray *arrayOfViews;
        arrayOfViews = [[NSBundle mainBundle] loadNibNamed:@"CollectionViewCell_people" owner:self options:nil];
        if ([arrayOfViews count] < 1) {
            return nil;
        }
        
        if (![[arrayOfViews objectAtIndex:0] isKindOfClass:[UICollectionViewCell class]]) {
            return nil;
        }
        
        self = [arrayOfViews objectAtIndex:0];
        
    }
    return self;
}

@end
