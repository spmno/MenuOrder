//
//  OrderManager.m
//  MenuOrder
//
//  Created by qingpeng-sun on 7/31/13.
//  Copyright (c) 2013 spmno. All rights reserved.
//

#import "OrderManager.h"
#import "PathDefine.h"

@implementation OrderManager
+ (OrderManager*) sharedInstance
{
    static OrderManager *sharedOrderManagerInstance = nil;

    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sharedOrderManagerInstance = [[OrderManager alloc] init];
    });
    return sharedOrderManagerInstance;
}

- (id) init
{
    self = [super init];
    _orderContainer = [[NSMutableArray alloc] init];
    receivedData = [[NSMutableData alloc] init];

    return self;
}

- (void) addDishToOrder:(Dish *)dish withCount:(NSInteger)count
{
    OrderItem *orderItem = [[OrderItem alloc] init];
    orderItem.dish = dish;
    orderItem.count = [NSNumber numberWithInt:count];
    //[_orderContainer setObject:dish.id forKey:orderItem];
    [_orderContainer addObject:orderItem];
}

- (void) deleteDishFromOrder:(int)dishId
{
    //[_orderContainer removeObjectForKey:dish.id];
    [_orderContainer removeObjectAtIndex:dishId];
}

- (void) setCurrentDish:(Dish *)dish
{
    currentDish = dish;
}

- (void) addCountToCurrentDish:(NSInteger)count
{
    OrderItem *orderItem = [[OrderItem alloc] init];
    orderItem.dish = currentDish;
    orderItem.count = [NSNumber numberWithInt:count];
    //[_orderContainer setObject:currentDish.id forKey:orderItem];
    [_orderContainer addObject:orderItem];
}

- (BOOL) sendOrderToServer
{
    NSMutableDictionary *orderContainer = [[NSMutableDictionary alloc] init];
    NSMutableArray *sendDataArray = [[NSMutableArray alloc] init];
    for (OrderItem *item in _orderContainer) {
        NSMutableDictionary *itemDictionary = [[NSMutableDictionary alloc] init];
        [itemDictionary setObject:item.dish.id forKey:@"dishid"];
        [itemDictionary setObject:item.count forKey:@"dishcount"];
        [sendDataArray addObject:itemDictionary];
    }
    [orderContainer setObject:sendDataArray forKey:@"order"];
    [orderContainer setObject:_tableNo forKey:@"tableno"];
    [orderContainer setObject:_memberNo forKey:@"memberno"];
    if ([NSJSONSerialization isValidJSONObject:orderContainer]) {
        NSError *error;
        NSData *jsonData = [NSJSONSerialization dataWithJSONObject:orderContainer options:NSJSONWritingPrettyPrinted error:&error];
        NSURL *url = [NSURL URLWithString:UPLOAD_ORDER_URL];
        NSMutableURLRequest *request = [[NSMutableURLRequest alloc] initWithURL:url];
        [request setHTTPMethod:@"POST"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
        [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
        [request setValue:[NSString stringWithFormat:@"%d", [jsonData length]] forHTTPHeaderField:@"Content-Length"];
        [request setHTTPBody:jsonData];
        NSURLConnection *connection = [NSURLConnection connectionWithRequest:request delegate:self];

    }
    return YES;
}

- (void)connection:(NSURLConnection *)connection didReceiveResponse:(NSURLResponse *)response {
    // store data
    [receivedData setLength:0];            //通常在这里先清空接受数据的缓存
    
}

- (void)connection:(NSURLConnection *)connection didReceiveData:(NSData *)data {
    
    [receivedData appendData:data];        //可能多次收到数据，把新的数据添加在现有数据最后
}

- (void)connection:(NSURLConnection *)connection didFailWithError:(NSError *)error {
    // 错误处理
}

- (void)connectionDidFinishLoading:(NSURLConnection *)connection {
    // disconnect
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    NSError *error;
    NSDictionary *versionJson = [NSJSONSerialization JSONObjectWithData:receivedData options:kNilOptions error:&error];
    if (versionJson == nil) {
        NSLog(@"json parser failed\r\r");
        return;
    }

}




@end
