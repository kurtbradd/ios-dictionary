//
//  KBResultsController.m
//  dictionary
//
//  Created by Kurt DaCosta on 2014-12-09.
//  Copyright (c) 2014 kurtbardd. All rights reserved.
//

#import "KBResultsController.h"
#import "KBCardViewCell.h"
#import "KBSettingsController.h"
#import "KBCardFlowLayout.h"

@interface KBResultsController ()

@property (nonatomic, weak) IBOutlet UICollectionView *collectionView;
@property (nonatomic, strong) NSString *searchWord;
@property (nonatomic, strong) NSDictionary *results;
@property (nonatomic, strong) UIPageControl *pageCtrl;

@end

@implementation KBResultsController

- (instancetype)initSearchWord:(NSString *)word withResults:(NSDictionary *)results
{
    self = [super initWithNibName:nil bundle:nil];
    if (self) {
        self.title = @"Results";
        self.searchWord = word;
        [self.collectionView setBackgroundColor:[KBStyleManager grayBackgroundColor]];
        NSLog(@"%@", results);
        self.results = results;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    [self.navigationItem setRightBarButtonItem:[[KBSettingsButton alloc] initWithDisplayDelegate:self]];
}

- (void)presentSettingsController
{
    [self.view endEditing:YES];
    [self.navigationController pushViewController:[[KBSettingsController alloc] initWithSettingType:kMainSettings] animated:YES];
}

- (void)viewWillAppear:(BOOL)animated
{
    [self.collectionView registerClass:[KBCardViewCell class] forCellWithReuseIdentifier:@"KBCardViewCell"];
    [self.collectionView setPagingEnabled:YES];
//    UICollectionViewFlowLayout *flowLayout = [[UICollectionViewFlowLayout alloc] init];
//    flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
//    [flowLayout setMinimumLineSpacing:15.0];
    [self.collectionView setCollectionViewLayout:[[KBCardFlowLayout alloc] init]];
    
    UILabel *word = [[UILabel alloc] initWithFrame:CGRectMake(25, 0, 295, 73)];
    [word setFont:[KBStyleManager helvetivaBoldWithSize:33.0]];
    [word setTextColor:[KBStyleManager grayTextRegularColor]];
    [word setText:[self.searchWord capitalizedString]];
    [self.view addSubview:word];
    
    [self setPageCtrl:[[UIPageControl alloc]init]];
    CGRect frame = self.pageCtrl.frame;
    frame.origin.x = 160;
    frame.origin.y = 480;
    [self.pageCtrl setFrame:frame];
    [self.pageCtrl setHidesForSinglePage:YES];
    [self.pageCtrl setCurrentPage:0];
    [self.pageCtrl setPageIndicatorTintColor:[KBStyleManager grayIconColor]];
    [self.pageCtrl setCurrentPageIndicatorTintColor:[KBStyleManager grayTextRegularColor]];
    [self.pageCtrl setNumberOfPages:[self.results allKeys].count];
    [self.view insertSubview:self.pageCtrl aboveSubview:self.collectionView];
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return [self.results allKeys].count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    KBCardViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"KBCardViewCell" forIndexPath:indexPath];
    NSString *wordType = [[self.results allKeys] objectAtIndex:indexPath.row];
    [cell.wordType setText:[wordType capitalizedString]];
    [cell setWordDefinitions:[self.results objectForKey:wordType]];
    return cell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
//{
//    return [KBStyleManager definitionCardSize];
//}

//- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
//{
//    CGFloat horizontalInset = (collectionView.frame.size.width - 260)/2.0;
//    //    bottom inset of 64min to make up for status bar + 30 for padding;
//    return UIEdgeInsetsMake(0, horizontalInset,94, horizontalInset);
//}

-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
    float currentPage = self.collectionView.contentOffset.x / self.collectionView.frame.size.width;
    self.pageCtrl.currentPage = ceil(currentPage);
}


@end
