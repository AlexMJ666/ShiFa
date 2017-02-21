//
//  MPhotoBrower.m
//  EasyPark
//
//  Created by 马家俊 on 17/1/13.
//  Copyright © 2017年 shaoxu. All rights reserved.
//

#import "MPhotoBrower.h"
#import "MBProgressHUD.h"
#import <UIImageView+WebCache.h>

#define MaxSCale 3.0  //最大缩放比例
#define MinScale 1.0  //最小缩放比例

@interface MPhotoBrower()<UIScrollViewDelegate>
{
    CGRect orginRect;
    UIScrollView* m_scrollView;
}
@property (nonatomic,assign) CGFloat totalScale;
@property (nonatomic,strong) UIScrollView* p_scrollView;
@end
@implementation MPhotoBrower
@synthesize readyForZoomImg;
@synthesize p_scrollView = m_scrollView;

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.p_scrollView = [[UIScrollView alloc]initWithFrame:frame];
        self.backgroundColor = [UIColor blackColor];
        self.p_scrollView.scrollEnabled = YES;
        self.p_scrollView.bounces = YES;
        self.p_scrollView.delegate = self;
        self.p_scrollView.userInteractionEnabled = YES;
        self.p_scrollView.contentSize = CGSizeMake(kMainScreen_Width, kMainScreen_Height);
        self.p_scrollView.minimumZoomScale = 1.0f;
        self.p_scrollView.maximumZoomScale = 2.0f;
    }
    return self;
}

-(void)initImg:(UIImageView*) smallImgV andSuperView:(UIView*)superV andPosition:(MPhotoBrowerPosition)position
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    
    switch (position) {
        case kPutItInWindow:
            orginRect =[smallImgV convertRect: smallImgV.bounds toView:window];
            break;
        case kPutItInView:
            orginRect =[smallImgV convertRect: smallImgV.bounds toView:superV];
            break;
        default:
            break;
    }
    
    if (!readyForZoomImg) {
        readyForZoomImg = [[UIImageView alloc]initWithFrame:orginRect];
        readyForZoomImg.image = smallImgV.image;
        readyForZoomImg.userInteractionEnabled = YES;
        UITapGestureRecognizer* singleRecognizer;
        singleRecognizer = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(carImgTap:)];
        //点击的次数
        singleRecognizer.numberOfTapsRequired = 1; // 单击
        
        [readyForZoomImg addGestureRecognizer:singleRecognizer];
        
        //UIPinchGestureRecognizer* PinchGesture = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(PinchPressed:)];
        //[readyForZoomImg addGestureRecognizer:PinchGesture];
        
        self.p_scrollView.contentSize = readyForZoomImg.image.size;
        [self addSubview:readyForZoomImg];
    }
    
    [self touchSmallImg];
    
    [window addSubview:self];
}

-(void)touchSmallImg
{
    [UIView animateWithDuration:0.5f animations:^{
        [readyForZoomImg setFrame:CGRectMake(0, 0, kMainScreen_Width, 9*kMainScreen_Width/16.0f)];
        readyForZoomImg.center = self.center;
    }];
}

//缩放过程中的图像
-(UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    return readyForZoomImg;
}

//缩放结束
-(void)scrollViewDidEndZooming:(UIScrollView *)scrollView withView:(UIView *)view atScale:(CGFloat)scale{
    NSLog(@"缩放的比例:%f",scale);
}

//缩放中
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSLog(@"缩放中");
}

-(void)carImgTap:(UIGestureRecognizer*)ges
{
    [UIView animateWithDuration:0.5f animations:^{
        self.p_scrollView.zoomScale = 1.0f;
        self.backgroundColor = [UIColor clearColor];
        [readyForZoomImg setFrame:orginRect];
    }completion:^(BOOL finished) {
        [self removeFromSuperview];
    }];
}

-(void)PinchPressed:(UIPinchGestureRecognizer*)sender
{
    CGFloat scale = sender.scale;
    if (readyForZoomImg.frame.size.width >= self.frame.size.width ||scale > 1.0f) {
        sender.view.transform = CGAffineTransformScale(sender.view.transform, scale, scale);
        self.p_scrollView.contentSize = readyForZoomImg.frame.size;
        NSLog(@"%f",sender.scale);
        //NSLog(@"heoght = %f, width = %f",self.frame.size.height,self.frame.size.width);
        NSLog(@"readyForZoomImgheoght = %f, readyForZoomImgwidth = %f",readyForZoomImg.frame.size.height,readyForZoomImg.frame.size.width);
        NSLog(@"contentSizeheoght = %f, contentSizewidth = %f",self.p_scrollView.contentSize.height,self.p_scrollView.contentSize.width);
        sender.scale = 1.0;
    }
    
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
