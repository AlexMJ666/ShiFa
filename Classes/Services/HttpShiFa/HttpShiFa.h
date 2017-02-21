//
//  HttpShiFa.h
//  ShiFa
//
//  Created by 马家俊 on 17/1/5.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import "BaseHttpService.h"

@interface HttpShiFa : BaseHttpService

/*! 通过http数据交互（POST）
 *\param    dic                带参
 *\param    queryStr           获取信息的str
 */
-(void)requestWithPostData:(NSMutableDictionary *)dic
               andQueryStr:(NSString *)queryStr
           andSuccessBlock:(SuccessBlock)sucBlock_
            andFailedBlock:(FailedBlock)failedBlock_;

/*! 通过http数据交互（GET）
 *\param    dic                带参
 *\param    UrlStr           获取信息的str
 */
-(void)requestWithGetData:(NSMutableDictionary *)dic
                andUrlStr:(NSString *)UrlStr
          andSuccessBlock:(SuccessBlock)sucBlock_
           andFailedBlock:(FailedBlock)failedBlock_;

/*! 通过http数据交互（DEL）
 *\param    dic                带参
 *\param    UrlStr           获取信息的str
 */
-(void)requestWithDEL:(NSMutableDictionary *)dic
            andUrlStr:(NSString *)UrlStr
      andSuccessBlock:(SuccessBlock)sucBlock_
       andFailedBlock:(FailedBlock)failedBlock_;

/*! 通过http数据交互（ali-GET）
 *\param    dic                带参
 *\param    queryStr           获取信息的str
 */
-(void)requestAlipayWithGet:(NSMutableDictionary *)dic
                andQueryStr:(NSString *)queryStr
            andSuccessBlock:(SuccessBlock)sucBlock_
             andFailedBlock:(FailedBlock)failedBlock_;

/*! 通过http数据交互（PATCH）
 *\param    dic                带参
 *\param    UrlStr           获取信息的str
 */
-(void)requestWithPATCH:(NSMutableDictionary *)dic
              andUrlStr:(NSString *)UrlStr
        andSuccessBlock:(SuccessBlock)sucBlock_
         andFailedBlock:(FailedBlock)failedBlock_;


-(void)requestWithGetVerson:(NSMutableDictionary *)dic andQueryStr:(NSString *)queryStr andSuccessBlock:(SuccessBlock)sucBlock_ andFailedBlock:(FailedBlock)failedBlock_;

-(void)requestWithPostUnipayData:(NSMutableDictionary *)dic
                     andQueryStr:(NSString *)queryStr
                 andSuccessBlock:(SuccessBlock)sucBlock_
                  andFailedBlock:(FailedBlock)failedBlock_;

@end
