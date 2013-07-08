//
//  PageDownloadWorker.m
//  MenuOrder
//
//  Created by spmno on 13-7-7.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "PageDownloadWorker.h"

@implementation PageDownloadWorker
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
    NSDictionary *versionJson = [NSJSONSerialization JSONObjectWithData:receivedData options:kNilOptions error:&error];
    if (versionJson == nil) {
        NSLog(@"json parser failed\r\r");
        return;
    }
    NSNumber *versionOnServer = [versionJson objectForKey:@"id"];
    NSLog(@"server version is %d\r\n", [versionOnServer integerValue]);
    PersistentData *persistenData = [[PersistentData alloc] init];
    NSNumber *versionOnApp = [persistenData getVersion];
    if ([versionOnServer isEqualToNumber:versionOnApp]) {
        return;
    }
    
    //NSString *returnString = [[NSString alloc] initWithData:receivedData encoding:NSUTF8StringEncoding];
    //NSLog(returnString);
    //[self urlLoaded:[self urlString] data:self.receivedData];
    //firstTimeDownloaded = YES;
}

@end
