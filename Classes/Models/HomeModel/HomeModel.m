//
//  HomeModel.m
//  ShiFa
//
//  Created by 马家俊 on 17/1/6.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import "HomeModel.h"

@implementation HomeModel
@synthesize m_adImagesArr;
@synthesize m_itemNamesArr;
-(id)init
{
    self = [super init];
    if (self) {
        m_itemNamesArr = [NSMutableArray new];
        m_adImagesArr = [NSMutableArray new];
    }
    return self;
}

- (id)parseFromDic:(NSDictionary *)dic
{
    if ([self init]) {
        if([CommonDeal jugementStringIsNil:[dic valueForKeyPath:@"itemNamesArr"]])
        {
            self.m_itemNamesArr = [NSMutableArray new];
        }else{
            self.m_itemNamesArr = [dic valueForKeyPath:@"itemNamesArr"];
            
        }
        
        if([CommonDeal jugementStringIsNil:[dic valueForKeyPath:@"adImagesArr"]])
        {
            self.m_adImagesArr = [NSMutableArray new];
        }else{
            self.m_adImagesArr = [dic valueForKeyPath:@"adImagesArr"];
        }
    }
    return self;
}

@end
