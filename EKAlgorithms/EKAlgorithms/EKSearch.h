//
//  EKSearch.h
//  EKAlgorithms
//
//  Created by Каркан Евгений on 11.08.13.
//  Copyright (c) 2013 EvgenyKarkan. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface EKSearch : NSObject

+ (NSInteger)linearSearchForObject:(id)object inArray:(NSArray *)arrayToSearch;
+ (NSInteger)binarySearchForObject:(id)object inSortedArray:(NSArray *)sortedArray;

@end