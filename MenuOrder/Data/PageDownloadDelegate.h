//
//  PageDownloadDelegate.h
//  MenuOrder
//
//  Created by spmno on 13-7-9.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <Foundation/Foundation.h>

@protocol PageDownloadDelegate <NSObject>
- (void) downloadPageStep : (NSString*) itemName;
- (void) didFinishPageLoading;
@end
