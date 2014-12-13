//
//  AIIUploadFilesPacket.h
//  AAClient
//
//  Created by iMac on 13-6-28.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIRequest.h"
#import "AIIResponse.h"
#import "AIIFileCollection.h"

@interface AIIUploadFilesRequestQuery : AIIQuery

/** 图片(或文件)集合. */
@property (nonatomic, strong) AIIFileCollection *fileCollection;

@end


@interface AIIUploadFilesResponseQuery : AIIUploadFilesRequestQuery

@property (nonatomic, copy) NSString *imagePath;//!< 弃用
/** ids数组,对[1,2,3]格式的字符串进行解包. */
@property (nonatomic, copy) NSArray *ids;

@end


@interface AIIUploadFilesRequest : AIIRequest

@property (nonatomic, strong) AIIUploadFilesRequestQuery *query;

@end


@interface AIIUploadFilesResponse : AIIResponse

@property (nonatomic, strong) AIIUploadFilesResponseQuery *query;

@end
