//
//  AIIDataRow.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "AIIDataCollection.h"
#import "AIIDataItem.h"

@interface AIIDataRow : AIIDataCollection

- (AIIDataItem *)objectForFieldName:(NSString *)aFieldName;

@end