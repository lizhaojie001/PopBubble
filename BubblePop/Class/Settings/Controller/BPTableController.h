//
//  BPTableController.h
//  BubblePop
//
//  Created by ios on 16/4/18.
//  Copyright © 2016年 Ios. All rights reserved.
//

#import <UIKit/UIKit.h>
@class BPViewController;
@protocol BPViewControllerDelegate <NSObject>

- (void)BPViewController:(BPViewController *)VC andSecond:(NSUInteger )second andNumberPaoPao:(NSUInteger) PaoPaoNumber;

@end
@interface BPTableController : UITableViewController
@property (nonatomic,weak) id<BPViewControllerDelegate> delegate;
@end
