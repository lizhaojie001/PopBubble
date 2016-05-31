//
//  BPPath.m
//  BubblePop
//
//  Created by ios on 16/4/25.
//  Copyright © 2016year Ios. All rights reserved.
//

#import "BPPath.h"

@implementation BPPath
+(NSString*)path{
    NSString *  Path = NSSearchPathForDirectoriesInDomains(NSCachesDirectory, NSAllDomainsMask, YES ).firstObject ;
    NSString *  path = [Path stringByAppendingString:@"/Score.plist"];


    return path;
}
@end
