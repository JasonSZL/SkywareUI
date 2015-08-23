//
//  SkywareUIInstanceModel.m
//  WebIntegration
//
//  Created by 李晓 on 15/8/20.
//  Copyright (c) 2015年 skyware. All rights reserved.
//

#import "SkywareUIInstanceModel.h"

@implementation SkywareUIInstanceModel
LXSingletonM(SkywareUIInstanceModel)

- (UIColor *)All_view_bgColor
{
    if (_All_button_bgColor == nil) {
        return [UIColor whiteColor];
    }else{
        return _All_button_bgColor;
    }
}

- (UIColor *)All_button_bgColor
{
    if (_All_button_bgColor == nil) {
        return [UIColor lightGrayColor];
    }else{
        return _All_button_bgColor;
    }
}




@end
