//
//  AIIDataCollection.h
//  AAClient
//
//  Created by iMac on 13-5-15.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIJSONCollection.h"
#import "AIIJSONValueConvert.h"

/** AIIDataCollection.
 *
 *  DataForm集合对象模型基类.
 */
@interface AIIDataCollection : AIIJSONCollection <ValueToArray, ValueFromArray>

@end
