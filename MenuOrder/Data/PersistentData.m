//
//  PersistentData.m
//  MenuOrder
//
//  Created by spmno on 13-7-5.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "PersistentData.h"

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
        
    if ([kindsContainer writeToFile:kindsFileName atomically:YES]) {
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
    
    if ([pagesContainer writeToFile:pagesFileName atomically:YES]) {
        return YES;
    } else {
        return NO;
    }
}

- (BOOL) getKinds:(NSArray *)kindsContainer
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //  数组索引0处Documentd目录，
    NSString *documentDirectory = [paths objectAtIndex:0];
    //    返回一个kFileName的完整路径
    NSString *kindsFileName =  [documentDirectory stringByAppendingPathComponent:@"kinds.plist"];

    if ([[NSFileManager defaultManager]fileExistsAtPath:kindsFileName]) {
        kindsContainer = [[NSArray alloc]initWithContentsOfFile:kindsFileName];
        return YES;
    } else {
        return NO;
    }
}

- (BOOL) getPages:(NSArray *)pagesContainer
{
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    //  数组索引0处Documentd目录，
    NSString *documentDirectory = [paths objectAtIndex:0];
    //    返回一个kFileName的完整路径
    NSString *pagesFileName =  [documentDirectory stringByAppendingPathComponent:@"pages.plist"];
    
    if ([[NSFileManager defaultManager]fileExistsAtPath:pagesFileName]) {
        pagesContainer = [[NSArray alloc]initWithContentsOfFile:pagesFileName];
        return YES;
    } else {
        return NO;
    }
}
@end
