//
//  HomeView.m
//  ShiFa
//
//  Created by 马家俊 on 17/1/5.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import "HomeView.h"
#import "HomeViewCell.h"

#define kSectionNum             3                           //tableview的section数
#define kHeaderH                0.001f                           //tableview的section头高度
#define kFooter                 5                           //tableview的section脚高度
#define kImageH                 kMainScreen_Width*9/16      //图片高度
@interface HomeView()<UITableViewDelegate,UITableViewDataSource,UISearchBarDelegate,UISearchResultsUpdating>
{
    UITableView *m_tableView;
}
@property(nonatomic,strong) IBOutlet UITableView *p_tableView;
@property (nonatomic, strong) UISearchController * searchController;
@property (nonatomic, strong) NSDictionary *HomeDateDic;
@end
@implementation HomeView
@synthesize p_homeViewDelegate = m_homeViewDelegate;
@synthesize p_tableView = m_tableView;
@synthesize searchController;
-(void)dealloc
{}

-(NSDictionary*)HomeDateArr
{
    if (!_HomeDateDic) {
        _HomeDateDic = [NSDictionary new];
    }
    return _HomeDateDic;
}

-(void)refreshHomeView:(NSDictionary *)dateDic
{
    self.HomeDateDic = dateDic;
    [self addSearchHeaderView];
}

-(void)addSearchHeaderView
{
    searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    searchController.searchResultsUpdater = self;
    searchController.searchBar.placeholder = @"";
    searchController.dimsBackgroundDuringPresentation = NO;
    searchController.searchBar.delegate = self;
    [searchController.searchBar sizeToFit];
    self.p_tableView.tableHeaderView = searchController.searchBar;
}

#pragma mark - UISearchBarDelegate
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {

}
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar {

}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    [self.searchController.searchBar resignFirstResponder];
}
#pragma mark - UISearchResultsUpdating
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (section == 2) {
        return 2;
    }
    return 1;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        return kImageH;
    }else if (indexPath.section == 1)
    {
        return 75;
    }
    return kImageH;
}

-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString* Celled = @"homeCell";
    HomeViewCell* cell;
    
    switch (indexPath.section) {
        case 0:
            cell = [tableView dequeueReusableCellWithIdentifier:Celled];
            if (!cell) {
                cell = [[HomeViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:Celled];
            }
            break;
        case 1:
            cell = [tableView dequeueReusableCellWithIdentifier:@"secondCell"];
            if (!cell) {
                cell = [[HomeViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:@"secondCell"];
            }
            break;
        case 2:
            cell = [tableView dequeueReusableCellWithIdentifier:Celled];
            if (!cell) {
                cell = [[HomeViewCell alloc]initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:Celled];
            }
            break;
        default:
            break;
    }
    
    [cell addDifferentCellWFromSection:indexPath.section andCell:cell andDate:self.HomeDateDic];
    return cell;
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return kSectionNum;
}

-(CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return kFooter;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return kHeaderH;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
