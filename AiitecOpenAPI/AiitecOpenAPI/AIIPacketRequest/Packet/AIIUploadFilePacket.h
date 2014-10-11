//
//  AIIUploadFilePacket.h
//  AAClient
//
//  Created by iMac on 13-6-28.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"
#import "AIIFileCollection.h"

@interface AIIUploadFileRequestQuery : AIIQuery

@property (nonatomic, strong) AIIFileCollection *fileCollection;//!< 图片(或文件)集合

@end



@interface AIIUploadFileResponseQuery : AIIUploadFileRequestQuery

@property (nonatomic, copy) NSString *imagePath;//!< 弃用
@property (nonatomic, copy) NSArray *ids;//!< ids数组,对[1,2,3]格式的字符串进行解包.

@end



@interface AIIUploadFileRequest : AIIRequest

@property (nonatomic, strong) AIIUploadFileRequestQuery *query;

@end



@interface AIIUploadFileResponse : AIIResponse

@property (nonatomic, strong) AIIUploadFileResponseQuery *query;

@end
