//
//  AIIResponse.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "AIIResponse.h"
#import "AIIPacketManager.h"

@interface AIIResponse ()

@property (nonatomic, copy) NSString *JSONString;
@property (nonatomic, copy) NSString *JSONFormatString;

@end



@implementation AIIResponse

- (id)initWithJSONString:(NSString *)jsonString
{
    NSError *error;
    NSDictionary *dict = [AIIUtility dictionaryWithJSONString:jsonString error:&error];
    
    if (self = [super init]) {
        if (![AIIPacketManager defaultManager].sessionResponseNotNil) {
            NSLog(@"sessionResponseNotNil = 0");
            self.query.status = SESSION_Nil_STATUS;
            self.query.desc = SESSION_Nil_DESC;
        }
        if (![ReachabilityUtility defaultManager].isReachable) {
            NSLog(@"[ReachabilityUtility defaultManager].isReachable: %d", [ReachabilityUtility defaultManager].isReachable);
            self.query.status = NotReachable_STATUS;
            self.query.desc = NotReachable_DESC;
        }
        else if (error) {
            NSLog(@"Error! initWithJSONString: %@", [error localizedDescription]);
            self.query.status = NotReachable_STATUS;
            self.query.desc = NotReachable_DESC;
        }
        else {
            [self setValuesForKeysWithDictionary:dict];
            
            self.JSONString = jsonString;
            self.JSONFormatString = [AIIUtility stringWithDictionary:dict];
        }
    }
    
    return self;
}

@end
