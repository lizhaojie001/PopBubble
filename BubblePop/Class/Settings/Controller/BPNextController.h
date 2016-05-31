//
//  BPNextController.h
//  BubblePop
//
//  Created by ios on 16/4/19.
//  Copyright © 2016year Ios. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BPViewController.h"
typedef void(^BPNextControllerBlock) (NSUInteger time,NSUInteger numberOfBubble);
@interface BPNextController : UIViewController
@property (nonatomic,strong) BPViewController * preVc;
@property (nonatomic,strong) BPNextControllerBlock block;
@end
