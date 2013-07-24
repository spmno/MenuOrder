//
//  DataConverter.h
//  MenuOrder
//
//  Created by spmno on 13-7-17.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DisplayPage.h"
#import "DishKind.h"
#import "Dish.h"

@interface DataConverter : NSObject
- (BOOL) dictionaryToPage : (NSArray*) dictionary to: (NSMutableArray*) pages;
- (BOOL) pageToDictionary : (NSArray*) pages to: (NSMutableArray*) dictionary;
- (BOOL) dictionaryToKind : (NSArray*) dictionary to : (NSMutableArray*) kinds;
- (BOOL) kindToDictionary : (NSArray*) kinds to: (NSMutableArray*) dictionary;
- (BOOL) dictionaryToDish : (NSArray*) dictionary to : (NSMutableDictionary*) dishes;
- (BOOL) dishToDictionary : (NSDictionary*) dishes to : (NSMutableArray*) dictionary;
@end
