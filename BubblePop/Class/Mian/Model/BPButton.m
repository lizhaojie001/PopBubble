//
//  BPButton.m
//  BubblePop
//
//  Created by ios on 16/4/20.
//  Copyright © 2016year Ios. All rights reserved.
//

#import "BPButton.h"
@interface BPButton()
@property (strong, nonatomic)   UIButton *button;
/** saveColorOfBubble*/
@property (nonatomic,strong) NSArray * colorArray;
@end
@implementation BPButton
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        int a = arc4random()%(self.colorArray.count);
        MYLog(@"a ===%d",a);
        switch (a) {
            case 0 ... 7:
                self.button.tag = 1;
                break;
            case 8 ... 13:
                self.button.tag = 2;
                break;
            case 14  ... 16:
                self.button.tag = 5;
                break;
            case 17 ... 18:
                self.button.tag = 8;
                break;

            default:
                self.button.tag = 10;
                break;
        }
        [_button setImage:[UIImage imageNamed:self.colorArray[a]] forState:UIControlStateNormal];

    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
 
- (NSArray *)colorArray {
	if(_colorArray == nil) {
		_colorArray =
  @[
    @"red",@"red",@"red",@"red",@"red",@"red",@"red",@"red",
    @"pink",@"pink",@"pink",@"pink",@"pink",@"pink",
    @"green",@"green",@"green",
    @"blue",@"blue",
    @"black",
    ];
	}
	return _colorArray;
}

- (UIButton *)button {
	if(_button == nil) {
		_button = [[UIButton alloc] initWithFrame:self.bounds];
        [self addSubview:_button];
        [_button addTarget:self action:@selector(passByValue:) forControlEvents:UIControlEventTouchUpInside];
	}
	return _button;
}
- (void)passByValue:(UIButton*)button{
   // NSNotification * notification = [NSNotification notificationWithName:@"passValue" object:nil];
    [[NSNotificationCenter defaultCenter] postNotificationName:@"passValue" object:button];
    
}
@end
