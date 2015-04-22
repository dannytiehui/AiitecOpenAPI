//
//  AIIDataTable.h
//  ObjectiveC
//
//  Created by Tiehui.Lu on 13-4-16.
//  Copyright (c) 2013年 aiitec. All rights reserved.
//

#import "AIIJSONModel.h"
#import "AIITableSchema.h"
#import "AIIDataRowCollection.h"

@interface AIIDataTable : AIIJSONModel

@property (nonatomic, strong) NSString *name;
@property (nonatomic, strong) NSString *displayName;
@property (nonatomic, strong) AIITableSchema *tableSchema;
@property (nonatomic, strong) AIIDataRowCollection *dataRowCollection;

@end
