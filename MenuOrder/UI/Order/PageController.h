//
//  PageController.h
//  MenuOrder
//
//  Created by spmno on 13-7-24.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "../../Data/DisplayPage.h"
@interface PageController : UIViewController
{
    DisplayPage *displayPage;
}
- (id)initWithPage : (DisplayPage*) page;
@end
