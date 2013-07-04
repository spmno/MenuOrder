//
//  PersistentData.h
//  MenuOrder
//
//  Created by spmno on 13-7-5.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersistentData : NSObject
- (int) getVersion;
- (BOOL) saveVersion: (int) version;
@end
