//
//  AIIUserResetPasswordPacket.m
//  AAClient
//
//  Created by iMac on 13-6-3.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIUserResetPasswordPacket.h"

@implementation AIIUserResetPasswordRequestQuery

#pragma mark - NSObject(NSKeyValueCoding)

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



@implementation AIIUserResetPasswordRequest

//- (NSString *)packetNickname
//{
//    return @"重置密码";
//}

@end



@implementation AIIUserResetPasswordResponse
@end

