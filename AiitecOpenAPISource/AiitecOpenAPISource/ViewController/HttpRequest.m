//
//  HttpRequest.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/11.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "HttpRequest.h"

#define BOUNDARY @"uploadBoundary"

@implementation HttpRequest

+ (id)upload:(NSString *)url widthParams:(NSDictionary *)params
{
    
    NSError *err = nil;
    NSMutableURLRequest *myRequest = [ [NSMutableURLRequest alloc] initWithURL: [NSURL URLWithString:url] cachePolicy:NSURLRequestReloadIgnoringLocalAndRemoteCacheData timeoutInterval:0];
    [myRequest setHTTPMethod:@"POST"];
    [myRequest setValue:[@"multipart/form-data; boundary=" stringByAppendingString:BOUNDARY] forHTTPHeaderField:@"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    NSLog(@"params:%@", params);
    for(NSString *key in params) {
        id content = [params objectForKey:key];
        if ([content isKindOfClass:[NSString class]] || [content isKindOfClass:[NSNumber class]]) {
            NSString *param = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: form-data; name=\"%@\"\r\n\r\n%@\r\n",BOUNDARY,key,content,nil];
            [body appendData:[param dataUsingEncoding:NSUTF8StringEncoding]];
            
        }
        else if([content isKindOfClass:[FileDetail class]]) {
            
            FileDetail *file = (FileDetail *)content;
            NSLog(@"%@", file.name);
            
//            NSString *param = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: form-data; name=\"%@\";filename=\"%@\"\r\nContent-Type: application/octet-stream\r\n\r\n", BOUNDARY, key, file.name, nil];
            NSString *param = [NSString stringWithFormat:@"--%@\r\nContent-Disposition: form-data; name=\"file[]\";filename=\"%@\"\r\nContent-Type: application/octet-stream\r\n\r\n", BOUNDARY, file.name, nil];
            [body appendData:[param dataUsingEncoding:NSUTF8StringEncoding]];
            [body appendData:file.data];
            [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
        }
    }
    NSString *endString = [NSString stringWithFormat:@"--%@--",BOUNDARY];
    [body appendData:[endString dataUsingEncoding:NSUTF8StringEncoding]];
    [myRequest setHTTPBody:body];
    
    NSData *returnData = [NSURLConnection sendSynchronousRequest:myRequest returningResponse:nil error:&err];
    
    NSString *responeString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];

//    id jsonObj = [NSJSONSerialization JSONObjectWithData:returnData options:noErr error:nil];
    
//    return jsonObj;
    return responeString;
}




@end


@implementation FileDetail

+(FileDetail *)fileWithName:(NSString *)name data:(NSData *)data
{
    FileDetail *file = [[self alloc] init];
    file.name = name;
    file.data = data;
    return file;
}

@end