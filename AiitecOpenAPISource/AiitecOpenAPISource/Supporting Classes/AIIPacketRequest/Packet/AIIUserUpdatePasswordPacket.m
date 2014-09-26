//
//  AIIUserUpdatePasswordPacket.m
//  AAClient
//
//  Created by iMac on 13-5-8.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIUserUpdatePasswordPacket.h"

@implementation AIIUserUpdatePasswordRequestQuery

#pragma mark - NSObject(NSKeyValueCoding)

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"password";
    if ([keys containsObject:k]) {
        [mutableDictionary setObject:[AIIUtility md5:self.password] forKey:k];
    }
    
    k = @"passwordNew";
    if ([keys containsObject:k]) {
        [mutableDictionary setObject:[AIIUtility md5:self.passwordNew] forKey:k];
    }
    
    dict = mutableDictionary;
    
    return dict;
}

@end



@implementation AIIUserUpdatePasswordRequest

//- (NSString *)packetNickname
//{
//    return @"更新密码";
//}

@end



@implementation AIIUserUpdatePasswordResponse
@end
