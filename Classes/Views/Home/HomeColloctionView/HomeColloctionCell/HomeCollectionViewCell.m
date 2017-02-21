//
//  HomeCollectionViewCell.m
//  ShiFa
//
//  Created by 马家俊 on 17/2/21.
//  Copyright © 2017年 MJJ. All rights reserved.
//

#import "HomeCollectionViewCell.h"

@interface HomeCollectionViewCell()


@end
@implementation HomeCollectionViewCell
@synthesize _img;
@synthesize _name;

-(instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
    
    }
    return self;
}

-(void)awakeFromNib{
    [super awakeFromNib];
}

@end
