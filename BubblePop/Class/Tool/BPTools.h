//
//  BPTools.h
//  BubblePop
//
//  Created by ios on 16/4/20.
//  Copyright © 2016year Ios. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
@interface BPTools : NSObject
+ (BOOL)layoutView:(UIView* )view andController:(UIViewController*)VC;
+ (BPTools*)tools;
//@property(nonatomic,strong) NSMutableArray  * ButtonArr;
/** saveCoordinateOfBubble*/
@property(nonatomic,strong) NSMutableArray  * rectArr;

- (void)restart;
@end
