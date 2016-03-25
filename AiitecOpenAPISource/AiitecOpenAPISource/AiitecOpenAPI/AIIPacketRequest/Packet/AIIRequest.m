//
//  AIIRequest.m
//  AAClient
//
//  Created by iMac on 13-5-13.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIPacketManager.h"

@interface AIIRequest ()
{
    NSString *_jsonStringWithObjectString;
}

@end


@implementation AIIRequest

- (id)init
{
    if (self = [super init]) {
        
    }
    return self;
}

- (id)initWithJSONString:(NSString *)jsonString
{
    self = [self init];
    
    NSDictionary *dict = [AIIUtility dictionaryWithJSONString:jsonString];
    [self setValuesForKeysWithDictionary:dict];
    
    return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    AIIRequest *request = [super copyWithZone:zone];
    request.timestampLatest = [_timestampLatest copy];
    request.md5 = [_md5 copy];
    request.cache = _cache;
    request.cacheSupporting = _cacheSupporting;
    return request;
}

#pragma mark - NSMutableCopying

- (id)mutableCopyWithZone:(NSZone *)zone
{
    AIIRequest *request = [super mutableCopyWithZone:zone];
    request.timestampLatest = [_timestampLatest mutableCopy];
    request.md5 = [_md5 mutableCopy];
    request.cache = _cache;
    request.cacheSupporting = _cacheSupporting;
    return request;

}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    [super encodeWithCoder:aCoder];
    [aCoder encodeObject:self.timestampLatest forKey:@"RequestTimestampLatest"];
    [aCoder encodeObject:self.md5 forKey:@"RequestMd5"];
    [aCoder encodeInteger:self.cache forKey:@"RequestCache"];
    [aCoder encodeInteger:self.cacheSupporting forKey:@"RequestCacheSupporting"];
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    self.timestampLatest = [aDecoder decodeObjectForKey:@"RequestTimestampLatest"];
    self.md5 = [aDecoder decodeObjectForKey:@"RequestMd5"];
    self.cache = [aDecoder decodeIntegerForKey:@"RequestCache"];
    self.cacheSupporting = [aDecoder decodeIntegerForKey:@"RequestCacheSupporting"];
    
    return self;
}

#pragma mark - NSObject(NSKeyValueCoding)

- (id)valueForUndefinedKey:(NSString *)key
{
    id value;
    if([key isEqualToString:@"t"]) {
        value = [self valueForKey:@"timestampLatest"];
    }
    else if([key isEqualToString:@"c"]) {
        value = [self valueForKey:@"cache"];
    }
    else {
        value = [super valueForUndefinedKey:key];
    }
    return value;
}

- (void)setValue:(id)value forUndefinedKey:(NSString *)key
{
    if ([key isEqualToString:@"t"]) {
        [self setValue:value forKey:@"timestampLatest"];
    }
    else if ([key isEqualToString:@"c"]) {
        [self setValue:value forKey:@"cache"];
    }
    else {
        [super setValue:value forUndefinedKey:key];
    }
}

- (NSDictionary *)dictionaryWithValuesForKeys:(NSArray *)keys
{
    NSDictionary *dict = [super dictionaryWithValuesForKeys:keys];
    
    NSMutableDictionary *mutableDictionary = [[NSMutableDictionary alloc] initWithDictionary:dict];
    NSString *k = @"timestampLatest";
    if (![[dict objectForKey:k] isKindOfClass:[NSNull class]]) {
        [mutableDictionary setObject:[dict objectForKey:k] forKey:@"t"];
    }
    [mutableDictionary removeObjectForKey:k];
    
    k = @"cache";
    if ([[dict objectForKey:k] integerValue]) {
        [mutableDictionary setObject:[dict objectForKey:k] forKey:@"c"];
    }
    [mutableDictionary removeObjectForKey:k];
    
    [mutableDictionary removeObjectForKey:@"cacheSupporting"];
    
    /** 默认移除md5属性. */
    [mutableDictionary removeObjectForKey:@"md5"];
    /** 默认移除jsonCacheReadWay属性. */
    [mutableDictionary removeObjectForKey:@"jsonCacheReadWay"];
    
    dict = mutableDictionary;
    return dict;
}

#pragma mark - ValueToDictionary

- (NSString *)jsonStringWithObject
{
    if (_jsonStringWithObjectString.length) {
        return _jsonStringWithObjectString;
    }
    
    if (IqPacket_Encryption) {
        NSString *k = @"m";
        
//        NSString *jsonString = [AIIUtility stringWithDictionary:[self dictionaryWithValuesForKeys:self.keys]];
        NSDictionary *dictionary = [self dictionaryWithValuesForKeys:self.keys];
        NSMutableDictionary *md = [NSMutableDictionary dictionaryWithDictionary:dictionary];
        [md setObject:@"" forKey:k];
        [md removeObjectForKey:k];
        
        NSString *jsonString = [AIIUtility stringWithDictionary:md];
//        NSLog(@"jsonString 1:%@", jsonString);
        
        /** jsonString 去除格式化. */
        jsonString = [AIIUtility stringWithDictionaryClearFormat:md];
//        NSLog(@"jsonString 2:%@", jsonString);
        _md5 = [AIIUtility md5:jsonString];
//        NSLog(@"1._md5:%@", _md5);
        _md5 = [_md5 stringByAppendingString:[AIIUtility iqPacketEncryption]];
//        NSLog(@"2._md5:%@", _md5);
        _md5 = [AIIUtility md5:_md5];
//        NSLog(@"3._md5:%@", _md5);
        
        NSMutableDictionary *mutableDictionary = [NSMutableDictionary dictionaryWithDictionary:md];
        [mutableDictionary setValue:_md5 forKey:k];
//        NSLog(@"4.%@", [AIIUtility stringWithDictionary:mutableDictionary]);
        
        _jsonStringWithObjectString = [AIIUtility stringWithDictionary:mutableDictionary];
    }
    else {
        _jsonStringWithObjectString = [AIIUtility stringWithDictionary:[self dictionaryWithValuesForKeys:self.keys]];
    }
    return _jsonStringWithObjectString;
}

#pragma mark - Private

- (void)jsonStringWithObjectStringSetNull
{
    _jsonStringWithObjectString = @"";
}


#pragma mark - self

//- (AIICacheSupporting)cacheSupporting
//{
//    return AIICacheSupportingNone;
//}

- (AIICacheWay)cacheWay
{
    return AIICacheWaySQLite;
}

- (AIIJSONCacheLevel)jsonCacheLevel
{
    return AIIJSONCacheLevelNone;
}

- (NSString *)packetNickname
{
    // 子类实现
    return @"";
}

//- (NSString *)md5
//{
//    return [self md5IncludeTimestampLatest:YES];
//}

- (NSString *)md5IncludeTimestampLatest:(BOOL)flag
{
    NSString *md5Str = @"";
    
//    NSString *jsonString = [AIIUtility stringWithDictionary:[self dictionaryWithValuesForKeys:self.keys]];
    NSDictionary *dictionary = [self dictionaryWithValuesForKeys:self.keys];
    NSMutableDictionary *md = [NSMutableDictionary dictionaryWithDictionary:dictionary];
    [md setObject:@"" forKey:@"m"];
    [md removeObjectForKey:@"m"];
    
    if (!flag) {
        [md setObject:@"" forKey:@"t"];
        [md removeObjectForKey:@"t"];
    }
    
    NSString *jsonString = [AIIUtility stringWithDictionary:md];
//    NSLog(@"jsonString 1:%@", jsonString);
    
    /** jsonString 去除格式化. */
    jsonString = [AIIUtility stringWithDictionaryClearFormat:md];
//    NSLog(@"jsonString 2:%@", jsonString);
    
    md5Str = [AIIUtility md5:jsonString];
//    NSLog(@"1._md5:%@", md5Str);
    
    if (IqPacket_Encryption) {
        md5Str = [md5Str stringByAppendingString:[AIIUtility iqPacketEncryption]];
//        NSLog(@"2._md5:%@", md5Str);
        
        md5Str = [AIIUtility md5:md5Str];
//        NSLog(@"3.md5Str:%@", md5Str);
    }
    
    return md5Str;
}

@end
