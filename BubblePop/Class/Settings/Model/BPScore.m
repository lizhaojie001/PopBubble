//
//  BPScore.m
//  BubblePop
//
//  Created by ios on 16/4/25.
//  Copyright © 2016year Ios. All rights reserved.
//

#import "BPScore.h"
#import "BPPath.h"
@implementation BPScore
+ (NSArray *)allKeys{
    static NSMutableArray * arr = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        arr = [NSMutableArray array];
        NSDictionary * dic = [NSDictionary dictionaryWithContentsOfFile:[BPPath path]];
        for (NSString * key in [dic allKeys]) {
            [arr addObject:key];
        }
    });

    return arr ;
}


@end
