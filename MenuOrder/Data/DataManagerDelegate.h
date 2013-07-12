//
//  DataManagerDelegate.h
//  MenuOrder
//
//  Created by spmno on 13-7-9.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DataManagerDelegate <NSObject>
@optional
- (void) didFinishVersionLoading : (NSNumber*) version;
- (void) didFInishAppInfoLoading;
- (void) didFinishPageLoading;
- (void) downloadPageStep : (NSString*) itemName;
@end
