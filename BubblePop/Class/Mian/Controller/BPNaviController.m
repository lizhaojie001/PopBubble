//
//  BPNaviController.m
//  BubblePop
//
//  Created by ios on 16/4/19.
//  Copyright © 2016year Ios. All rights reserved.
//

#import "BPNaviController.h"
#import "BPNavigationBar.h"
@interface BPNaviController ()

@end

@implementation BPNaviController
+(void)initialize{
    //setItemColorOfAll
    UIBarButtonItem *item = [UIBarButtonItem appearanceWhenContainedInInstancesOfClasses:@[[self class]]];
    NSMutableDictionary *dic = [NSMutableDictionary dictionary];
    dic[NSForegroundColorAttributeName] = [UIColor colorWithRed:249/255.0 green:62/255.0 blue:112/255.0 alpha:0.7];
    dic[NSFontAttributeName] = [UIFont systemFontOfSize:20];
    [item setTitleTextAttributes:dic forState:UIControlStateNormal];

}
- (void)viewDidLoad {
    [super viewDidLoad];

    MYLog(@"%@",self.navigationBar.subviews);
    // Do any additional setup after loading the view.
}
- (void)viewWillAppear:(BOOL)animated {
    MYLog(@"---------------------\n%@",self.navigationBar.subviews);
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



@end
