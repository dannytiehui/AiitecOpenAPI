//
//  ImageListPacket.h
//  AAClient
//
//  Created by iMac on 13-5-21.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIListPacket.h"
#import "AIIImageCollection.h"

typedef NS_ENUM(NSUInteger, ListType){
    ListTypeDefault,
    ListTypeLatest,
    ListTypePopular,
    ListTypeMy,
    ListTypeMyFavorites
};

@interface ImageListRequest : AIIListRequest

@property (nonatomic, assign) ListType listType;

@end

@interface ImageListResponse : AIIListResponse

@property (nonatomic, assign) ListType listType;

@end



