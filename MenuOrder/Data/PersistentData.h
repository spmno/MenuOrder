//
//  PersistentData.h
//  MenuOrder
//
//  Created by spmno on 13-7-5.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface PersistentData : NSObject
- (NSNumber*) getVersion;
- (BOOL) saveVersion: (int) version;
- (BOOL) saveImage: (NSString*) imageFileName withData:(NSData*)imageContent;
- (BOOL) saveKinds: (NSArray*) kindsContainer;
- (BOOL) savePages: (NSArray*) pagesContainer;
- (BOOL) getKinds: (NSArray*) kindsContainer;
- (BOOL) getPages: (NSArray*) pagesContainer;
@end
