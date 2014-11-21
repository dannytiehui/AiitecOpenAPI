//
//  HttpViewController.m
//  AiitecOpenAPISource
//
//  Created by iMac on 14/11/10.
//  Copyright (c) 2014年 Aiitec. All rights reserved.
//

#import "HttpViewController.h"
#import <CommonCrypto/CommonDigest.h>
#import <objc/runtime.h>

@interface HttpViewController ()
{
    NSMutableData *_receiveData;
    
    UIImageView *_imageView;
}

@end

@implementation HttpViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0.f, 0.f, 320.f, 320.f)];
    _imageView.image = [UIImage imageNamed:@"UploadImage"];
    [self.view addSubview:_imageView];
    
//    [self sendSynchronousRequest];
    [self sendAsynchronousRequest];
//    [self sendAsynchronousRequest];
    
//    [self testUploadImageRequest];
//    [self uploadImage];
    
    
    /// http://www.open-open.com/lib/view/open1388203067391.html
    
//    UIImage *image = [UIImage imageNamed:@"UploadImage"];
//    NSData *imageData = UIImageJPEGRepresentation(image, 0.8);
//    FileDetail *file = [FileDetail fileWithName:@"UploadImage3.png" data:imageData];
//    
//    UIImage *image2 = [UIImage imageNamed:@"yjsk.jpeg"];
//    NSData *imageData2 = UIImageJPEGRepresentation(image2, 0.8);
//    FileDetail *file2 = [FileDetail fileWithName:@"yjsk3.jpeg" data:imageData2];
//    
//    NSDictionary *params = [NSDictionary dictionaryWithObjectsAndKeys:file, @"file", file2, @"file2", @"upload", @"action", nil];
//    NSString *result = [HttpRequest upload:@"http://glkuaiying.aiitec.net/upload/upload.php" widthParams:params];

    
//    NSString *responeString = [self upload];
//    NSLog(@"responeString:%@", responeString);

    
//    NSLog(@"%@", [AIICheckVersion currentVersion]);
//    [AIICheckVersion checkVersion:self];
//    [AIICheckVersion checkItunesVersion:self];
    
//    Class aClass = [AIIUser class];
//    unsigned int outCount, i;
//    objc_property_t *properties = class_copyPropertyList(aClass, &outCount);//!< [aClass class];
//    for (i = 0; i < outCount; i++) {
//        objc_property_t property = properties[i];
//        NSString *key = [[NSString alloc] initWithCString:property_getName(property)  encoding:NSUTF8StringEncoding];
//        NSLog(@"property[%d] :%@ \n", i, key);
//        NSLog(@"%s", property_getAttributes(property));
//        NSString *s = [NSString stringWithCString:property_getAttributes(property) encoding:NSUTF8StringEncoding];
////        NSLog(@"%@", [s componentsSeparatedByString:@","]);
////        [prop addObject:key];
//    }
    
    
//    [self fileSynchronousRequest];
//    [self fileAsynchronousRequest];
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


#pragma mark - NSURLConnectionDelegate

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error
{
    NSLog(@"connection:didFailWithError");
}

#pragma mark - NSURLConnectionDataDelegate

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response
{
    NSLog(@"connection:didReceiveResponse");
    _receiveData = [[NSMutableData alloc] init];
    
//    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
//    if ([response respondsToSelector:@selector(allHeaderFields)]) {
//        NSDictionary *dictionary = [httpResponse allHeaderFields];
//        NSLog(@"allHeaderFields: %@",dictionary);
//    }
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data
{
    NSLog(@"connection:didReceiveData");
    [_receiveData appendData:data];
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection
{
    NSLog(@"connectionDidFinishLoading:connection");
    NSString *response = [[NSString alloc] initWithData:_receiveData encoding:NSUTF8StringEncoding];
    NSLog(@"response: %@", response);
}

#pragma mark - AIICheckVersionDelegate

- (void)checkVersionFinished:(AIICheckVersion *)checkVersion
{
    ;
}


#pragma mark - Private

- (void)testUserLoginRequest
{
    AIIUserLoginRequest *request = [[AIIUserLoginRequest alloc] init];
    request.query.action = AIIQueryActionFirst;
    request.query.name = @"13527262005";
    request.query.password = @"123456";
    
    NSString *jsonString = [request jsonStringWithObject];
    NSLog(@"jsonString:%@", jsonString);
    
//    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

- (void)testUploadImageRequest
{
    AIIUploadImageRequest *request = [[AIIUploadImageRequest alloc] init];
    
    AIIFileCollection *fileCollection = [[AIIFileCollection alloc] init];
    UIImage *image = [UIImage imageNamed:@"UploadImage"];
    AIIFile *file = [[AIIFile alloc] initWithData:UIImageJPEGRepresentation(image, 0.5) filename:@"UploadImage.jpg" contentType:@"image/jpg"];
    [fileCollection addObject:file];
    UIImage *image1 = [UIImage imageNamed:@"yjsk.jpeg"];
    AIIFile *file1 = [[AIIFile alloc] initWithData:UIImageJPEGRepresentation(image1, 1) filename:@"yjsk.jpeg" contentType:@"image/jpg"];
    [fileCollection addObject:file1];
    
    request.query.fileCollection = fileCollection;
    
    fileCollection.entityProperties = @[@"filename", @"contentType"];
    
    NSLog(@"%@", [fileCollection arrayWithObject]);
    NSLog(@"jsonString:%@", [request jsonStringWithObject]);
    
//    [AIIPacketConnection sendAsyn:request delegate:self context:self];
}

/** 发送同步请求. */
- (void)sendSynchronousRequest
{
    NSLog(@"sendSynchronousRequest");
    
    NSURL *URL = [NSURL URLWithString:@"http://192.168.1.12/kuaiying/public/api/index?"];
    
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
//    request.timeoutInterval = 30;
    request.HTTPMethod = @"POST";
    
    NSString *param = [NSString stringWithFormat:@"json={\"n\":\"UserLogin\",\"s\":\"6aue08ojjehalqsouk8upnyj2rw7z4jd\",\"q\":{\"username\":\"%@\",\"pwd\":\"%@\"}}", @"13527262005", @"e10adc3949ba59abbe56e057f20f883e"];
//    param = [param stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];//!< 转码.
    request.HTTPBody = [param dataUsingEncoding:NSUTF8StringEncoding];
    
    NSError *error = nil;
//    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&error];
//    
//    if (!data) {
//        NSLog(@"sendSynchronousRequest.Error: %@", [error description]);
//        return;
//    }

    NSURLResponse *response = nil;
    NSData *data = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    
    NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse*)response;
    if ([response respondsToSelector:@selector(allHeaderFields)]) {
        NSDictionary *dictionary = [httpResponse allHeaderFields];
        NSLog(@"allHeaderFields: %@",dictionary);
    }

    NSString *responseString = [[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding];
    NSLog(@"responseString: %@", responseString);
    
}

/** 发送异步请求. */
- (void)sendAsynchronousRequest
{
    NSURL *URL = [NSURL URLWithString:@"http://192.168.1.12/maowang/public/api/index?"];

    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:URL];
    request.timeoutInterval = 30;
    request.HTTPMethod = @"POST";

    
    AIIUserDetailsRequest *requestPacket = [[AIIUserDetailsRequest alloc] init];
//    [AIIPacketConnection sendAsyn:request delegate:self context:self];

    
//    NSString *param = [NSString stringWithFormat:@"json={\"n\":\"UserLogin\",\"s\":\"6aue08ojjehalqsouk8upnyj2rw7z4jd\",\"q\":{\"username\":\"%@\",\"pwd\":\"%@\"}}", @"13527262005", @"e10adc3949ba59abbe56e057f20f883e"];
    
//    NSString *param = [NSString stringWithFormat:@"json={\"n\":\"UserDetails\",\"cacheSupporting\":0,\"q\":{},\"s\":\"6aue08ojjehalqsouk8upnyj2rw7z4jd\"}"];

    NSString *param = [NSString stringWithFormat:@"json=%@", [requestPacket jsonStringWithObject]];
    NSLog(@"1.param:%@", param);
//    param = [param stringByReplacingOccurrencesOfString:@"\"" withString:@"\\\""];
//    NSLog(@"2.param:%@", param);
//    param = [param stringByAddingPercentEscapesUsingEncoding:NSUTF8StringEncoding];//!< 转码.
//    NSLog(@"3.param:%@", param);
    request.HTTPBody = [param dataUsingEncoding:NSUTF8StringEncoding];

     NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
    if (!connection) {
        NSLog(@"%@", @"创建失败");
        return;
    }

//    NSOperationQueue *queue = [[NSOperationQueue alloc] init];
//    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError){
//        
//        if (connectionError) {
//            NSLog(@"Error = %@", connectionError);
//        }
//        else {
//            NSString *responseString = [[NSString alloc]initWithData:data encoding:NSUTF8StringEncoding];
//            NSLog(@"responseString: %@", responseString);
//        }
//        
//    }];
}

#define BOUNDARY @"uploadBoundary2"

- (id)upload
{
    NSString *url = @"http://glkuaiying.aiitec.net/upload/upload.php";

    NSError *err = nil;
    NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:[NSURL URLWithString:url]];
    
    [request setHTTPMethod:@"POST"];
    [request setValue:[@"multipart/form-data; boundary=" stringByAppendingString:BOUNDARY] forHTTPHeaderField:@"Content-Type"];
    
    NSMutableData *body = [NSMutableData data];
    
    // {"n":"UploadImage","s":"6aue08ojjehalqsouk8upnyj2rw7z4jd","q":{}}
    NSString *value = @"{\"n\":\"UploadImage\",\"s\":\"6aue08ojjehalqsouk8upnyj2rw7z4jd\",\"q\":{}}";
    
    NSMutableString *param = [NSMutableString string];
    [param appendFormat:@"--%@\r\n", BOUNDARY];
    [param appendFormat:@"Content-Disposition: form-data; name=\"json\"\r\n\r\n%@\r\n", value];
    
    [body appendData:[param dataUsingEncoding:NSUTF8StringEncoding]];
    
    UIImage *image = [UIImage imageNamed:@"UploadImage"];
    NSData *imageData = UIImageJPEGRepresentation(image, 0.8);
    
    UIImage *image2 = [UIImage imageNamed:@"yjsk.jpeg"];
    NSData *imageData2 = UIImageJPEGRepresentation(image2, 0.8);
    
    for (NSUInteger i = 0; i < 2; i++) {
        NSData *data = i == 0 ? imageData : imageData2;

        NSMutableString *param = [NSMutableString string];
        [param appendFormat:@"--%@\r\n", BOUNDARY];
        [param appendFormat:@"Content-Disposition: form-data; name=\"file[]\"; filename=\"%ld%@\"\r\n", i, @"_1_upload.png"];
        [param appendFormat:@"Content-Type: application/octet-stream\r\n\r\n"];
        
        [body appendData:[param dataUsingEncoding:NSUTF8StringEncoding]];
        [body appendData:data];
        [body appendData:[@"\r\n" dataUsingEncoding:NSUTF8StringEncoding]];
    }

    NSString *endString = [NSString stringWithFormat:@"--%@--",BOUNDARY];
    [body appendData:[endString dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:body];
    
    /** 同步. */
    NSData *returnData = [NSURLConnection sendSynchronousRequest:request returningResponse:nil error:&err];
    
    NSString *responeString = [[NSString alloc] initWithData:returnData encoding:NSUTF8StringEncoding];
//    id jsonObj = [NSJSONSerialization JSONObjectWithData:returnData options:noErr error:nil];
    
    return responeString;
    
    /** 异步. */
//     NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self];
//    if (!connection) {
//        NSLog(@"%@", @"-创建失败");
//    }
//    
//    return @"";
    
}

#pragma mark - AIIFileConnectionDelegate

- (void)fileConnectionFinished:(AIIFileConnection *)connection
{
    UIImage *image = [UIImage imageWithData:connection.data];
    if (image) {
        _imageView.image = image;
    }
}

- (void)fileSynchronousRequest
{
//    NSString *path = @"http://photocdn.sohu.com/20120607/Img344962018.jpg";
    NSString *path = @"http://soso.com/soso/images/logo_index.png";
    NSData *data = [AIIFileConnection sendSynchronousRequest:path];
    NSLog(@"data:%lu", data.length);
    UIImage *image = [UIImage imageWithData:data];
    _imageView.image = image;
}

- (void)fileAsynchronousRequest
{
    NSString *path = @"http://photocdn.sohu.com/20120607/Img344962018.jpg";
//    NSString *path = @"http://soso.com/soso/images/logo_index.png";
    [AIIFileConnection sendAsynchronousRequest:path delegate:self context:@"_user.studentIdImagePath"];
}



//-----------------


/// http://blog.csdn.net/huang2009303513/article/details/36629297
- (void)uploadImage
{
    // {\"n\":\"UserUploadImage\",\"s\":\"6aue08ojjehalqsouk8upnyj2rw7z4jd\",\"q\":{\"id\":1}}
    
    NSURL *url = [NSURL URLWithString:@"http://192.168.1.12/kuaiying/public/api/index?"];
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:url];
    [request setHTTPMethod:@"POST"];
    
    /// 设置数据体
    NSString *boundary = @"uploadBoundary";//!< 设置boundary的字符串，可以复用
    
    //2>头部字符串
    NSMutableString *startStr = [NSMutableString string];
    [startStr appendFormat:@"--%@\n", boundary];
    [startStr appendString:@"Content-Disposition: form-data; name=\"file[]\"; filename=\"upload.png\"\n"];
    [startStr appendString:@"Content-Type: image/png\n\n"];
    
    //3>尾部字符串
    NSMutableString *endStr = [NSMutableString string];
    [endStr appendFormat:@"--%@\n", boundary];
    [endStr appendString:@"Content-Disposition: form-data: name=\"submit\"\n\n"];
    [endStr appendString:@"Submit\n"];
    [endStr appendFormat:@"--%@--", boundary];
    
    //4>拼接数据体
    NSMutableData *bodyData = [NSMutableData data];
    [bodyData appendData:[startStr dataUsingEncoding:NSUTF8StringEncoding]];
    UIImage *image = [UIImage imageNamed:@"UploadImage.png"];
    NSData *imageData = UIImagePNGRepresentation(image);
    [bodyData appendData:imageData];
    [bodyData appendData:[endStr dataUsingEncoding:NSUTF8StringEncoding]];
    [request setHTTPBody:bodyData];
    
    //5>指定Content-Type,在上传文件时，需要指定content-type和content-length
    NSString *contentStr = [NSString stringWithFormat:@"multipart/form-data; boundary=%@", boundary];
    [request setValue:contentStr forKey:@"Content-Type"];
    
    //6>指定Content-Length
    NSInteger length = [bodyData length];
    [request setValue:[NSString stringWithFormat:@"%ld", length] forKey:@"Content-Length"];

    //3使用NSURLConnection的同步方法上传文件，因为需要用户确认文件是否上传成功。
    //在使用http上传文件时，通常是有大小限制的。一般不会超过2M.
    NSURLResponse *response = nil;
    NSError *error = nil;
    NSData *resultData = [NSURLConnection sendSynchronousRequest:request returningResponse:&response error:&error];
    NSString *resultStr = [[NSString alloc]initWithData:resultData encoding:NSUTF8StringEncoding];
    NSLog(@"%@", resultStr);
}

@end


