//
//  BPIntroduce.m
//  BubblePop
//
//  Created by ios on 16/4/25.
//  Copyright © 2016year Ios. All rights reserved.
//

#import "BPIntroduce.h"

@interface BPIntroduce ()

@end

@implementation BPIntroduce

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc]initWithTitle:@"❀" style:0 target:self action:@selector(backToPre:)];
}
- (void)backToPre:(UIBarButtonItem *)item{
    [self.navigationController popViewControllerAnimated:YES];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

 

@end
