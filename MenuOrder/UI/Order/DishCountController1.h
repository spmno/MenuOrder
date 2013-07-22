//
//  DishCountController1.h
//  MenuOrder
//
//  Created by spmno on 13-6-8.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DishCountController1 : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *countText;
- (IBAction)buttonOnePressed:(id)sender;

- (IBAction)buttonTwoPressed:(id)sender;
- (IBAction)buttonThreePressed:(id)sender;
- (IBAction)buttonFourPressed:(id)sender;
- (IBAction)buttonFivePressed:(id)sender;
- (IBAction)buttonSixPressed:(id)sender;
- (IBAction)buttonSevenPressed:(id)sender;
- (IBAction)buttonEightPressed:(id)sender;
- (IBAction)buttonNinePressed:(id)sender;
- (IBAction)deleteText:(id)sender;
- (IBAction)confirmDishCount:(id)sender;
- (IBAction)cancelDishCount:(id)sender;
@property (strong, nonatomic) IBOutlet UIButton *cancelDishCount;

@end
