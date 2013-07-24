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
    _wholeKindContainer = [[NSMutableArray alloc] init];
    _wholePageContainer = [[NSMutableArray alloc] init];
    _wholeDishContainer = [[NSMutableDictionary alloc] init];
    versionWorker = [[VersionDownloadWorker alloc] init];
    updateWorker = [[UpdateJsonDownloadWorker alloc] init];
    dishKindWorker = [[DishKindDownloadWorker alloc] init];
    pageWorker = [[PageDownloadWorker alloc] init];
    versionWorker.delegate = self;
    updateWorker.delegate = self;
    dishKindWorker.delegate = self;
    pageWorker.delegate = self;
    return [super init];
}

- (void) getAppVersion
{
    [versionWorker startDownloadVersion];
}

- (void) getUpdateJsons
{
    [updateWorker startDownloadUpdateJson: _wholePageContainer: _wholeKindContainer : _wholeDishContainer];
}

- (void) getAppData
{
    [self getKindsData];
}

- (void) getKindsData
{
    [dishKindWorker startDownloadDishKind: _wholeKindContainer];
}

- (void) getPagesData
{
    [pageWorker startDownloadPages:_wholePageContainer];
}

- (void) didFinishVersion:(NSNumber *)version
{
    _versionNumber = version;
    [_delegate didFinishVersionLoading:version];
}

- (void) didFinishPageLoading
{
    
}

- (void) downloadPageStep:(NSString *)itemName
{
    [_delegate downloadAppInfoStep:itemName];
}

- (void) didFinishDownloadUpdateJson
{
    int appInfoCount = updateWorker.appInfoCount;
    [_delegate didFinishAppInfoLoading : appInfoCount];
    //[self getKindsData];
    //[self getPagesData];
}

- (void) didFinishDownloadKind
{
    [self getPagesData];
}

- (void) downloadKindStep:(NSString *)itemName
{
    [_delegate downloadAppInfoStep:itemName];
}

- (BOOL) initDataFromDisk
{
    PersistentData *persistentData = [[PersistentData alloc] init];
    if ([persistentData getKinds:_wholeKindContainer] == NO) {
        return NO;
    }
    return [persistentData getPages:_wholePageContainer];

}

@end
