//
//  DataManager.m
//  MenuOrder
//
//  Created by spmno on 13-7-3.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "DataManager.h"
#import "PersistentData.h"


@implementation DataManager
+ (DataManager*) sharedInstance
{
    static DataManager *shareDataManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shareDataManagerInstance = [[self alloc] init];
    });
    return shareDataManagerInstance;
}

- (id) init
{
    _versionWorker = [[VersionDownloadWorker alloc] init];
    _pageWorker = [[PageDownloadWorker alloc] init];
    _versionWorker.delegate = self;
    _pageWorker.delegate = self;
    return [super init];
}

- (NSString*) getAppVersion
{
    [_versionWorker startDownloadVersion];
    return @"";
}

- (void) didFinishVersion:(NSNumber *)version
{
    _versionNumber = version;
}

@end
