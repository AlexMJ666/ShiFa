//
//  ErrorModel.h
//  ShiFa
//
//  Created by 马家俊 on 17/1/5.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import "BaseModel.h"

@interface ErrorModel : BaseModel
{
    int m_state;                //错误状态码 100:无网络 101:解析错误 102：无数据
    NSString *m_type;           //错误类型
    NSString *m_message;        //错误原因
    NSString *m_stacks;         //错误接口
}

@property (nonatomic,assign) int m_state;
@property (nonatomic,strong) NSString *m_message;
@property (nonatomic,strong) NSString *m_type;
@property (nonatomic,strong) NSString *m_stacks;
@end
