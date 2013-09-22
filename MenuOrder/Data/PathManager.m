//
//  PathManager.m
//  MenuOrder
//
//  Created by spmno on 13-9-23.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "PathManager.h"

@implementation PathManager

+ (PathManager*) sharedInstance
{
    static PathManager *shareDataManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shareDataManagerInstance = [[self alloc] init];
        NSUserDefaults *userdefaults = [NSUserDefaults standardUserDefaults];

        shareDataManagerInstance.serverIPAddress = [userdefaults valueForKey:@"ip_addr"];
        if (shareDataManagerInstance.serverIPAddress == nil) {
            shareDataManagerInstance.serverIPAddress = @"127.0.0.1";
        }
        NSLog(@"IP=%@", shareDataManagerInstance.serverIPAddress);
        shareDataManagerInstance.appVersionUrl = [NSString stringWithFormat:@"http://%@:3000/pages/update_app.json", shareDataManagerInstance.serverIPAddress];
        shareDataManagerInstance.uploadImageDir = [NSString stringWithFormat:@"http://%@:3000", shareDataManagerInstance.serverIPAddress];
        shareDataManagerInstance.lastVersionUrl = [NSString stringWithFormat:@"http://%@:3000/page_versions/last_version.json", shareDataManagerInstance.serverIPAddress];
        shareDataManagerInstance.uploadOrderUrl = [NSString stringWithFormat:@"http://%@:3000/orders/submit.json", shareDataManagerInstance.serverIPAddress];
    });
    return shareDataManagerInstance;
}

- (NSString*) getAppVersionUrl
{
    return @"http://127.0.0.1:3000/pages/update_app.json";
    //#define APP_VERSION_URL @"http://192.168.1.116:3000/pages/update_app.json"
}

- (NSString*) getUploadImageDir
{
    return @"http://127.0.0.1:3000";
    //#define UPLOAD_IMAGE_DIR    @"http://192.168.1.116:3000"
}

- (NSString*) getLastVersionUrl
{
    return @"http://127.0.0.1:3000/page_versions/last_version.json";
    //#define LAST_VERSION_URL @"http://192.168.1.116:3000/page_versions/last_version.json";
}

- (NSString*) getUpLoadOrderUrl
{
    return @"http://127.0.0.1:3000/orders/submit.json";
    //#define UPLOAD_ORDER_URL @"http://192.168.1.116:3000/orders/submit.json"
}

@end
