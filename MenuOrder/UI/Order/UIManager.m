//
//  UIManager.m
//  MenuOrder
//
//  Created by spmno on 13-7-23.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "UIManager.h"

@implementation UIManager
+ (UIManager*) sharedInstance
{
    static UIManager *shareUIManagerInstance = nil;
    static dispatch_once_t predicate;
    dispatch_once(&predicate, ^{
        shareUIManagerInstance = [[self alloc] init];
    });
    return shareUIManagerInstance;
}
@end
