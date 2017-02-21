//
//  HomeColloctionView.m
//  ShiFa
//
//  Created by 马家俊 on 17/1/5.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import "HomeColloctionView.h"

@interface HomeColloctionView()<UICollectionViewDelegate,UICollectionViewDataSource,UICollectionViewDelegateFlowLayout>
@property(nonatomic,strong) UICollectionView* colloctionView;
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
        UICollectionViewFlowLayout *flowLayout =[[UICollectionViewFlowLayout alloc]init];
        flowLayout.itemSize=CGSizeMake(kMainScreen_Width/4,120);
        //cell间距
        flowLayout.minimumInteritemSpacing = 1.0f;
        //cell行距
        flowLayout.minimumLineSpacing = 1.0f;
        
        [flowLayout setScrollDirection:UICollectionViewScrollDirectionHorizontal];
                                            
        colloctionView = [[UICollectionView alloc]initWithFrame:frame collectionViewLayout:flowLayout];
        colloctionView.backgroundColor = [UIColor whiteColor];
        colloctionView.dataSource = self;
        colloctionView.delegate = self;
        colloctionView.pagingEnabled = YES;
        [colloctionView setCollectionViewLayout:flowLayout];
        [self addSubview:colloctionView];
        
        [colloctionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"colloctionCell"];
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
    static NSString* Celled = @"colloctionCell";
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:Celled forIndexPath:indexPath];
    UIImageView* image = [[UIImageView alloc]init];
    [image setFrame:CGRectMake(0, 0, kMainScreen_Width/4, 90)];
    [cell.contentView addSubview:image];
    UILabel* lab = [[UILabel alloc]init];
    [lab setFrame:CGRectMake(0, image.frame.size.height, kMainScreen_Width/4, 30)];
    lab.textAlignment = NSTextAlignmentCenter;
    lab.textColor = [UIColor blackColor];
    [lab setFont:[UIFont systemFontOfSize:14]];
    [cell.contentView addSubview:lab];
    
    image.image =[UIImage imageNamed:@"tab_icon_3_selected"];
    lab.text = [self.dateArr objectAtIndex:indexPath.row];
    return cell;
}

- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(kMainScreen_Width/4, 120);
}

- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section{
    
    return UIEdgeInsetsMake(0, 0, 0, 0);// top left bottom right  Cell边界范围
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
