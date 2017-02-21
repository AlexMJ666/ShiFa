//
//  Common.h
//  ShiFa
//
//  Created by 马家俊 on 17/1/5.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import <Foundation/Foundation.h>


#define kUserDefaultsCookie     @"UserDefaultCookie_V3_0_X"
#define NUMBERS @"0123456789"

/*****************************APP颜色定义********************/
#define COLOR_GRAY   [UIColor colorWithRed:240.0f/255.0f green:240.0f/255.0f blue:240.0f/255.0f alpha:1]
#define COLOR_Light  [UIColor colorWithRed:56/255.0f green:56/255.0f blue:56/255.0f alpha:0.6]
#define COLOR_Normal [UIColor colorWithRed:56/255.0f green:56/255.0f blue:56/255.0f alpha:1]
#define COLOR_Blue   [UIColor colorWithRed:121/255.0f green:171/255.0f blue:236/255.0f alpha:1]
#define COLOR_Blue2  [UIColor colorWithRed:76/255.0f green:154/255.0f blue:234/255.0f alpha:1]
#define COLOR_Blue3  [UIColor colorWithRed:92/255.0f green:172/255.0f blue:238/255.0f alpha:1]
#define COLOR_lightG [UIColor colorWithRed:153/255.0f green:153/255.0f blue:153/255.0f alpha:1]
#define COLOR_login  [UIColor colorWithRed:186/255.0f green:185/255.0f blue:186/255.0f alpha:1]

//new verson
#define COLOR_BLUE [UIColor colorWithRed:103.0f/255.0f green:202.0f/255.0f blue:220.0f/255.0f alpha:1]
#define COLOR_BLUEH [UIColor colorWithRed:103.0f/255.0f green:202.0f/255.0f blue:220.0f/255.0f alpha:0.5f]
#define COLOR_Border [UIColor colorWithRed:216.0f/255.0f green:216.0f/255.0f blue:216.0f/255.0f alpha:1]
#define COLOR_BACK   [UIColor colorWithRed:88/255.0f green:88/255.0f blue:89/255.0f alpha:1]
#define COLOR_tint [UIColor colorWithRed:106/255.0f green:203/255.0f blue:219/255.0f alpha:1]
#define COLOR_tintHalf [UIColor colorWithRed:106/255.0f green:203/255.0f blue:219/255.0f alpha:0.5f]

#define COLOR_Off [UIColor colorWithRed:235/255.0f green:236/255.0f blue:237/255.0f alpha:1]
#define COLOR_line [UIColor colorWithRed:60/255.0f green:68/255.0f blue:78/255.0f alpha:0.1f]

#define rgb255(a,b,c,d) [UIColor colorWithRed:a/255.0f green:b/255.0f blue:c/255.0f alpha:d]

/*****************************服务器请求固定url前缀********************/
//线上域名
#define HttpServiceUrl @""

#define IMGUrl @""              //图片服务器地址开头

/*****************************取得单类********************/
#define AppManage           [AppContectManager shareInstanceManager]
#define ParkManage          [ParkApply shareInstanceManager]
#define LoginManage         [LoginApply shareInstanceManager]

/*****************************全局变量********************/
#define IsIOS7 ([[[UIDevice currentDevice] systemVersion] floatValue]>=7.0)
#define IsIOS8 ([[[UIDevice currentDevice] systemVersion] floatValue]>=8.0)
#define IsIOS9 ([[[UIDevice currentDevice] systemVersion] floatValue]>=9.0)
#define IsIOS10 ([[[UIDevice currentDevice] systemVersion] floatValue]>=10.0)
//#define IsIOS7 (NSFoundationVersionNumber>=NSFoundationVersionNumber_iOS_7_0)? YES : NO
//#define IsIOS8 (NSFoundationVersionNumber>=NSFoundationVersionNumber_iOS_8_0)? YES : NO
//#define IsIOS9 (NSFoundationVersionNumber>=NSFoundationVersionNumber_iOS_9_0)? YES : NO
//#define IsIOS10 (NSFoundationVersionNumber>=NSFoundationVersionNumber10_0)? YES : NO
/********************ios的3.5，4.0适配操作***************************/
#define kMainScreen_Height [UIScreen mainScreen].bounds.size.height
#define kMainScreen_Width [UIScreen mainScreen].bounds.size.width
#define kMainScreen_Bounds CGRectMake(0.0f, 0.0f, kMainScreen_Width, kMainScreen_Height)
#define NAV_HEIGHT (kMainScreen_Height-20 -44)
#define BAR_HEIGHT (kMainScreen_Height-20 -44 -49)
#define MenuWidth  300
#define iPhone4 ([[UIScreen mainScreen] bounds].size.height == 480)
#define iPhone5 ([[UIScreen mainScreen] bounds].size.height == 568)
#define iPhone6 ([[UIScreen mainScreen] bounds].size.height == 667)
#define iPhone6Plus ([[UIScreen mainScreen] bounds].size.height == 736)

#define UserDefaults [NSUserDefaults standardUserDefaults]

#define kNSLocalizedName        @"Main"             //国际化文件的名称
#define UMSYSTEM_VERSION_GREATER_THAN_OR_EQUAL_TO(v)  ([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] != NSOrderedAscending)

//重写NSLog,Debug模式下打印日志和当前行数
#if DEBUG
#define NSLog(FORMAT, ...) fprintf(stderr,"\nfunction:%s line:%d content:%s\n", __FUNCTION__, __LINE__, [[NSString stringWithFormat:FORMAT, ##__VA_ARGS__] UTF8String]);
#else
#define NSLog(FORMAT, ...) nil
#endif

//获取系统版本
#define IOS_VERSION [[[UIDevice currentDevice] systemVersion] floatValue]
#define CurrentSystemVersion [[UIDevice currentDevice] systemVersion]

/********************正则表达式***************************/
#define kCarNumberVerify @"^[A-Za-z]{1}[A-HJ-NP-Za-hj-np-z0-9\u4e00-\u9fa5]{5}$"
#define kTelnumberVerify @"^[0-9]{11}$"
#define kCodeVerify      @"^[0-9]{4}$"
#define kHanz            @"^[\u4e00-\u9fa5]{1,50}$"

@interface Common : NSObject

@end
