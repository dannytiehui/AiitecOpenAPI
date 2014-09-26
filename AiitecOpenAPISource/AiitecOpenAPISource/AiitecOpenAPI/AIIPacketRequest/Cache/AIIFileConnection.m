//
//  AIIFileConnection.m
//  AAClient
//
//  Created by iMac on 13-7-11.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIFileConnection.h"
#import "AIIFileCache.h"
#import "AIIPacketRequest.h"

@interface AIIFileConnection ()

@property (nonatomic, weak) id<AIIFileConnectionDelegate> delegate;
@property (nonatomic, copy) NSData *data;
@property (nonatomic, weak) id context;
@property (nonatomic, copy) NSString *path;

@end


@implementation AIIFileConnection

static NSMutableArray *_fileConnectionArray;

+ (BOOL)fileExistsAtPath:(NSString *)path
{
    return [AIIFileCache fileExistsAtPath:path];
}

+ (NSData *)sendSynchronousRequest:(NSString *)path
{
    NSData *data = [AIIFileCache dataWithContentsOfFile:path];
    if (!data && (BOOL)[AIIPacketRequest packetSetting:AIIPacketSettingViaWWAN]) {
        data = [AIIFileHttpConnection sendSynchronousRequest:path];
        [AIIFileCache createFileAtPath:path contents:data];
    }
    return data;
}

+ (void)sendAsynchronousRequest:(NSString *)path delegate:(id<AIIFileConnectionDelegate>)delegate context:(id)context
{
    AIIFileConnection *connection = [[AIIFileConnection alloc] init];
    connection.delegate = delegate;
    connection.context = context;
    connection.path = path;

    NSData *data = [AIIFileCache dataWithContentsOfFile:path];
    if (data || !((BOOL)[AIIPacketRequest packetSetting:AIIPacketSettingViaWWAN])) {
        connection.data = data;
        
        double delayInSeconds = 0.1;
        dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, (int64_t)(delayInSeconds * NSEC_PER_SEC));
        dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
            [delegate fileConnectionFinished:connection];
        });
    }
    else {
        if (!_fileConnectionArray) {
            _fileConnectionArray = [[NSMutableArray alloc] init];
        }
        [_fileConnectionArray addObject:connection];
        
        [AIIFileHttpConnection sendAsynchronousRequest:path delegate:connection context:context];
    }
}

- (void)fileRequestFinished:(AIIFileHttpConnection *)connection
{
    self.data = connection.data;
    if (connection.data && connection.data.length) {
        [AIIFileCache createFileAtPath:self.path contents:self.data];
    }
    [self.delegate fileConnectionFinished:self];
    [_fileConnectionArray removeObject:self];
}

+ (BOOL)removeCache
{
    return [AIIFileCache removeItemAtPath:@""];
}

+ (unsigned long long)folderSize
{
    return [AIIFileCache folderSizeAtPath:@""];
}

@end
