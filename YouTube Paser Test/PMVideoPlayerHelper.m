//
//  PMVideoPlayerHelper.m
//  YouTube Paser Test
//
//  Created by Phil Martin on 10/06/2018.
//  Copyright © 2018 Phil Martin. All rights reserved.
//

#import "PMVideoPlayerHelper.h"
#import "PMCommon.h"

@implementation PMVideoPlayerHelper 

+(void)showVideoPlayerForYouTubeDependingOniOSVersion:(NSDictionary*)vids
{
    UIViewController *vc = [[UIApplication sharedApplication] keyWindow].rootViewController;
    AVPlayerViewController *playerViewController =
    [[AVPlayerViewController alloc] init];
    playerViewController.player =
    [AVPlayer playerWithURL:[NSURL URLWithString:[vids objectForKey:@"medium"]]];
    playerViewController.delegate = self;
    [vc dismissViewControllerAnimated:YES
                           completion:^{
                               
                           }];
    [vc presentViewController:playerViewController animated:YES completion:^{
        
    }];
    playerViewController.view.frame = vc.view.frame;
    
    vc.view.autoresizesSubviews = YES;
    [playerViewController.player play];
   
}
+(void)displayErrorParsingVideo
{
    UIAlertController  *controller = [UIAlertController alertControllerWithTitle: @"Error" message: @"Cannot parse this video link" preferredStyle: UIAlertControllerStyleAlert];
    [controller addAction: [UIAlertAction actionWithTitle: @"OK" style: UIAlertActionStyleCancel handler: nil]];
    [[PMCommon topViewontroller] presentViewController:controller animated: YES completion: nil];
}
@end
