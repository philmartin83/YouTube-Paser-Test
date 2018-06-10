//
//  PMVideoPlayerHelper.h
//  YouTube Paser Test
//
//  Created by Phil Martin on 10/06/2018.
//  Copyright © 2018 Phil Martin. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AVFoundation/AVFoundation.h>
#import <AVKit/AVKit.h>

@interface PMVideoPlayerHelper : NSObject <AVPlayerViewControllerDelegate, AVPictureInPictureControllerDelegate>
+(void)showVideoPlayerForYouTubeDependingOniOSVersion:(NSDictionary*)vids;
+(void)displayErrorParsingVideo;
@end
