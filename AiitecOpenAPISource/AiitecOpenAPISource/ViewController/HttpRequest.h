//
//  HttpRequest.h
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/11.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface HttpRequest : NSObject

+ (id)upload:(NSString *)url widthParams:(NSDictionary *)params;

@end


@interface FileDetail : NSObject

@property(strong,nonatomic) NSString *name;
@property(strong,nonatomic) NSData *data;
+(FileDetail *)fileWithName:(NSString *)name data:(NSData *)data;

@end
