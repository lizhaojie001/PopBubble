//
//  BPTools.m
//  BubblePop
//
//  Created by ios on 16/4/20.
//  Copyright © 2016Years Ios. All rights reserved.
//

#import "BPTools.h"
#import "UIView+BPView.h"
#import  "BPButton.h"
@interface BPTools()

@property(nonatomic,strong) NSMutableArray  * Arr;
@end
@implementation BPTools
 

- (NSMutableArray *)rectArr {
	if(_rectArr == nil) {
		_rectArr = [NSMutableArray array];
	}
    	return _rectArr;
}
+ (BOOL)layoutView:(UIView *)button andController:(UIViewController *)VC
{
    int BUTTONXLeft = button.x;
    int BUTTONXRight = button.x+button.width;
    int BUTTONYTop = button.y;
    int BUTTONYBottom = button.y+button.heigth;


   BPTools *tools = [BPTools tools];
          if (tools.rectArr.count == 0)
    {
        [tools.rectArr addObject:button];
        //[tools.Arr addObject:button];
        return YES;
    }else
    {
        for (UIView *view in tools.Arr)
        {   int ViewX = view.x;
            int ViewY = view.y;
            int ViewRight = ViewX+view.width;
            int ViewBottom = ViewY + view.heigth;

            //topLeftConner
            if ([view.class isSubclassOfClass:[BPButton class]]) {


            if (BUTTONXLeft>=ViewX&&BUTTONXLeft<=ViewRight)
            {
                if (BUTTONYTop>=ViewY&& BUTTONYTop<ViewBottom)
                {
                    return NO;

                }

            }
            //topRightConner
            if (BUTTONXRight >=ViewX&&BUTTONXRight< ViewRight) {
                if (BUTTONYTop>=ViewY&&BUTTONYTop<ViewBottom) {
                    return NO;
                }

            }
            //leftBottomConner
            if (BUTTONXLeft>=ViewX&&BUTTONXLeft<ViewRight)
            {
                if (BUTTONYBottom>=ViewY&&BUTTONYBottom<ViewBottom)
                {
                    return NO;
                }

            }
            //rightBottomCenner
            if (BUTTONXRight>=ViewX&&BUTTONXRight<ViewRight)
            {
                if (BUTTONYBottom>=ViewY&&BUTTONYBottom<ViewBottom)
                {
                    return NO;
                }

            }


        }


        }

       
    }
 
    [tools.rectArr addObject:button];

    return YES;
}
+ (BPTools *)tools{
    static BPTools * tools = nil;
    if (tools==nil ) {
        tools=[[BPTools alloc]init];
    }
    return tools;
}
- (void)restart{
    [BPTools tools].rectArr = nil;
}
-(void)setArr:(NSMutableArray *)Arr{
    self.Arr = Arr;
}
-(NSMutableArray *)Arr{
    return _rectArr;
}
@end
