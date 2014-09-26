//
//  AIISMSCodePacket.m
//  AII
//
//  Created by iMac on 13-12-26.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIISMSCodePacket.h"

@implementation AIISMSCodeWhere
@end



@implementation AIISMSCodeRequestQuery

- (id)init
{
    if (self = [super init]) {
        _where = [[AIISMSCodeWhere alloc] init];
    }
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (void)setValue:(id)value forKey:(NSString *)key
{
    NSLog(@"AIISMSCodeRequestQuery.setValue:%@ forKey:%@", value, key);
    
    if ([key isEqualToString:self.where.key]) {
        [self.where setValuesForKeysWithDictionary:value];
    }
    else {
        [super setValue:value forKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"where";
    if ([dict objectForKey:k]) {
        [mutableDictionary setObject:[self.where dictionaryWithValuesForKeys:self.where.keys] forKey:@"w"];
    }
    [mutableDictionary removeObjectForKey:k];
    
    dict = mutableDictionary;
    
    return dict;
}

@end



@implementation AIISMSCodeRequest

- (Class)queryClass
{
    return [AIISMSCodeRequestQuery class];
}

//- (NSString *)packetNickname
//{
//    return @"短信验证码";
//}

@end


@implementation AIISMSCodeResponse
@end
