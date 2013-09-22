//
//  DishKindDownloadWorker.m
//  MenuOrder
//
//  Created by spmno on 13-7-11.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "DishKindDownloadWorker.h"
#import "DishKind.h"
#import "PersistentData.h"
#import "PathManager.h"

@implementation DishKindDownloadWorker

- (id) init
{
    self = [super init];
    downloadContainer = [[NSMutableArray alloc] init];
    imagePathContainer = [[NSMutableArray alloc] init];

    return self;
}

- (void) startDownloadDishKind : kinds
{
    receivedData = [[NSMutableData alloc] init];
    for (DishKind* dishKind in kinds) {
        [imagePathContainer addObject:dishKind.imageUrl];
        NSString *imageDir = [PathManager sharedInstance].uploadImageDir;
        NSString *imageUrlPath = [NSString stringWithFormat:@"%@%@", imageDir, dishKind.imageUrl];
        NSLog(@"downloadurl = %@", imageUrlPath);
        NSRange range = [imageUrlPath rangeOfString:@"null"];
        if (range.location == NSNotFound) {
            NSURL *imageUrl = [NSURL URLWithString:imageUrlPath];
            NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: imageUrl];
            NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
            [downloadContainer addObject:connection];
        }
    }
    currentDownloadIndex = 0;
    NSURLConnection *connection = [downloadContainer objectAtIndex:0];
    [connection start];
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
    
    PersistentData *persistenData = [[PersistentData alloc] init];
    NSString *imageUrl = [imagePathContainer objectAtIndex:currentDownloadIndex];
    ++currentDownloadIndex;
    NSArray *imageUrlItems = [imageUrl componentsSeparatedByString:@"/"];
    NSString *imageName = [imageUrlItems lastObject];
    [persistenData saveImage:imageName withData:receivedData];
    if ((currentDownloadIndex) != downloadContainer.count) {
        [_delegate downloadKindStep:imageName];
        NSURLConnection *nextConnection = [downloadContainer objectAtIndex:currentDownloadIndex];
        [nextConnection start];
    } else {
        [_delegate downloadKindStep:imageName];
        [_delegate didFinishDownloadKind];
    }

    //NSNumber *versionOnApp = [persistenData getVersion];
    //[self.delegate didFinishVersion:versionOnServer];
    //if ([versionOnServer isEqualToNumber:versionOnApp]) {
    //    return;
    //}
    
    //NSString *returnString = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    //NSLog(returnString);
    //[self urlLoaded:[self urlString] data:self.receivedData];
    //firstTimeDownloaded = YES;
}



@end
