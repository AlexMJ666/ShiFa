//
//  SearchView.m
//  ShiFa
//
//  Created by 马家俊 on 17/2/27.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import "SearchView.h"

@interface SearchView()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView* m_tableView;
}
@property(nonatomic,strong) IBOutlet UITableView* m_tableView;

@end
@implementation SearchView
@synthesize m_tableView;

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        
    }
    return self;
}

-(void)refreshSearchView
{}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 5;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 100;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* Celled = @"SearchFirstCell";
    UITableViewCell* cell = [tableView dequeueReusableCellWithIdentifier:Celled];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:Celled];
    }
    return cell;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
