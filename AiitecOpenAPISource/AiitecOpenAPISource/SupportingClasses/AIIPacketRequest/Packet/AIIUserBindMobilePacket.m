//
//  AIIUserBindMobilePacket.m
//  AII
//
//  Created by iMac on 13-11-14.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIUserBindMobilePacket.h"

@implementation AIIUserBindMobileRequestQuery

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"password";
    if ([keys containsObject:k]) {
        [mutableDictionary setObject:[AIIUtility md5:self.password] forKey:k];
    }
    
    dict = mutableDictionary;
    return dict;
}

@end


@implementation AIIUserBindMobileRequest

//- (NSString *)packetNickname
//{
//    return @"绑定手机";
//}

@end


@implementation AIIUserBindMobileResponse
@end