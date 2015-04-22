//
//  AIIJSONCollection.h
//  AAClient
//
//  Created by iMac on 13-5-13.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import <Foundation/Foundation.h>

/** AIIJSONCollection.
 *
 *  集合对象模型基类.
 */
@interface AIIJSONCollection : NSObject <NSFastEnumeration, NSCopying, NSMutableCopying, NSCoding>
{
    @private
    NSMutableArray *_mutableArray;
}

/// 集合(Collection)的Entity对象.
@property (nonatomic, readonly) Class entityClass;

- (NSUInteger)count;
- (id)objectAtIndex:(NSUInteger)index;
- (void)addObject:(id)anObject;
- (void)addObjectsFromCollection:(AIIJSONCollection *)otherCollection;
- (void)insertObject:(id)anObject atIndex:(NSUInteger)index;
- (void)removeAllObjects;
- (void)removeObject:(id)anObject;
- (void)removeObjectAtIndex:(NSUInteger)index;
- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes;

- (BOOL)containsObject:(id)anObject;

- (NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate;

@end
