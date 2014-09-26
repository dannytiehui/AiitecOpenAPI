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



@interface AIIUploadFileResponseQuery : AIIQuery

@property (nonatomic, copy) NSString *imagePath;

@end



@interface AIIUploadFileRequest : AIIRequest

@property (nonatomic, strong) AIIUploadFileRequestQuery *query;

@end



@interface AIIUploadFileResponse : AIIResponse

@property (nonatomic, strong) AIIUploadFileResponseQuery *query;

@end
