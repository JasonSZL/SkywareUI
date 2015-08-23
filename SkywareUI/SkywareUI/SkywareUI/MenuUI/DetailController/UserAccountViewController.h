//
//  UserAccountViewController.h
//  WebIntegration
//
//  Created by 李晓 on 15/8/19.
//  Copyright (c) 2015年 skyware. All rights reserved.
//

#import "BaseTableViewController.h"
#import "SkywareUIConst.h"
#import "UserLoginViewController.h"
#import "UserEditNickNameViewController.h"
#import "UserEditPasswordViewController.h"

@interface UserAccountViewController : BaseTableViewController

/**
 *  用户 NickName
 */
@property (nonatomic,copy) NSString *user_name;
/**
 *  用户 Icon
 */
@property (nonatomic,copy) NSString *user_img;

@end
