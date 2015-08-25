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

@interface AppViewController ()

@end

@implementation AppViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNavTitle:@"SkywareUI"];
    [self setupData];
}

- (void) setupData
{
    BaseArrowCellItem *item1 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"AddDevice" SubTitle:nil ClickOption:^{
        AddDeviceViewController *add = [[AddDeviceViewController alloc] init];
        add.isAddDevice = YES;
        [self.navigationController pushViewController:add animated:YES];
    } AndDetailClass:nil];
    
    BaseArrowCellItem *item2 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"UserLogin" SubTitle:nil ClickOption:^{
        UserLoginViewController *loginRegister = [[UIStoryboard storyboardWithName:@"User" bundle:nil] instantiateViewControllerWithIdentifier:@"UserLoginViewController"];
        [self.navigationController pushViewController:loginRegister animated:YES];
    } AndDetailClass:nil];
    
    BaseArrowCellItem *item3 = [BaseArrowCellItem createBaseCellItemWithIcon:nil AndTitle:@"UserMenu" SubTitle:nil ClickOption:^{
        SkywareInstanceModel *instance = [SkywareInstanceModel sharedSkywareInstanceModel];
        if(!instance.token.length){
            [SVProgressHUD showErrorWithStatus:@"查看菜单请先登录"];
            return ;
        }
        MenuViewController *menu = [[MenuViewController alloc] init];
        [self.navigationController pushViewController:menu animated:YES];
    } AndDetailClass:nil];
    
    
    BaseCellItemGroup *group = [BaseCellItemGroup createGroupWithItem:@[item1,item2,item3]];
    [self.dataList addObject:group];
    
}

@end
