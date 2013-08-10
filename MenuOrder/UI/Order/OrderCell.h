//
//  OrderCell.h
//  MenuOrder
//
//  Created by spmno on 13-8-11.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface OrderCell : UITableViewCell
@property (strong, nonatomic) IBOutlet UILabel *dishName;
@property (strong, nonatomic) IBOutlet UILabel *dishCount;

@property (strong, nonatomic) IBOutlet UILabel *dishPrice;
@end
