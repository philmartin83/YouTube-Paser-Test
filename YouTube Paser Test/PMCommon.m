//
//  PMCommon.m
//  YouTube Paser Test
//
//  Created by Phil Martin on 10/06/2018.
//  Copyright © 2018 Phil Martin. All rights reserved.
//

#import "PMCommon.h"

@implementation PMCommon

+(UIViewController*)topViewontroller
{
    UIWindow *window = [UIApplication sharedApplication].keyWindow;
    UIViewController *vc = [window rootViewController];
    return vc;
}

@end
