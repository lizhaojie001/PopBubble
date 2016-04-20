//
//  BPNextController.h
//  BubblePop
//
//  Created by ios on 16/4/19.
//  Copyright © 2016年 Ios. All rights reserved.
//

#import <UIKit/UIKit.h>
typedef void(^BPNextControllerBlock) (NSUInteger time);
@interface BPNextController : UIViewController
@property (nonatomic,strong) BPNextControllerBlock block;
@end
