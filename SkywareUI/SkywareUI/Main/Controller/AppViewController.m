//
//  AppViewController.m
//  WebDemo
//
//  Created by 李晓 on 15/8/24.
//  Copyright (c) 2015年 skyware. All rights reserved.
//

#import "AppViewController.h"
#import <UIWindow+Extension.h>
#import "AddDeviceViewController.h"
#import "UserLoginViewController.h"
#import "MenuViewController.h"

#define SYSTEM_VERSION_LESS_THAN(v)([[[UIDevice currentDevice] systemVersion] compare:v options:NSNumericSearch] == NSOrderedAscending)

@interface AppViewController ()

@end

@implementation AppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"SkywareUI"];
    [self setupData];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    if (SYSTEM_VERSION_LESS_THAN(@"8.0")) {
        self.tableView.y = 64;
    }
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (SYSTEM_VERSION_LESS_THAN(@"8.0")) {
        self.tableView.y = 64;
    }
}

- (void) setupData
{
    BaseArrowCellItem *item1 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"AddDevice" SubTitle:@"添加设备" ClickOption:^{
        AddDeviceViewController *add = [[AddDeviceViewController alloc] init];
        add.isAddDevice = YES;
        [self.navigationController pushViewController:add animated:YES];
    } AndDetailClass:nil];
    
    BaseArrowCellItem *item2 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"UserMenu" SubTitle:@"菜单选项" ClickOption:^{
        SkywareInstanceModel *instance = [SkywareInstanceModel sharedSkywareInstanceModel];
        if(!instance.token.length){
            [SVProgressHUD showErrorWithStatus:@"查看菜单请先登录"];
            return ;
        }
        MenuViewController *menu = [[MenuViewController alloc] init];
        [self.navigationController pushViewController:menu animated:YES];
    } AndDetailClass:nil];
    
    BaseCellItemGroup *group = [BaseCellItemGroup createGroupWithItem:@[item1,item2]];
    [self.dataList addObject:group];
    
}

@end
