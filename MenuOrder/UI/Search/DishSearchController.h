//
//  DishSearchController.h
//  MenuOrder
//
//  Created by spmno on 13-6-4.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DishSearchController : UITableViewController<UISearchDisplayDelegate, UISearchBarDelegate, UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) NSMutableOrderedSet *data;
@property (strong, nonatomic) IBOutlet UISearchBar *searchBar;
@end
