//
//  PageDownloadWorker.m
//  MenuOrder
//
//  Created by spmno on 13-7-11.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "PageDownloadWorker.h"
#import "DisplayPage.h"
#import "PathDefine.h"
#import "PersistentData.h"

@implementation PageDownloadWorker

- (id) init
{
    self =  [super init];
    downloadContainer = [[NSMutableArray alloc] init];
    imagePathContainer = [[NSMutableArray alloc] init];

    return self;
}

- (void) startDownloadPages:(NSMutableArray *)pages
{
    receivedData = [[NSMutableData alloc] init];
    for (DisplayPage* displayPage in pages) {
        [imagePathContainer addObject:displayPage.imageUrl];
        NSString *imageUrlPath = [NSString stringWithFormat:@"%@%@", UPLOAD_IMAGE_DIR, displayPage.imageUrl];
        NSLog(@"downloadurl = %@", imageUrlPath);
        NSURL *imageUrl = [NSURL URLWithString:imageUrlPath];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL: imageUrl];
        NSURLConnection *connection = [[NSURLConnection alloc] initWithRequest:request delegate:self startImmediately:NO];
        [downloadContainer addObject:connection];
    }
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
        [_delegate downloadPageStep:imageName];
        NSURLConnection *nextConnection = [downloadContainer objectAtIndex:currentDownloadIndex];
        [nextConnection start];
    } else {
        [_delegate downloadPageStep:imageName];
        [_delegate didFinishPageLoading];
    }
 }

@end
