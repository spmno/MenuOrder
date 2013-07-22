//
//  DishCountController.h
//  MenuOrder
//
//  Created by spmno on 13-6-1.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface DishCountController : UIViewController

@property (strong, nonatomic) IBOutlet UITextField *dishCountText;
- (IBAction)buttonOneTouch:(id)sender;
- (IBAction)buttonTwoTouch:(id)sender;
- (IBAction)buttonThreeTouch:(id)sender;
- (IBAction)buttonFourTouch:(id)sender;
- (IBAction)buttonFiveTouch:(id)sender;
- (IBAction)buttonSixTouch:(id)sender;
- (IBAction)buttonSevenTouch:(id)sender;
- (IBAction)buttonEightTouch:(id)sender;
- (IBAction)buttonNineTouch:(id)sender;
- (IBAction)buttonConfirmTouch:(id)sender;
- (IBAction)buttonCancelTouch:(id)sender;
@end
