//
//  CommonDeal.m
//  ShiFa
//
//  Created by 马家俊 on 17/1/5.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import "CommonDeal.h"

@implementation CommonDeal
+ (BOOL)checkNetwork
{
    Reachability *internetReach = [Reachability reachabilityForInternetConnection];
    if ([internetReach currentReachabilityStatus] == NotReachable)
    {
        return NO;
    }
    return YES;
}

+ (void)showUnavalibleNetworkWarning
{
    NSString *msg = @"无网络";
    [[YBProgressShow defaultProgress] showText:msg
                                        InMode:MBProgressHUDModeText
                         OriginViewEnableTouch:NO
                            HideAfterDelayTime:0.5f];
}

+ (void)promptWithAlert:(id)target titleOfPrompt:(NSString *)promptTitle tag:(int)tags messageOfPrompt:(NSString *)promptMessage cancelButtonTitle:(NSString *)cancelBtnTitle otherButtonTitleArray:(NSArray *)otherBtnTitleArray
{
    if (IsIOS9) {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:promptTitle message:promptMessage preferredStyle:UIAlertControllerStyleAlert];
        [alert addAction:[UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
            NSLog(@"点击确定");
        }]];
    }else
    {
        UIAlertView *alert = [[UIAlertView alloc] initWithTitle:promptTitle message:promptMessage delegate:target cancelButtonTitle:cancelBtnTitle otherButtonTitles:nil];
        alert.tag = tags;
        for (NSString *str in otherBtnTitleArray)
        {
            [alert addButtonWithTitle:str];
        }
        [alert show];
    }
    
}

+(void)setSafetyObject:(id)newObjec forKey:(id)key andDic:(NSMutableDictionary *)dic
{
#ifdef DEBUG//调测时候，出现崩溃newobjet为nil时候继续执行
    if(newObjec == nil)
    {
        NSLog(@"出现字典中设置nil");
    }
    [dic setObject:newObjec forKey:key];
#else
    if(newObjec == nil)
    {
        
    }else{
        [dic setObject:newObjec forKey:key];
    }
#endif
}

+(id)safetyArrayOjectAtIndex:(int)index andArray:(NSMutableArray *)array
{
    NSUInteger count = [array count];
#ifdef DEBUG
    if(count ==0 || array == nil ||index>=count)
    {
        NSLog(@"数组越界，或者数组为nil");
    }
    return [array objectAtIndex:index];
#else
    if(count ==0 || array == nil ||index>=count)
    {
        return  nil;
    }else{
        return [array objectAtIndex:index];
    }
#endif
}

+(void)safetyAddObject:(id)object andArray:(NSMutableArray *)array
{
#ifdef DEBUG
    if(object == nil)
    {
        NSLog(@"添加到数组中的对象为nil");
    }
    [array addObject:object];
#else
    if(object != nil)
    {
        [array addObject:object];
    }
#endif
}

+(void)safetyInsertObject:(id)object atIndex:(int)index andArray:(NSMutableArray *)array
{
#ifdef DEBUG
    if(object == nil)
    {
        NSLog(@"添加到数组中的对象为nil");
    }
    [array insertObject:object atIndex:index];
#else
    if(object != nil)
    {
        [array insertObject:object atIndex:index];
    }
#endif
}

+(BOOL)jugementStringIsNil:(NSString *)str
{
    
    if(str == nil || [str isKindOfClass:[[NSNull null] class]] || str == NULL)
    {
        return YES;
    }else
    {
        return NO;
    }
}

+(BOOL)jugementArrIsNil:(NSArray *)arr
{
    if(arr == nil || [arr isKindOfClass:[[NSNull null] class]] || arr == NULL)
    {
        return YES;
    }else
    {
        return NO;
    }
}

//时间戳转化为时间
+ (NSString *)transferIntervalToStr:(NSString *)intervalStr andFormat:(NSString *)format
{
    NSDateFormatter *dateFrom=[[NSDateFormatter alloc] init];
    [dateFrom setDateFormat:format];
    NSTimeInterval time = [intervalStr doubleValue]/1000;
    //    long long time = [intervalStr longLongValue]/1000;
    NSDate *getDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSString *currentDateStr = [dateFrom stringFromDate:getDate];
    return currentDateStr;
}

//时间戳转化为时间(Local)
+ (NSString *)transferIntervalLocal:(NSString *)intervalStr andFormat:(NSString *)format
{
    NSDateFormatter *dateFrom=[[NSDateFormatter alloc] init];
    [dateFrom setDateFormat:format];
    [dateFrom setTimeZone:[NSTimeZone localTimeZone]];
    //    long long time = [intervalStr longLongValue];
    NSTimeInterval time = [intervalStr doubleValue];
    NSDate *getDate = [NSDate dateWithTimeIntervalSince1970:time];
    NSString *currentDateStr = [dateFrom stringFromDate:getDate];
    return currentDateStr;
}

//获取当前时间
+ (NSString *)getNowDateTime
{
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
    [dateformat setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSString *str = [dateformat stringFromDate:nowDate];
    return str;
}

+ (NSString *)getNowDateTimeWithFormate:(NSString *)formate
{
    NSDate *nowDate = [NSDate date];
    NSDateFormatter *dateformat = [[NSDateFormatter alloc] init];
    [dateformat setDateFormat:formate];
    NSString *str = [dateformat stringFromDate:nowDate];
    return str;
}

+(NSString *)transDuration:(NSString *)seconds
{
    long long time = [seconds longLongValue]/1000;
    long timeD = time/(3600*24);
    long timeH = (time - timeD*3600*24)/3600;
    long timeM = (time - timeD*3600*24 - timeH*3600)/60;
    
    if (timeD>0) {
        if (timeH == 0 && timeM == 0) {
            return [NSString stringWithFormat:@"%ld天",timeD];
        }
        return [NSString stringWithFormat:@"%ld天%ld小时%ld分钟",timeD,timeH,timeM];
    }
    else if (timeH>0){
        return [NSString stringWithFormat:@"%ld小时%ld分钟",timeH,timeM];
    }
    else{
        return [NSString stringWithFormat:@"%ld分钟",timeM];
    }
}

+(NSString *)transDurationWithMin:(NSString *)min
{
    long long time = [min longLongValue];
    long timeD = time/(60*24);
    long timeH = (time - timeD*60*24)/60;
    long timeM = time - timeD*60*24 - timeH*60;
    
    if (timeD>0) {
        if (timeH == 0 && timeM == 0) {
            return [NSString stringWithFormat:@"%ld天",timeD];
        }
        return [NSString stringWithFormat:@"%ld天%ld小时%ld分钟",timeD,timeH,timeM];
    }
    else if (timeH>0){
        return [NSString stringWithFormat:@"%ld小时%ld分钟",timeH,timeM];
    }
    else{
        return [NSString stringWithFormat:@"%ld分钟",timeM];
    }
}


+(NSString *)distance:(NSString *)oldDistance
{
    CGFloat newDist = oldDistance.floatValue;
    if (newDist<1) {
        return @"0m";
    }
    else if (newDist>1000){
        return [NSString stringWithFormat:@"%.1fkm",newDist/1000.0f];
    }
    else{
        return [NSString stringWithFormat:@"%.0fm",newDist];
    }
}

+ (BOOL)validatePlateNo:(NSString *)plateNo
{
    NSPredicate *preDicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",kCarNumberVerify];
    return [preDicate evaluateWithObject:plateNo];
}

+ (BOOL)validateTelnumber:(NSString *)telnumber
{
    NSPredicate *preDicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",kTelnumberVerify];
    return [preDicate evaluateWithObject:telnumber];
}

+ (BOOL) validateIdentityCard: (NSString *)identityCard
{
    BOOL flag;
    if (identityCard.length <= 0) {
        flag = NO;
        return flag;
    }
    NSString *regex2 = @"^(\\d{14}|\\d{17})(\\d|[xX])$";
    NSPredicate *identityCardPredicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",regex2];
    return [identityCardPredicate evaluateWithObject:identityCard];
}

+ (BOOL)validateHanz:(NSString *)hanz
{
    NSPredicate *preDicate = [NSPredicate predicateWithFormat:@"SELF MATCHES %@",kHanz];
    return [preDicate evaluateWithObject:hanz];
}

+(UIFont *)getFont:(CGFloat)fontSize
{
    if (IsIOS9) {
        return [UIFont fontWithName:@"PingFangSC-Light" size:fontSize];
    }
    return [UIFont fontWithName:@"STHeitiSC-Light" size:fontSize];
}

+(UIFont *)getBoldFont:(CGFloat)fontSize
{
    if (IsIOS9) {
        return [UIFont fontWithName:@"PingFangSC-Medium" size:fontSize];
    }
    return [UIFont fontWithName:@"STHeitiSC-Medium" size:fontSize];
}

//生成圆角图片，在屏渲染，降低性能消耗
+ (UIImage *)imageWithCornerRadius:(CGFloat)radius andSize:(CGSize)size
{
    
    CGRect rect = (CGRect){0.f, 0.f, size};
    
    UIGraphicsBeginImageContextWithOptions(size, NO, UIScreen.mainScreen.scale); CGContextAddPath(UIGraphicsGetCurrentContext(), [UIBezierPath bezierPathWithRoundedRect:rect cornerRadius:radius].CGPath); CGContextClip(UIGraphicsGetCurrentContext());
    
    //    [self drawInRect:rect];
    UIImage *image = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    return image;
}

//if (IsIOS8) {
//    UIBlurEffect *blur = [UIBlurEffect effectWithStyle:UIBlurEffectStyleDark];
//    UIVisualEffectView *effectview = [[UIVisualEffectView alloc] initWithEffect:blur];
//    effectview.frame = m_switchView.bounds;
//    //设置模糊透明度
//    effectview.alpha = 0.4f;
//    [m_switchView addSubview:effectview];
//}else{
//
//}

+ (NSString *)getBaiduMapImage:(NSString *)longitude
                   andLatitude:(NSString *)latitude
                       andSize:(CGSize)size
{
    NSString *mapStr = @"";
    if (iPhone4) {
        mapStr = [NSString stringWithFormat:@"http://api.map.baidu.com/staticimage?center=%@,%@&width=%f&height=%f&zoom=16&scale=1",longitude,latitude,size.width,size.height];
    }else
    {
        mapStr = [NSString stringWithFormat:@"http://api.map.baidu.com/staticimage?center=%@,%@&width=%f&height=%f&zoom=16&scale=2",longitude,latitude,size.width,size.height];
    }
    
    return mapStr;
}


/**
 /////  和当前时间比较
 ////   1）1分钟以内 显示        :    刚刚
 ////   2）1小时以内 显示        :    X分钟前
 ///    3）今天或者昨天 显示      :    今天 09:30   昨天 09:30
 ///    4) 今年显示              :   09月12日
 ///    5) 大于本年      显示    :    2016/09/09
 **/
+ (NSString *)formateDate:(NSString *)dateString withFormate:(NSString *) formate
{
    @try {
        //实例化一个NSDateFormatter对象
        NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
        [dateFormatter setDateFormat:formate];
        
        NSDate * nowDate = [NSDate date];
        
        //  将需要转换的时间转换成 NSDate 对象
        NSTimeInterval timeInter = [dateString doubleValue]/1000.0;
        NSDate * needFormatDate = [NSDate dateWithTimeIntervalSince1970:timeInter];
        //  取当前时间和转换时间两个日期对象的时间间隔
        //  这里的NSTimeInterval 并不是对象，是基本型，其实是double类型，是由c定义的:  typedef double NSTimeInterval;
        NSTimeInterval time = [nowDate timeIntervalSinceDate:needFormatDate];
        
        // 再然后，把间隔的秒数折算成天数和小时数：
        
        NSString *dateStr = @"";
        
        if (time<=60) {  // 1分钟以内的
            dateStr = @"刚刚";
        }else if(time<=60*60){  //  一个小时以内的
            
            int mins = time/60;
            dateStr = [NSString stringWithFormat:@"%d分钟前",mins];
            
        }else if(time<=60*60*24){   // 在两天内的
            
            [dateFormatter setDateFormat:@"YYYY/MM/dd"];
            NSString * need_yMd = [dateFormatter stringFromDate:needFormatDate];
            NSString *now_yMd = [dateFormatter stringFromDate:nowDate];
            
            [dateFormatter setDateFormat:@"HH:mm"];
            if ([need_yMd isEqualToString:now_yMd]) {
                // 在同一天
                dateStr = [NSString stringWithFormat:@"今天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }else{
                //  昨天
                dateStr = [NSString stringWithFormat:@"昨天 %@",[dateFormatter stringFromDate:needFormatDate]];
            }
        }else {
            
            [dateFormatter setDateFormat:@"yyyy"];
            NSString * yearStr = [dateFormatter stringFromDate:needFormatDate];
            NSString *nowYear = [dateFormatter stringFromDate:nowDate];
            
            if ([yearStr isEqualToString:nowYear]) {
                //  在同一年
                [dateFormatter setDateFormat:@"MM月dd日"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }else{
                [dateFormatter setDateFormat:@"yyyy/MM/dd"];
                dateStr = [dateFormatter stringFromDate:needFormatDate];
            }
        }
        
        return dateStr;
    }
    @catch (NSException *exception) {
        return @"";
    }
}



@end

