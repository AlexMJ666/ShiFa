//
//  CommonDeal.h
//  ShiFa
//
//  Created by 马家俊 on 17/1/5.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ErrorModel.h"
#import <UIKit/UIKit.h>
@interface CommonDeal : NSObject

/**网络的统一的判断
 */
+ (BOOL)checkNetwork;

/**无网络的统一调用
 */
+ (void)showUnavalibleNetworkWarning;

/**UIAlertView的统一封装
 *\param        target      委托对象
 *\param        promptTitle      标题
 *\param        promptMessage      内容
 *\param        cancelBtnTitle      取消按钮
 *\param        otherBtnTitleArray      其它按钮的数组

 */
+ (void)promptWithAlert:(id)target titleOfPrompt:(NSString *)promptTitle tag:(int)tags messageOfPrompt:(NSString *)promptMessage cancelButtonTitle:(NSString *)cancelBtnTitle otherButtonTitleArray:(NSArray *)otherBtnTitleArray;

/**字典安全保护
 *\param        key    key值
 *\param        newObjec    value的内容
 *\param        dic    字典
 */
+(void)setSafetyObject:(id)newObjec forKey:(id)key andDic:(NSMutableDictionary *)dic;

/**数组安全保护
 *\param        index    下标
 *\param        array    数组
 *\returns      id
 */
+(id)safetyArrayOjectAtIndex:(int)index andArray:(NSMutableArray *)array;

/**添加数组
 *\param        object    要添加的对象
 *\param        array     数组
 */
+(void)safetyAddObject:(id)object andArray:(NSMutableArray *)array;

/**数组中插入对象
 *\param        object    要添加的对象
 *\param        index    对象添加的位置
 *\param        array    数组
 */
+(void)safetyInsertObject:(id)object atIndex:(int)index andArray:(NSMutableArray *)array;

/**判断当前的字符串是否为nil，[NULL null],@""
 *\param        str    传入的字符串
 *\returns      BOOL:   yes表示是上面其中之一，no表示不是
 */
+(BOOL)jugementStringIsNil:(NSString *)str;

/**判断当前的数组是否为nil，[NULL null]
 *\param        arr    传入的字符串
 *\returns      BOOL:   yes表示是上面其中之一，no表示不是
 */
+(BOOL)jugementArrIsNil:(NSArray *)arr;

/**时间戳转换
 *\param        intervalStr   传入的字符串
 *\returns      format:         显示时间格式
 */
+ (NSString *)transferIntervalToStr:(NSString *)intervalStr andFormat:(NSString *)format;
+ (NSString *)transferIntervalLocal:(NSString *)intervalStr andFormat:(NSString *)format;

/**获取当前时间
 *\returns      return:     MMddHHmmss的时间类型字符串
 */
+ (NSString *)getNowDateTime;
+ (NSString *)getNowDateTimeWithFormate:(NSString *)formate;

/**秒数转换
 *\param        seconds      秒数
 *\returns      return:     HH时mm分的时间类型字符串
 */
+(NSString *)transDuration:(NSString *)seconds;
+(NSString *)transDurationWithMin:(NSString *)min;

/**验证手机号码
 *\param        telnumber      手机号
 *\returns      return:         是否格式正确
 */
+ (BOOL)validateTelnumber:(NSString *)telnumber;

/**验证车牌号
 *\param        plateNo      车牌号
 *\returns      return:         是否格式正确
 */
+ (BOOL)validatePlateNo:(NSString *)plateNo;

/**距离单位转换
 *\param        oldDistance    距离
 *\returns      return:         是否格式正确
 */
+(NSString *)distance:(NSString *)oldDistance;

/**
 *  验证身份证号
 *
 *  @param identityCard identityCard description
 *
 *  @return return value description
 */
+ (BOOL) validateIdentityCard: (NSString *)identityCard;

/**
 *  验证汉字
 *
 *  @param hanz             汉子
 *
 *  @return return value description
 */
+ (BOOL)validateHanz:(NSString *)hanz;

/**获取字体
 *\param        fontSize   大小
 *\returns      return     字体
 */
+(UIFont *)getFont:(CGFloat)fontSize;
+(UIFont *)getBoldFont:(CGFloat)fontSize;


@end
