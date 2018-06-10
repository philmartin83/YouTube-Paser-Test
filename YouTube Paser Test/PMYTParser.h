//
//  PMYTParser.h
//  YouTube Paser Test
//
//  Created by Phil Martin on 10/06/2018.
//  Copyright © 2018 Phil Martin. All rights reserved.
//

#import <Foundation/Foundation.h>

#if    TARGET_OS_IPHONE
#import <UIKit/UIKit.h>
#else
#import <Cocoa/Cocoa.h>
#endif

#if TARGET_OS_IPHONE
#define HCImage UIImage
#else
#define HCImage NSImage
#endif

typedef enum {
    YouTubeThumbnailDefault,
    YouTubeThumbnailDefaultMedium,
    YouTubeThumbnailDefaultHighQuality,
    YouTubeThumbnailDefaultMaxQuality
} YouTubeThumbnail;

@interface PMYTParser : NSObject

+ (NSString *)youtubeIDFromYoutubeURL:(NSURL *)youtubeURL;

/**
 Method for retreiving a iOS supported video link
 
 @param youtubeURL the the complete youtube video url
 @return dictionary with the available formats for the selected video
 
 */
+ (NSDictionary *)h264videosWithYoutubeURL:(NSURL *)youtubeURL;

/**
 Method for retreiving an iOS supported video link
 
 @param youtubeID the id of the youtube video
 @return dictionary with the available formats for the selected video
 
 */
+ (NSDictionary *)h264videosWithYoutubeID:(NSString *)youtubeID;

/**
 Block based method for retreiving a iOS supported video link
 
 @param youtubeURL the the complete youtube video url
 @param completeBlock the block which is called on completion
 
 */
+ (void)h264videosWithYoutubeURL:(NSURL *)youtubeURL
                   completeBlock:(void(^)(NSDictionary *videoDictionary, NSError *error))completeBlock;

/**
 Method for retreiving a thumbnail url for wanted youtube id
 
 @param youtubeURL the complete youtube video id
 @param thumbnailSize the wanted size of the thumbnail
 */
+ (NSURL *)thumbnailUrlForYoutubeURL:(NSURL *)youtubeURL
                       thumbnailSize:(YouTubeThumbnail)thumbnailSize;

/**
 Method for retreiving a thumbnail for wanted youtube url
 
 @param youtubeURL the the complete youtube video url
 @param thumbnailSize the wanted size of the thumbnail
 @param completeBlock the block which is called on completion
 */
+ (void)thumbnailForYoutubeURL:(NSURL *)youtubeURL
                 thumbnailSize:(YouTubeThumbnail)thumbnailSize
                 completeBlock:(void(^)(HCImage *image, NSError *error))completeBlock;

/**
 Method for retreiving a thumbnail for wanted youtube id
 
 @param youtubeURL the complete youtube video id
 @param thumbnailSize the wanted size of the thumbnail
 @param completeBlock the block which is called on completion
 */
+ (void)thumbnailForYoutubeID:(NSString *)youtubeID
                thumbnailSize:(YouTubeThumbnail)thumbnailSize
                completeBlock:(void(^)(HCImage *image, NSError *error))completeBlock;


/**
 Method for retreiving all the details of a youtube video
 
 @param youtubeURL the the complete youtube video url
 @param completeBlock the block which is called on completion
 
 */
+ (void)detailsForYouTubeURL:(NSURL *)youtubeURL
               completeBlock:(void(^)(NSDictionary *details, NSError *error))completeBlock;

@end
