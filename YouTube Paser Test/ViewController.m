//
//  ViewController.m
//  YouTube Paser Test
//
//  Created by Phil Martin on 10/06/2018.
//  Copyright © 2018 Phil Martin. All rights reserved.
//

#import "ViewController.h"
#import "PMYTParser.h"
#import "PMVideoPlayerHelper.h"

#define kViewControllerTestLink @"https://www.youtube.com/watch?v=lL0ikmwY5c4"
#define kViewControllerBadTestLink @"dfdddddddddd"
#define kPadding 10
#define kViewcontrollerYouTube @"youtube"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIImageView *thumbnail = [[UIImageView alloc] init];
    thumbnail.frame = CGRectMake(0,44, self.view.frame.size.width, self.view.frame.size.height/2);
    thumbnail.contentMode = UIViewContentModeScaleToFill;
    NSData *urlData = [NSData dataWithContentsOfURL: [PMYTParser thumbnailUrlForYoutubeURL: [NSURL URLWithString: kViewControllerTestLink] thumbnailSize:YouTubeThumbnailDefault]];
    thumbnail.image = [UIImage imageWithData: urlData];
    [self.view addSubview: thumbnail];
    
    UIButton *playButton = [UIButton buttonWithType: UIButtonTypeCustom];
    playButton.frame = CGRectMake(kPadding, [self bottom: thumbnail] + kPadding, self.view.frame.size.width - kPadding * 2, 30);
    playButton.layer.cornerRadius = 4;
    playButton.backgroundColor = [UIColor blueColor];
    playButton.titleLabel.textColor = [UIColor whiteColor];
    [playButton setTitle: @"Play Video" forState: UIControlStateNormal];
    [playButton addTarget: self action: @selector(playVideo) forControlEvents: UIControlEventTouchUpInside];
    [self.view addSubview: playButton];
}

-(void)playVideo
{
    NSURL *url = [NSURL URLWithString: kViewControllerTestLink];
    NSString *stringFormatOFURL = [NSString stringWithFormat: @"%@", url];
    NSDictionary *videos = [PMYTParser h264videosWithYoutubeURL: url];
    if ([stringFormatOFURL containsString: kViewcontrollerYouTube])
        [PMVideoPlayerHelper showVideoPlayerForYouTubeDependingOniOSVersion: videos];
    else
        [PMVideoPlayerHelper displayErrorParsingVideo];
}

-(CGFloat)bottom: (UIView*)viewToBottom
{
    return viewToBottom.frame.origin.y + viewToBottom.frame.size.height;
}


@end
