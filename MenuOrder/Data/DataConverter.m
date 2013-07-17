//
//  DataConverter.m
//  MenuOrder
//
//  Created by spmno on 13-7-17.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "DataConverter.h"
#import "DisplayItem.h"

@implementation DataConverter

- (BOOL) dictionaryToPage:(NSArray *)dictionary to:(NSMutableArray *)pages
{
    for (NSDictionary* pageDictionary in dictionary) {
        DisplayPage *displayPage = [[DisplayPage alloc] init];
        displayPage.imageUrl = [pageDictionary objectForKey:@"imageurl"];
        displayPage.kindId = [pageDictionary objectForKey:@"kindid"];
        NSArray *itemsContainer = [pageDictionary objectForKey:@"subitem"];
        
        for (NSDictionary *itemDictionary in itemsContainer) {
            DisplayItem *displayItem = [[DisplayItem alloc] init];
            displayItem.x = [itemDictionary objectForKey:@"x"];
            displayItem.y = [itemDictionary objectForKey:@"y"];
            displayItem.width = [itemDictionary objectForKey:@"width"];
            displayItem.height = [itemDictionary objectForKey:@"height"];
            displayItem.dishId = [itemDictionary objectForKey:@"dishid"];
            [displayPage.subItems addObject:displayItem];
        }
        [pages addObject:displayPage];
    }
    return YES;
}

- (BOOL) pageToDictionary:(NSArray *)pages to:(NSMutableArray *)dictionary
{
    for (DisplayPage * page in pages) {
        NSMutableDictionary *pageDictionary = [[NSMutableDictionary alloc] init];
        [pageDictionary setObject:page.imageUrl forKey:@"imageurl"];
        [pageDictionary setObject:page.kindId forKey:@"kindid"];
        NSMutableArray *itemArray = [[NSMutableArray alloc] init];
        for (DisplayItem *subitem in page.subItems) {
            NSMutableDictionary *itemDictionary = [[NSMutableDictionary alloc] init];
            [itemDictionary setObject:subitem.x forKey:@"x"];
            [itemDictionary setObject:subitem.y forKey:@"y"];
            [itemDictionary setObject:subitem.width forKey:@"width"];
            [itemDictionary setObject:subitem.height forKey:@"height"];
            [itemDictionary setObject:subitem.dishId forKey:@"dishid"];
            [itemArray addObject:itemDictionary];
        }
        [pageDictionary setObject:itemArray forKey:@"subitem"];
        [dictionary addObject:pageDictionary];
    }
    
    return YES;
}

- (BOOL) dictionaryToKind:(NSArray *)dictionary to:(NSMutableArray *)kinds
{
    for (NSDictionary *kindDictionary in dictionary) {
        DishKind *dishKind = [[DishKind alloc] init];
        dishKind.kindId = [kindDictionary objectForKey:@"id"];
        dishKind.kindName = [kindDictionary objectForKey:@"name"];
        dishKind.imageUrl = [kindDictionary objectForKey:@"imageurl"];
    }
    return YES;
}

- (BOOL) kindToDictionary:(NSArray *)kinds to:(NSMutableArray *)dictionary
{
    for (DishKind* kind in kinds) {
        NSMutableDictionary *kindDictionary = [[NSMutableDictionary alloc] init];
        [kindDictionary setObject:kind.kindId forKey:@"kindid"];
        [kindDictionary setObject:kind.imageUrl forKey:@"imageurl"];
        [kindDictionary setObject:kind.kindName forKey:@"kindname"];
        [dictionary addObject:kindDictionary];
    }
    return YES;
}

@end
