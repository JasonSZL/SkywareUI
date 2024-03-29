//
//  SkywareSDKManager.m
//  SkywareSDK
//
//  Created by 李晓 on 15/12/1.
//  Copyright © 2015年 skyware. All rights reserved.
//

#import "SkywareSDKManager.h"
#import <UserDefaultsTool.h>
#import "SkywareConst.h"

@implementation SkywareSDKManager

LXSingletonM(SkywareSDKManager)

static NSArray *service_type_array ;

+ (void)initialize
{
    // 开发（0,1） 测试（2,3） 正式（4，5）
    service_type_array = @[@"v1", @"c1", @"v2", @"c3", @"v3", @"c2"];
}

//- (NSString *)token
//{
//    [[NSNotificationCenter defaultCenter ] postNotificationName:kNotUser_tokenGotoLogin object:nil];
//    return _token;
//}
//
//
- (void)PostApplicationDidBecomeActive
{
    [[NSNotificationCenter defaultCenter] postNotificationName:kApplicationDidBecomeActive object:nil];
}


- (void)setService_ype:(SkywareSDK_Service_Type)service_ype
{
    // 先从本地加载设置值，
    NSString *type =  [UserDefaultsTool getUserDefaultsForKey:@"service_type"];
    if (type == nil || type.length == 0) {
        self.service = service_type_array[service_ype];
    }else{
        self.service = [service_type_array objectAtIndex:[type integerValue]];
    }
}

#pragma mark - 懒加载 -

- (NSMutableArray *)bind_Devices_Array
{
    if (!_bind_Devices_Array) {
        _bind_Devices_Array = [[NSMutableArray alloc] init];
    }
    return _bind_Devices_Array;
}

- (NSMutableDictionary *)bind_Devices_Dict
{
    if (!_bind_Devices_Dict) {
        _bind_Devices_Dict = [[NSMutableDictionary alloc] init];
    }
    return _bind_Devices_Dict;
}

@end
