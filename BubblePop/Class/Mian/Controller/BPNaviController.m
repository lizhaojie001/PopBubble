//
//  BPNaviController.m
//  BubblePop
//
//  Created by ios on 16/4/19.
//  Copyright © 2016年 Ios. All rights reserved.
//

#import "BPNaviController.h"
#import "BPNavigationBar.h"
@interface BPNaviController ()

@end

@implementation BPNaviController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置全局item的字体颜色
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedIn:[self class], nil];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = [UIColor colorWithRed:99/255.0 green:42/255.0 blue:64/255.0 alpha:0.4];
    [item setTitleTextAttributes:dic forState:UIControlStateNormal];

    NSLog(@"%@",self.navigationBar.subviews);
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"---------------------\n%@",self.navigationBar.subviews);
    BPNavigationBar *  navigationBar = [[BPNavigationBar alloc]initWithFrame:self.navigationBar.bounds];

    [self setValue:navigationBar forKey:@"navigationBar"];
}
- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated{
    [super pushViewController:viewController animated:animated];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
