//
//  KBResultsController.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-09.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBResultsController.h"
#import "KBCardViewCell.h"

@interface KBResultsController ()

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSString *searchWord;
@property (nonatomic, strong) NSDictionary *results;

@end

@implementation KBResultsController

- (instancetype)initSearchWord:(NSString *)word withResults:(NSDictionary *)results
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = @"Results";
        self.searchWord = word;
        [self.collectionView setBackgroundColor:[KBStyleManager grayBackgroundColor]];
        self.results = results;
    }
    return self;
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.collectionView registerClass:[KBCardViewCell class] forCellWithReuseIdentifier:@"KBCardViewCell"];
    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    [flowLayout setMinimumLineSpacing:15.0];
    [self.collectionView setCollectionViewLayout:flowLayout];
    
    
    UILabel *word = [[UILabel alloc] initWithFrame:CGRectMake(25, 0, 295, 73)];
    [word setFont:[KBStyleManager helvetivaBoldWithSize:33.0]];
    [word setTextColor:[KBStyleManager grayTextRegularColor]];
    [word setText:[self.searchWord capitalizedString]];
    [self.view addSubview:word];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.results allKeys].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KBCardViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"KBCardViewCell" forIndexPath:indexPath];
    NSString *wordType = [[self.results allKeys] objectAtIndex:indexPath.row];
    [cell.titleLabel setText:[wordType capitalizedString]];
    [cell.wordType setText:[wordType capitalizedString]];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return [KBStyleManager definitionCardSize];
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    CGFloat horizontalInset = (collectionView.frame.size.width - 260)/2.0;
    //    bottom inset of 64min to make up for status bar
    return UIEdgeInsetsMake(0, horizontalInset,94, horizontalInset);
}

@end
