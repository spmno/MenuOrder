//
//  PageDownloadWorker.m
//  MenuOrder
//
//  Created by spmno on 13-7-7.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "UpdateJsonDownloadWorker.h"
#import "DishKind.h"
#import "DisplayPage.h"
#import "DisplayItem.h"
#import "PathDefine.h"

@implementation UpdateJsonDownloadWorker

- (BOOL) startDownloadUpdateJson:(NSMutableArray *)pageContainer :(NSMutableArray *)kindContainer
{
    NSString *appVersionUrl = APP_VERSION_URL;
    //NSString *appVersionUrl = @"http://192.168.59.1:3000/page_versions/last_version.json";
    receivedData = [[NSMutableData alloc] init];
    _pageArray = pageContainer;
    _kindArray = kindContainer;
    _appInfoCount = 0;
    NSMutableURLRequest *request = [NSMutableURLRequest requestWithURL:[NSURL URLWithString:appVersionUrl]];
    [NSURLConnection connectionWithRequest:request delegate:self];
    return YES;
}


- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // store data
    [receivedData setLength:0];            //通常在这里先清空接受数据的缓存
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    [receivedData appendData:data];        //可能多次收到数据，把新的数据添加在现有数据最后
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // 错误处理
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // disconnect
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    NSError *error;
    NSDictionary *updateJson = [NSJSONSerialization JSONObjectWithData:receivedData options:kNilOptions error:&error];
    if (updateJson == nil) {
        NSLog(@"json parser failed\r\r");
        return;
    }
    NSDictionary *dishKinds = [updateJson objectForKey:@"kinds"];
    NSDictionary *dishPages = [updateJson objectForKey:@"pages"];
    
    for (NSDictionary *page in dishPages) {
        DisplayPage *displayPage = [[DisplayPage alloc] init];
        NSDictionary *photoDictionary = [page objectForKey:@"photo"];
        NSDictionary *urlDictionary = [photoDictionary objectForKey:@"photo"];
        displayPage.imageUrl = [urlDictionary objectForKey:@"url"];
        NSLog(@"page image url = %@", displayPage.imageUrl);
        ++_appInfoCount;
        NSDictionary *itemsDictionary = [page objectForKey:@"display_items"];
        for (NSDictionary *item in itemsDictionary) {
            DisplayItem *displayItem = [[DisplayItem alloc] init];
            NSDictionary *itemDictionary = [item objectForKey:@"display_item"];
            displayItem.x = [itemDictionary objectForKey:@"x"];
            displayItem.y = [itemDictionary objectForKey:@"y"];
            displayItem.width = [itemDictionary objectForKey:@"width"];
            displayItem.height = [itemDictionary objectForKey:@"height"];
            displayItem.dishId = [itemDictionary objectForKey:@"dish_id"];
            [displayPage.subItems addObject:displayItem];
        }
        [_pageArray addObject:displayPage];
        
    }
    
    for (NSDictionary *kind in dishKinds) {
        DishKind *dishKind = [[DishKind alloc] init];
        NSDictionary *photoDictionary = [kind objectForKey:@"photo"];
        NSDictionary *urlDictionary = [photoDictionary objectForKey:@"photo"];
        dishKind.imageUrl = [urlDictionary objectForKey:@"url"];
        ++_appInfoCount;
        [_kindArray addObject:dishKind];
    }
    
    [_delegate didFinishDownloadUpdateJson];
    //NSLog(@"server version is %d\r\n", [versionOnServer integerValue]);
//    PersistentData *persistenData = [[PersistentData alloc] init];
//   NSNumber *versionOnApp = [persistenData getVersion];
//    if ([versionOnServer isEqualToNumber:versionOnApp]) {
//        return;
//    }
    
    //NSString *returnString = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    //NSLog(returnString);
    //[self urlLoaded:[self urlString] data:self.receivedData];
    //firstTimeDownloaded = YES;
}

@end
