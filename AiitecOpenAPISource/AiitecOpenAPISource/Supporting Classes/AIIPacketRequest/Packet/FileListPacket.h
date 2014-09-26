//
//  FileListPacket.h
//  AAClient
//
//  Created by iMac on 13-7-22.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "ImageListPacket.h"
#import "AIIFileCollection.h"

@interface FileListRequest : AIIListRequest

@property (nonatomic, assign) ListType listType;

@end


@interface FileListResponse : AIIListResponse
@end

