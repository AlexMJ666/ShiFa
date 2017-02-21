//
//  HttpShiFa.m
//  ShiFa
//
//  Created by 马家俊 on 17/1/5.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import "HttpShiFa.h"

@implementation HttpShiFa

-(void)requestWithPostData:(NSMutableDictionary *)dic
               andQueryStr:(NSString *)queryStr
           andSuccessBlock:(SuccessBlock)sucBlock_
            andFailedBlock:(FailedBlock)failedBlock_
{
    if (![CommonDeal checkNetwork]) {
        ErrorModel *errorM = [[ErrorModel alloc] init];
        errorM.m_state = (int)100;
        errorM.m_message = @"网络断开咯";
        failedBlock_(errorM);
        return;
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager.requestSerializer setTimeoutInterval:60.0f];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/plain", nil];
    [manager POST:queryStr parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            NSString *status = [NSString stringWithFormat:@"%@",[responseObject valueForKeyPath:@"status"]];
            if ([status isEqualToString:@"1"]) {
                sucBlock_(responseObject);
            }
            else{
                ErrorModel *errorM = [[ErrorModel alloc] init];
                errorM.m_state = (int)102;
                errorM.m_message = [NSString stringWithFormat:@"%@",[responseObject valueForKeyPath:@"message"]];
                failedBlock_(errorM);
            }
        }
        else{
            ErrorModel *errorM = [[ErrorModel alloc] init];
            errorM.m_state = (int)101;
            errorM.m_message = @"暂无数据";
            failedBlock_(errorM);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ErrorModel *errorM = [[ErrorModel alloc] init];
        errorM.m_state = (int)error.code;
        errorM.m_message = @"服务器繁忙，请稍后重试";
        errorM.m_type = @"";
        errorM.m_stacks = [[error userInfo] objectForKey:@"NSLocalizedDescription"];
        failedBlock_(errorM);
    }];
}

-(void)requestWithGetData:(NSMutableDictionary *)dic
                andUrlStr:(NSString *)UrlStr
          andSuccessBlock:(SuccessBlock)sucBlock_
           andFailedBlock:(FailedBlock)failedBlock_
{
    if (![CommonDeal checkNetwork]) {
        ErrorModel *errorM = [[ErrorModel alloc] init];
        errorM.m_state = (int)100;
        errorM.m_message = @"网络断开咯";
        failedBlock_(errorM);
        return;
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:60.0f];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/plain", nil];
    [manager GET:UrlStr parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            NSDictionary *json = (NSDictionary *)responseObject;
            NSString *status = [NSString stringWithFormat:@"%@",[responseObject valueForKeyPath:@"status"]];
            if ([status isEqualToString:@"1"]) {
                sucBlock_(json);
            }
            else{
                NSString *errorMsg = [NSString stringWithFormat:@"%@",[responseObject valueForKeyPath:@"message"]];
                ErrorModel *errorM = [[ErrorModel alloc] init];
                errorM.m_state = 102;
                if (errorMsg.length>0) {
                    errorM.m_message = errorMsg;
                }else{
                    errorM.m_message = @"暂无数据";
                }
                failedBlock_(errorM);
            }
        }
        else{
            ErrorModel *errorM = [[ErrorModel alloc] init];
            errorM.m_state = 101;
            errorM.m_message = @"暂无数据";
            errorM.m_type = @"";
            errorM.m_stacks = @"";
            failedBlock_(errorM);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ErrorModel *errorM = [[ErrorModel alloc] init];
        errorM.m_state = (int)error.code;
        errorM.m_message = @"服务器繁忙，请稍后重试";
        errorM.m_type = @"";
        errorM.m_stacks = [[error userInfo] objectForKey:@"NSLocalizedDescription"];
        failedBlock_(errorM);
    }];
}

-(void)requestWithDEL:(NSMutableDictionary *)dic
            andUrlStr:(NSString *)UrlStr
      andSuccessBlock:(SuccessBlock)sucBlock_
       andFailedBlock:(FailedBlock)failedBlock_
{
    if (![CommonDeal checkNetwork]) {
        ErrorModel *errorM = [[ErrorModel alloc] init];
        errorM.m_state = (int)100;
        errorM.m_message = @"网络断开咯";
        failedBlock_(errorM);
        return;
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:60.0f];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/plain", nil];
    [manager DELETE:UrlStr parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            NSDictionary *json = (NSDictionary *)responseObject;
            NSString *status = [[json valueForKeyPath:@"status"]stringValue];
            if ([status isEqualToString:@"1"]) {
                sucBlock_(json);
            }else{
                ErrorModel *errorM = [[ErrorModel alloc] init];
                errorM.m_state = 102;
                errorM.m_message = [NSString stringWithFormat:@"%@",[json valueForKeyPath:@"message"]];
                errorM.m_type = @"";
                errorM.m_stacks = @"";
                failedBlock_(errorM);
            }
        }
        else{
            ErrorModel *errorM = [[ErrorModel alloc] init];
            errorM.m_state = 101;
            errorM.m_message = @"暂无数据";
            errorM.m_type = @"";
            errorM.m_stacks = @"";
            failedBlock_(errorM);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ErrorModel *errorM = [[ErrorModel alloc] init];
        errorM.m_state = (int)error.code;
        errorM.m_message = @"服务器繁忙，请稍后重试";
        errorM.m_type = @"";
        errorM.m_stacks = [[error userInfo] objectForKey:@"NSLocalizedDescription"];
        failedBlock_(errorM);
    }];
}

-(void)requestWithPATCH:(NSMutableDictionary *)dic
              andUrlStr:(NSString *)UrlStr
        andSuccessBlock:(SuccessBlock)sucBlock_
         andFailedBlock:(FailedBlock)failedBlock_
{
    if (![CommonDeal checkNetwork]) {
        ErrorModel *errorM = [[ErrorModel alloc] init];
        errorM.m_state = (int)100;
        errorM.m_message = @"网络断开咯";
        failedBlock_(errorM);
        return;
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:60.0f];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/plain", nil];
    [manager PATCH:UrlStr parameters:dic success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            NSDictionary *json = (NSDictionary *)responseObject;
            NSString *status = [[json valueForKeyPath:@"status"]stringValue];
            if ([status isEqualToString:@"1"]) {
                sucBlock_(json);
            }else{
                ErrorModel *errorM = [[ErrorModel alloc] init];
                errorM.m_state = 102;
                errorM.m_message = [NSString stringWithFormat:@"%@",[json valueForKeyPath:@"message"]];
                errorM.m_type = @"";
                errorM.m_stacks = @"";
                failedBlock_(errorM);
            }
        }
        else{
            ErrorModel *errorM = [[ErrorModel alloc] init];
            errorM.m_state = 101;
            errorM.m_message = @"暂无数据";
            errorM.m_type = @"";
            errorM.m_stacks = @"";
            failedBlock_(errorM);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ErrorModel *errorM = [[ErrorModel alloc] init];
        errorM.m_state = (int)error.code;
        errorM.m_message = @"服务器繁忙，请稍后重试";
        errorM.m_type = @"";
        errorM.m_stacks = [[error userInfo] objectForKey:@"NSLocalizedDescription"];
        failedBlock_(errorM);
    }];
}


-(void)requestAlipayWithGet:(NSMutableDictionary *)dic andQueryStr:(NSString *)queryStr andSuccessBlock:(SuccessBlock)sucBlock_ andFailedBlock:(FailedBlock)failedBlock_
{
    if (![CommonDeal checkNetwork]) {
        ErrorModel *errorM = [[ErrorModel alloc] init];
        errorM.m_state = (int)100;
        errorM.m_message = @"网络断开咯";
        failedBlock_(errorM);
        return;
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    [manager.requestSerializer setTimeoutInterval:60.0f];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/plain", nil];
    [manager.requestSerializer setValue:@"http://d.alipay.com/h5platform/landing.htm" forHTTPHeaderField:@"Referer"];
    [manager GET:queryStr parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSString* str = [[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding];
        NSMutableCharacterSet *set = [[NSMutableCharacterSet alloc] init];
        [set formUnionWithCharacterSet:[NSCharacterSet whitespaceAndNewlineCharacterSet]];//小写字母
        str = [str stringByTrimmingCharactersInSet:set];
        NSString* newStr = @"";
        NSString* temp = @"";
        for(int i =0; i < [str length]; i++)
        {
            temp = [str substringWithRange:NSMakeRange(i, 1)];
            if ([temp isEqualToString:@"{"]) {
                newStr = [newStr stringByAppendingString:temp];
                i++;
                temp = [str substringWithRange:NSMakeRange(i, 1)];
                while (![temp isEqualToString:@"}"]) {
                    i++;
                    temp = [str substringWithRange:NSMakeRange(i, 1)];
                    if ((![temp isEqualToString:@"/n"])&&(![temp isEqualToString:@" "])&&(![temp isEqualToString:@"/r"])) {
                        newStr = [newStr stringByAppendingString:temp];
                    }
                    
                }
                break;
            }
        }
        NSData* dicData = [newStr dataUsingEncoding:NSUTF8StringEncoding];
        NSDictionary *content = [NSJSONSerialization JSONObjectWithData:dicData options:NSJSONReadingMutableContainers error:nil];
        sucBlock_(content);
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ErrorModel *errorM = [[ErrorModel alloc] init];
        errorM.m_state = (int)error.code;
        errorM.m_message = @"服务器繁忙，请稍后重试";
        errorM.m_type = @"";
        errorM.m_stacks = [[error userInfo] objectForKey:@"NSLocalizedDescription"];
        failedBlock_(errorM);
    }];
}

-(void)requestWithGetVerson:(NSMutableDictionary *)dic andQueryStr:(NSString *)queryStr andSuccessBlock:(SuccessBlock)sucBlock_ andFailedBlock:(FailedBlock)failedBlock_
{
    if (![CommonDeal checkNetwork]) {
        ErrorModel *errorM = [[ErrorModel alloc] init];
        errorM.m_state = (int)100;
        errorM.m_message = @"网络断开咯";
        failedBlock_(errorM);
        return;
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.requestSerializer = [AFJSONRequestSerializer serializer];
    manager.responseSerializer = [AFJSONResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/plain",@"text/javascript", nil];
    [manager.requestSerializer setTimeoutInterval:60.0f];
    [manager GET:queryStr parameters:dic progress:^(NSProgress * _Nonnull downloadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            if ([responseObject isKindOfClass:[NSDictionary class]]) {
                NSDictionary *json = (NSDictionary *)responseObject;
                sucBlock_(json);
            }
            else{
                ErrorModel *errorM = [[ErrorModel alloc] init];
                errorM.m_state = 102;
                errorM.m_message = @"暂无数据";
                errorM.m_type = @"";
                errorM.m_stacks = @"";
                failedBlock_(errorM);
            }
        }
        else{
            ErrorModel *errorM = [[ErrorModel alloc] init];
            errorM.m_state = 101;
            errorM.m_message = @"暂无数据";
            errorM.m_type = @"";
            errorM.m_stacks = @"";
            failedBlock_(errorM);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ErrorModel *errorM = [[ErrorModel alloc] init];
        errorM.m_state = (int)error.code;
        errorM.m_message = @"服务器繁忙，请稍后重试";
        errorM.m_type = @"";
        errorM.m_stacks = [[error userInfo] objectForKey:@"NSLocalizedDescription"];
        failedBlock_(errorM);
    }];
}

-(void)requestWithPostUnipayData:(NSMutableDictionary *)dic
                     andQueryStr:(NSString *)queryStr
                 andSuccessBlock:(SuccessBlock)sucBlock_
                  andFailedBlock:(FailedBlock)failedBlock_
{
    if (![CommonDeal checkNetwork]) {
        ErrorModel *errorM = [[ErrorModel alloc] init];
        errorM.m_state = (int)100;
        errorM.m_message = @"网络断开咯";
        failedBlock_(errorM);
        return;
    }
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.securityPolicy = [AFSecurityPolicy policyWithPinningMode:AFSSLPinningModeNone];
    [manager.requestSerializer setTimeoutInterval:60.0f];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", @"text/html",@"text/plain", nil];
    [manager POST:queryStr parameters:dic progress:^(NSProgress * _Nonnull uploadProgress) {
        
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        if (responseObject) {
            NSString *txnTime = [NSString stringWithFormat:@"%@",[responseObject valueForKeyPath:@"tn"]];
            sucBlock_(txnTime);
        }
        else{
            ErrorModel *errorM = [[ErrorModel alloc] init];
            errorM.m_state = (int)101;
            errorM.m_message = @"暂无数据";
            failedBlock_(errorM);
        }
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        ErrorModel *errorM = [[ErrorModel alloc] init];
        errorM.m_state = (int)error.code;
        errorM.m_message = @"服务器繁忙，请稍后重试";
        errorM.m_type = @"";
        errorM.m_stacks = [[error userInfo] objectForKey:@"NSLocalizedDescription"];
        failedBlock_(errorM);
    }];
}



@end
