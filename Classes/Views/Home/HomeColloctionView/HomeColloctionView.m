//
//  HomeColloctionView.m
//  ShiFa
//
//  Created by 马家俊 on 17/1/5.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import "HomeColloctionView.h"
#import "HomeCollectionViewCell.h"

@interface HomeColloctionView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong) IBOutlet UICollectionView* colloctionView;
@property(nonatomic,strong) NSMutableArray *dateArr;
@end
@implementation HomeColloctionView
@synthesize colloctionView;
-(void)dealloc
{}



-(NSMutableArray*)dateArr
{
    if (!_dateArr) {
        _dateArr = [NSMutableArray new];
    }
    return _dateArr;
}

-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
    }
    return self;
}

-(void)refreshColloction:(NSMutableArray*)arr
{
    self.dateArr = arr;
    [self.colloctionView reloadData];
}
#pragma mark ---- UICollectionViewDataSource

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.dateArr.count;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* identifier = @"HomeCollectionViewCell";
    HomeCollectionViewCell *cell =  [collectionView dequeueReusableCellWithReuseIdentifier:identifier forIndexPath:indexPath];

    cell._img.image =[UIImage imageNamed:@"tab_icon_3_selected"];
    cell._name.text =[self.dateArr objectAtIndex:indexPath.row];

    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(kMainScreen_Width/4, 75);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 0, 0, 0);// top left bottom right  Cell边界范围
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"1");
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
