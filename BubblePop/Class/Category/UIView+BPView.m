//
//  UIView+BPView.m
//  BubblePop
//
//  Created by ios on 16/4/20.
//  Copyright © 2016year Ios. All rights reserved.
//

#import "UIView+BPView.h"

@implementation UIView (BPView)

-(void)setX:(int)x{
    self.x =x;
}
-(int)x{
    return self.frame.origin.x;
}
-(void)setY:(int)y{
    self.y = y;
}
-(int)y{
    return self.frame.origin.y;
}
-(void)setWidth:(CGFloat)width{
    self.width = width;
}
-(CGFloat)width{
    return self.frame.size.width;
}
-(void)setHeigth:(CGFloat)heigth{
    self.heigth =heigth;
}
-(CGFloat)heigth{
    return self.frame.size.height;
}
@end
