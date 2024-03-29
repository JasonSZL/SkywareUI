//
//  AppDelegate.m
//  SkywareUI
//
//  Created by 李晓 on 15/8/21.
//  Copyright (c) 2015年 skyware. All rights reserved.
//

#import "AppDelegate.h"
#import "AddDeviceViewController.h"
#import "SkywareUIInstance.h"
#import <SMS_SDK/SMSSDK.h>
#import <SMS_SDK/SMSSDK+AddressBookMethods.h>
#import <ImportClass.h>
#import "UserLoginViewController.h"

#define SMS_SDKAppKey    @"888af4137d99"
#define SMS_SDKAppSecret  @"907cae6bb1ecc40c41182c0109b61a21"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    // 设置 App_id
    SkywareSDKManager *manager = [SkywareSDKManager sharedSkywareSDKManager];
    manager.app_id = 5;
    manager.service_ype = developer_new; // 开发服务器
    
    // 设置弹出框后不可操作
    [SVProgressHUD setDefaultMaskType:SVProgressHUDMaskTypeClear];
    [SVProgressHUD setBackgroundColor:kRGBColor(230, 230, 230, 1)];
    
    // 启动ShareSDK 的短信功能,关闭获取通讯录功能
    [SMSSDK registerApp:SMS_SDKAppKey withSecret:SMS_SDKAppSecret];
    [SMSSDK enableAppContactFriends:NO];
    
    // 设置系统样式
    [self settingSystemStyle];
    
    self.window = [[UIWindow alloc] initWithFrame:[UIScreen mainScreen].bounds];
    self.window.backgroundColor = [UIColor whiteColor];
    UserLoginViewController *loginRegister = [[UIStoryboard storyboardWithName:@"User" bundle:nil] instantiateInitialViewController];
    self.window.rootViewController = loginRegister;
    self.navigationController = (UINavigationController *)loginRegister;
    [self.window makeKeyAndVisible];
    
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


#pragma mark - Method

- (void) settingSystemStyle
{
    SkywareUIInstance *instance = [SkywareUIInstance sharedSkywareUIInstance];
    instance.All_button_bgColor = kRGBColor(235, 86, 77, 1);
    instance.User_view_bgColor = kRGBColor(236, 236, 236, 1);
}

@end
