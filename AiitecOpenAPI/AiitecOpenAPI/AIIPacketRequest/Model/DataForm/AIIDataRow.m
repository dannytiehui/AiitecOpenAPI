//
//  AIITableRow.m
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "AIIDataRow.h"

@implementation AIIDataRow

- (Class)objectClass
{
    return [AIIDataItem class];
}

- (AIIDataItem *)objectForFieldName:(NSString *)aFieldName
{
	AIIDataItem *result = nil;
    for (AIIDataItem *item in self) {
        if ([item.name isEqualToString:aFieldName] ) {
			result = item;
			break;
		}
    }
	return result;
}

@end
