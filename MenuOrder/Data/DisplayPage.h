//
//  DisplayPage.h
//  MenuOrder
//
//  Created by spmno on 13-7-8.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DisplayPage : NSObject
@property (strong, nonatomic) NSString *imageUrl;
@property (strong, nonatomic) NSMutableArray *subItems;
@property (strong, nonatomic) NSNumber *kindId;
@end
