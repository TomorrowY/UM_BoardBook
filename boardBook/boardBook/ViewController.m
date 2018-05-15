//
//  ViewController.m
//  boardBook
//
//  Created by admin on 2018/5/14.
//  Copyright © 2018年 JC. All rights reserved.
//

#import "ViewController.h"
#import "UMShareTypeViewController.h"
#import "UMShareTypeViewController.h"
#import <UShareUI/UShareUI.h>

@interface ViewController ()

@property (nonatomic, assign) UMSocialPlatformType platform;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeSystem];
    [button setTitle:@"新浪微博授权登录" forState:UIControlStateNormal];
    button.frame = CGRectMake(100, 250, 100, 40);
    button.tag = Sina_InfoType;
    [button addTarget:self action:@selector(LoginAction:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
    
    UIButton *button2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button2 setTitle:@"页面底部菜单-1" forState:UIControlStateNormal];
    button2.frame = CGRectMake(30, 300, 120, 40);
    [self.view addSubview:button2];
//    button2.tag = QQ_InfoType;
    [button2 addTarget:self action:@selector(LoginAction2) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button22 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button22 setTitle:@"页面中部菜单-1" forState:UIControlStateNormal];
    button22.frame = CGRectMake(200, 300, 120, 40);
    [self.view addSubview:button22];
    //    button2.tag = QQ_InfoType;
    [button22 addTarget:self action:@selector(LoginAction22) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *bottom2 = [UIButton buttonWithType:UIButtonTypeSystem];
    [bottom2 setTitle:@"页面底部菜单-2" forState:UIControlStateNormal];
    bottom2.frame = CGRectMake(30, 450, 120, 40);
    [self.view addSubview:bottom2];
    //    button2.tag = QQ_InfoType;
    [bottom2 addTarget:self action:@selector(bottomAction) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *bottom3 = [UIButton buttonWithType:UIButtonTypeSystem];
    [bottom3 setTitle:@"页面中部菜单-2" forState:UIControlStateNormal];
    bottom3.frame = CGRectMake(200, 450, 120, 40);
    [self.view addSubview:bottom3];
    //    button2.tag = QQ_InfoType;
    [bottom3 addTarget:self action:@selector(bottomAction3) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button3 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button3 setTitle:@"取消授权" forState:UIControlStateNormal];
    button3.frame = CGRectMake(100, 350, 100, 40);
    [self.view addSubview:button3];
    button3.tag = WeChar_InfoType;
    [button3 addTarget:self action:@selector(LoginAction3) forControlEvents:UIControlEventTouchUpInside];
    
    
    UIButton *button4 = [UIButton buttonWithType:UIButtonTypeSystem];
    [button4 setTitle:@"分享" forState:UIControlStateNormal];
    button4.frame = CGRectMake(100, 400, 100, 40);
    [self.view addSubview:button4];
//    button4.tag = Alipay_InfoType;
    [button4 addTarget:self action:@selector(ShareView) forControlEvents:UIControlEventTouchUpInside];
}

- (void) LoginAction :(UIButton *) button {
    NSLog(@"新浪微博");
    if (button.tag == Sina_InfoType) {
        self.platform = UMSocialPlatformType_Sina;
    }
    if (button.tag == WeChar_InfoType) {
        self.platform = UMSocialPlatformType_WechatSession;
    }
    if (button.tag == QQ_InfoType) {
        self.platform = UMSocialPlatformType_QQ;
    }
    if (button.tag == Alipay_InfoType) {
        self.platform = Alipay_InfoType;
    }
    
    [[UMSocialManager defaultManager] getUserInfoWithPlatform:self.platform currentViewController:self completion:^(id result, NSError *error) {
        
        UMSocialUserInfoResponse *resp = result;
        
        // 第三方登录数据(为空表示平台未提供)
        // 授权数据
        NSLog(@" uid: %@", resp.uid);
        NSLog(@" openid: %@", resp.openid);
        NSLog(@" accessToken: %@", resp.accessToken);
        NSLog(@" refreshToken: %@", resp.refreshToken);
        NSLog(@" expiration: %@", resp.expiration);
        
        // 用户数据
        NSLog(@" name: %@", resp.name);
        NSLog(@" iconurl: %@", resp.iconurl);
        NSLog(@" gender: %@", resp.unionGender);
        
        // 第三方平台SDK原始数据
        NSLog(@" originalResponse: %@", resp.originalResponse);
    }];
}
- (void) LoginAction2 {
    [UMSocialUIManager addCustomPlatformWithoutFilted:UMSocialPlatformType_UserDefine_Begin+2
                                     withPlatformIcon:[UIImage imageNamed:@"icon_circle"]
                                     withPlatformName:@"演示icon"];
    
    [UMSocialShareUIConfig shareInstance].sharePageGroupViewConfig.sharePageGroupViewPostionType = UMSocialSharePageGroupViewPositionType_Bottom;
    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageItemStyleType = UMSocialPlatformItemViewBackgroudType_None;
    
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        //在回调里面获得点击的
        if (platformType == UMSocialPlatformType_UserDefine_Begin+2) {
            NSLog(@"点击演示添加Icon后该做的操作");
            dispatch_async(dispatch_get_main_queue(), ^{
                
                UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"添加自定义icon"
                                                                message:@"具体操作方法请参考UShareUI内接口文档"
                                                               delegate:nil
                                                      cancelButtonTitle:NSLocalizedString(@"确定", nil)
                                                      otherButtonTitles:nil];
                [alert show];
                
            });
        }
        else{
            [self runShareWithType:platformType];
        }
    }];
}
//中部一
- (void) LoginAction22 {
    
    [UMSocialUIManager removeAllCustomPlatformWithoutFilted];
    [UMSocialShareUIConfig shareInstance].sharePageGroupViewConfig.sharePageGroupViewPostionType = UMSocialSharePageGroupViewPositionType_Middle;
    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageItemStyleType = UMSocialPlatformItemViewBackgroudType_None;
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        
        [self runShareWithType:platformType];
    }];
}
- (void) LoginAction3 {
    //解除授权
    [[UMSocialManager defaultManager] cancelAuthWithPlatform:UMSocialPlatformType_Sina completion:^(id result, NSError *error) {
        NSLog(@"%@----",result);
    }];
}
- (void) ShareView {
    UMShareTypeViewController *VC = [[UMShareTypeViewController alloc] initWithType:UMSocialPlatformType_Sina];
    [self.navigationController pushViewController:VC animated:YES];
    
}


- (void)runShareWithType:(UMSocialPlatformType)type
{
    UMShareTypeViewController *VC = [[UMShareTypeViewController alloc] initWithType:type];
    [self.navigationController pushViewController:VC animated:YES];
}
//底部弹出2
- (void) bottomAction {
    [UMSocialUIManager removeAllCustomPlatformWithoutFilted];
    [UMSocialShareUIConfig shareInstance].sharePageGroupViewConfig.sharePageGroupViewPostionType = UMSocialSharePageGroupViewPositionType_Bottom;
    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageItemStyleType = UMSocialPlatformItemViewBackgroudType_IconAndBGRadius;
    
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        
        
        [self runShareWithType:platformType];
    }];
}
//中部弹出2
- (void) bottomAction3 {
    [UMSocialUIManager removeAllCustomPlatformWithoutFilted];
    [UMSocialShareUIConfig shareInstance].sharePageGroupViewConfig.sharePageGroupViewPostionType = UMSocialSharePageGroupViewPositionType_Middle;
    [UMSocialShareUIConfig shareInstance].sharePageScrollViewConfig.shareScrollViewPageItemStyleType = UMSocialPlatformItemViewBackgroudType_IconAndBGRadius;
    
    [UMSocialUIManager showShareMenuViewInWindowWithPlatformSelectionBlock:^(UMSocialPlatformType platformType, NSDictionary *userInfo) {
        
        [self runShareWithType:platformType];
    }];
}
@end
