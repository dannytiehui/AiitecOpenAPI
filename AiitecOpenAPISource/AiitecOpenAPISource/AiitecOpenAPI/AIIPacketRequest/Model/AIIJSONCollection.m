//
//  AIIJSONCollection.m
//  AAClient
//
//  Created by iMac on 13-5-13.
//  Copyright (c) 2013年 Aiitec. All rights reserved.
//

#import "AIIJSONCollection.h"

@implementation AIIJSONCollection

- (id)init
{
	if(self = [super init]){
		_mutableArray = [[NSMutableArray alloc] init];
        
        NSString *className = NSStringFromClass(self.class);
        className = [className stringByReplacingOccurrencesOfString:@"Collection" withString:@""];
        _entityClass = NSClassFromString(className);
	}
	return self;
}

#pragma mark - NSCopying

- (id)copyWithZone:(NSZone *)zone
{
    return [[self class] allocWithZone:zone];
}

#pragma mark - NSMutableCopying

- (id)mutableCopyWithZone:(NSZone *)zone
{
    return [[self class] mutableCopy];
}

#pragma mark - NSCoding

- (void)encodeWithCoder:(NSCoder *)aCoder
{
    /// 子类实现
}

- (id)initWithCoder:(NSCoder *)aDecoder
{
    /// 子类实现
    return self;
}

#pragma mark - Public Method

- (NSUInteger)count
{
    return _mutableArray.count;
}

- (id)objectAtIndex:(NSUInteger)index
{
    return _mutableArray[index];
}

- (void)addObject:(id)anObject
{
    if (![anObject isKindOfClass:self.entityClass]) {
		return;
	}
	[_mutableArray addObject:anObject];
}

- (void)addObjectsFromCollection:(AIIJSONCollection *)otherCollection
{
    for (id anObject in otherCollection) {
        [self addObject:anObject];
    }
}

- (void)insertObject:(id)anObject atIndex:(NSUInteger)index
{
    if (![anObject isKindOfClass:self.entityClass]) {
		return;
	}
    [_mutableArray insertObject:anObject atIndex:index];
}

- (void)removeAllObjects
{
    [_mutableArray removeAllObjects];
}

- (void)removeObject:(id)anObject
{
    [_mutableArray removeObject:anObject];
}

- (void)removeObjectAtIndex:(NSUInteger)index
{
    [_mutableArray removeObjectAtIndex:index];
}

- (void)removeObjectsAtIndexes:(NSIndexSet *)indexes
{
    [_mutableArray removeObjectsAtIndexes:indexes];
}

- (BOOL)containsObject:(id)anObject
{
    return [_mutableArray containsObject:anObject];
}

- (NSArray *)filteredArrayUsingPredicate:(NSPredicate *)predicate
{
    return [_mutableArray filteredArrayUsingPredicate:predicate];
}

#pragma mark - NSFastEnumeration

// This is where all the magic happens.
// You have two choices when implementing this method:
// 1) Use the stack based array provided by stackbuf. If you do this, then you must respect the value of 'len'.
// 2) Return your own array of objects. If you do this, return the full length of the array returned until you run out of objects, then return 0. For example, a linked-array implementation may return each array in order until you iterate through all arrays.
// In either case, state->itemsPtr MUST be a valid array (non-nil). This sample takes approach #1, using stackbuf to store results.
- (NSUInteger)countByEnumeratingWithState:(NSFastEnumerationState *)state objects:(id __unsafe_unretained [])buffer count:(NSUInteger)len
{
	NSUInteger count = 0;
	// This is the initialization condition, so we'll do one-time setup here.
	// Ensure that you never set state->state back to 0, or use another method to detect initialization
	// (such as using one of the values of state->extra).
	if(state->state == 0)
	{
		// We are not tracking mutations, so we'll set state->mutationsPtr to point into one of our extra values,
		// since these values are not otherwise used by the protocol.
		// If your class was mutable, you may choose to use an internal variable that is updated when the class is mutated.
		// state->mutationsPtr MUST NOT be NULL.
		state->mutationsPtr = &state->extra[0];
	}
	// Now we provide items, which we track with state->state, and determine if we have finished iterating.
	if(state->state < _mutableArray.count)
	{
		// Set state->itemsPtr to the provided buffer.
		// Alternate implementations may set state->itemsPtr to an internal C array of objects.
		// state->itemsPtr MUST NOT be NULL.
		state->itemsPtr = buffer;
		// Fill in the stack array, either until we've provided all items from the list
		// or until we've provided as many items as the stack based buffer will hold.
		while((state->state < _mutableArray.count) && (count < len))
		{
			// For this sample, we generate the contents on the fly.
			// A real implementation would likely just be copying objects from internal storage.
            buffer[count] =  _mutableArray[state->state];
			state->state++;
			count++;
		}
	}
	else
	{
		// We've already provided all our items, so we signal we are done by returning 0.
		count = 0;
	}
	return count;
}

@end
