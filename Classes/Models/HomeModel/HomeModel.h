//
//  HomeModel.h
//  ShiFa
//
//  Created by 马家俊 on 17/1/6.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import "BaseModel.h"

@interface HomeModel : BaseModel
{
    NSMutableArray* m_adImagesArr;
    NSMutableArray* m_itemNamesArr;
}
@property (nonatomic, strong)NSMutableArray* m_adImagesArr;
@property (nonatomic, strong)NSMutableArray* m_itemNamesArr;

- (id)parseFromDic:(NSDictionary *)dic;
@end
