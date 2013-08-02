//
//  PersistentData.m
//  MenuOrder
//
//  Created by spmno on 13-7-5.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "PersistentData.h"
#import "DataConverter.h"

@implementation PersistentData

- (NSNumber*) getVersion
{
    NSString *versionFilePath = [self dataFilePath];
    if ([[NSFileManager defaultManager]fileExistsAtPath:versionFilePath]) {
        NSMutableDictionary *fileData = [[NSMutableDictionary alloc] initWithContentsOfFile:versionFilePath];
        int version = [[fileData objectForKey:@"version"] integerValue];
        return [NSNumber numberWithInt:version];
    }
    return [NSNumber numberWithInt:0];
}

- (BOOL) saveVersion:(int)version
{
    NSString *versionFilePath = [self dataFilePath];
    NSMutableDictionary *versionDictionary = [[NSMutableDictionary alloc] init];
    NSNumber *versionNumber = [NSNumber numberWithInt:version];
    [versionDictionary setObject:versionNumber forKey:@"version"];
    if ([versionDictionary writeToFile:versionFilePath atomically:YES]) {
        return YES;
    } else {
        return NO;
    }
    
}

- (BOOL) saveImage:(NSString *)imageFileName withData:(NSData *)imageContent
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *imagePath = [documentDirectory stringByAppendingPathComponent:imageFileName];
    if ([imageContent writeToFile:imagePath atomically:YES] == NO) {
        return NO;
    }
    return YES;
}

-(NSString *)dataFilePath
{
    /*常量NSDocumentDirectory表明我们正在查找Documents目录路径，第二个常量NSUserDomainMask表示的是把搜索范围定在应用程序沙盒中，YES表示的是希望希望该函数能查看用户主目录*/
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //  数组索引0处Documentd目录，
    NSString *documentDirectory = [paths objectAtIndex:0];
    //    返回一个kFileName的完整路径
    return [documentDirectory stringByAppendingPathComponent:@"version.plist"];
}

- (BOOL) saveKinds:(NSArray *)kindsContainer
{
    
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //  数组索引0处Documentd目录，
    NSString *documentDirectory = [paths objectAtIndex:0];
    //    返回一个kFileName的完整路径
    NSString *kindsFileName =  [documentDirectory stringByAppendingPathComponent:@"kinds.plist"];
    
    DataConverter *converter = [[DataConverter alloc] init];
    NSMutableArray *dictionaryArray = [[NSMutableArray alloc] init];
    [converter kindToDictionary:kindsContainer to:dictionaryArray];
    
    if ([dictionaryArray writeToFile:kindsFileName atomically:YES]) {
        return YES;
    } else {
        return NO;
    }

}

- (BOOL) savePages:(NSArray *)pagesContainer
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //  数组索引0处Documentd目录，
    NSString *documentDirectory = [paths objectAtIndex:0];
    //    返回一个kFileName的完整路径
    NSString *pagesFileName =  [documentDirectory stringByAppendingPathComponent:@"pages.plist"];
    
    DataConverter *converter = [[DataConverter alloc] init];
    NSMutableArray *pagesArray = [[NSMutableArray alloc] init];
    [converter pageToDictionary:pagesContainer to:pagesArray];
    
    NSLog(@"pagesFileName = %@", pagesFileName);
    if ([pagesArray writeToFile:pagesFileName atomically:YES]) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL) saveDishes:(NSDictionary *)dishesContainer
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //  数组索引0处Documentd目录，
    NSString *documentDirectory = [paths objectAtIndex:0];
    //    返回一个kFileName的完整路径
    NSString *dishesFileName =  [documentDirectory stringByAppendingPathComponent:@"dishes.plist"];
    
    DataConverter *converter = [[DataConverter alloc] init];
    NSMutableArray *dishesArray = [[NSMutableArray alloc] init];
    [converter dishToDictionary:dishesContainer to:dishesArray];
    
    NSLog(@"dishesFileName = %@", dishesFileName);
    if ([dishesArray writeToFile:dishesFileName atomically:YES]) {
        return YES;
    } else {
        return NO;
    }

    return YES;
}

- (BOOL) getKinds:(NSMutableArray *)kindsContainer
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //  数组索引0处Documentd目录，
    NSString *documentDirectory = [paths objectAtIndex:0];
    //    返回一个kFileName的完整路径
    NSString *kindsFileName =  [documentDirectory stringByAppendingPathComponent:@"kinds.plist"];

    
    if ([[NSFileManager defaultManager]fileExistsAtPath:kindsFileName]) {
        NSArray *dictionaryArray = [[NSArray alloc]initWithContentsOfFile:kindsFileName];
        DataConverter *converter = [[DataConverter alloc] init];
        [converter dictionaryToKind:dictionaryArray to:kindsContainer];
        return YES;
    } else {
        return NO;
    }
}



- (BOOL) getPages:(NSMutableArray *)pagesContainer
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //  数组索引0处Documentd目录，
    NSString *documentDirectory = [paths objectAtIndex:0];
    //    返回一个kFileName的完整路径
    NSString *pagesFileName =  [documentDirectory stringByAppendingPathComponent:@"pages.plist"];
    
    if ([[NSFileManager defaultManager]fileExistsAtPath:pagesFileName]) {
        NSArray *dictionaryArray = [[NSArray alloc]initWithContentsOfFile:pagesFileName];
        DataConverter *converter = [[DataConverter alloc] init];
        [converter dictionaryToPage:dictionaryArray to:pagesContainer];
        return YES;
    } else {
        return NO;
    }
}

- (BOOL) getDishes:(NSMutableDictionary *)dishesContainer
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //  数组索引0处Documentd目录，
    NSString *documentDirectory = [paths objectAtIndex:0];
    //    返回一个kFileName的完整路径
    NSString *dishesFileName =  [documentDirectory stringByAppendingPathComponent:@"dishes.plist"];
    if ([[NSFileManager defaultManager]fileExistsAtPath:dishesFileName]) {
        NSArray *dictionaryArray = [[NSArray alloc]initWithContentsOfFile:dishesFileName];
        DataConverter *converter = [[DataConverter alloc] init];
        [converter dictionaryToDish:dictionaryArray to:dishesContainer];
        return YES;
    } else {
        return NO;
    }

}
@end
