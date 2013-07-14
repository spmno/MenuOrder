//
//  DishKindDownloadDelegate.h
//  MenuOrder
//
//  Created by spmno on 13-7-12.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol DishKindDownloadDelegate <NSObject>
- (void) didFinishDownloadKind;
- (void) downloadKindStep : (NSString*) itemName;
@end
