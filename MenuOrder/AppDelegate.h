//
//  AppDelegate.h
//  MenuOrder
//
//  Created by spmno on 13-5-25.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ViewController;
@class VersionCheckController;
@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (strong, nonatomic) VersionCheckController *viewController;

@end
