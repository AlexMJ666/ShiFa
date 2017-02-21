//
//  MPhotoBrower.h
//  EasyPark
//
//  Created by 马家俊 on 17/1/13.
//  Copyright © 2017年 shaoxu. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    kPutItInView,
    kPutItInWindow,
} MPhotoBrowerPosition;
@interface MPhotoBrower : UIView
{
    UIImageView* readyForZoomImg;
}
@property(nonatomic,strong) UIImageView* readyForZoomImg;
-(void)initImg:(UIImageView*) smallImgV andSuperView:(UIView*)superV andPosition:(MPhotoBrowerPosition)position;
@end
