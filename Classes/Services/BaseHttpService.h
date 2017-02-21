//
//  BaseHttpService.h
//  ShiFa
//
//  Created by 马家俊 on 17/1/5.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ErrorModel.h"
#import <AFNetworking.h>
#import <AFURLRequestSerialization.h>
#import <AFHTTPSessionManager.h>

typedef void(^SuccessBlock)(id backStr);
typedef void(^FailedBlock)(ErrorModel *errorM);

@interface BaseHttpService : NSObject
{
    SuccessBlock success_block;
    FailedBlock failed_block;
}
@end
