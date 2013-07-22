//
//  UIManager.h
//  MenuOrder
//
//  Created by spmno on 13-7-23.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface UIManager : NSObject
+ (UIManager*) sharedInstance;
@property (strong, nonatomic) NSNumber *currentKindId;
@end
