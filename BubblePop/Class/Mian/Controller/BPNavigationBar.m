//
//  BPNavigationBar.m
//  BubblePop
//
//  Created by ios on 16/4/19.
//  Copyright © 2016year Ios. All rights reserved.
//

#import "BPNavigationBar.h"

@implementation BPNavigationBar

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)layoutSubviews {
    [super layoutSubviews];
    self.imageView  = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"backgroundImage"]];


    //[self.layer addSublayer:self.imageView.layer];
    [self setView];
}
- (void) setView{
    for (UIView * view in self .subviews) {
        MYLog(@"%@",[view class]);
        if ([[view class] isSubclassOfClass:NSClassFromString(@"_UINavigationBarBackground")]) {
            MYLog(@"%s",__func__);
            self.imageView.frame = view.bounds;
            [view.layer addSublayer:self.imageView.layer];
        }
//        if ([[view class] isSubclassOfClass:NSClassFromString(@"_UINavigationBarBackIndicatorView")]) {
//            MYLog(@"%s",__func__);
//            UIImageView *imageView = [[UIImageView alloc]initWithImage:[UIImage imageNamed:@"back"]];
//             imageView.frame = view.bounds;
//            [view.layer addSublayer: imageView.layer];
//        }

    }
}

@end
