//
//  PathManager.h
//  MenuOrder
//
//  Created by spmno on 13-9-23.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PathManager : NSObject
{

}
+ (PathManager*) sharedInstance;

@property (strong, nonatomic) NSString *serverIPAddress;
@property (strong, nonatomic) NSString *appVersionUrl;
@property (strong, nonatomic) NSString *uploadImageDir;
@property (strong, nonatomic) NSString *lastVersionUrl;
@property (strong, nonatomic) NSString *uploadOrderUrl;
@end
