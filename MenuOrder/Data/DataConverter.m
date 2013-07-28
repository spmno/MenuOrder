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
        if (itemsContainer != nil) {
            displayPage.subItems = [[NSMutableArray alloc] init];
            for (NSDictionary *itemDictionary in itemsContainer) {
                DisplayItem *displayItem = [[DisplayItem alloc] init];
                displayItem.x = [itemDictionary objectForKey:@"x"];
                displayItem.y = [itemDictionary objectForKey:@"y"];
                displayItem.width = [itemDictionary objectForKey:@"width"];
                displayItem.height = [itemDictionary objectForKey:@"height"];
                displayItem.dishId = [itemDictionary objectForKey:@"dishid"];
                [displayPage.subItems addObject:displayItem];
            }
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
        dishKind.kindId = [kindDictionary objectForKey:@"kindid"];
        dishKind.kindName = [kindDictionary objectForKey:@"kindname"];
        dishKind.imageUrl = [kindDictionary objectForKey:@"imageurl"];
        [kinds addObject:dishKind];
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

- (BOOL)dictionaryToDish:(NSArray *)dictionary to:(NSMutableDictionary *)dishes
{
    for (NSDictionary *dishDictionary in dictionary) {
        Dish *dish = [[Dish alloc] init];
        dish.id = [dishDictionary objectForKey:@"id"];
        dish.name = [dishDictionary objectForKey:@"name"];
        dish.description = [dishDictionary objectForKey:@"description"];
        dish.price = [dishDictionary objectForKey:@"price"];
        [dishes setObject:dish forKey:dish.id];
    }
    return YES;
}

- (BOOL)dishToDictionary:(NSDictionary *)dishes to:(NSMutableArray *)dictionary
{
    for (Dish *dish in [dishes allValues]) {
        NSMutableDictionary *dishDictionary = [[NSMutableDictionary alloc] init];
        [dishDictionary setObject:dish.id forKey:@"id"];
        [dishDictionary setObject:dish.name forKey:@"name"];
        [dishDictionary setObject:dish.description forKey:@"description"];
        [dishDictionary setObject:dish.price forKey:@"price"];
        [dictionary addObject:dishDictionary];
    }
    return YES;
}
@end
