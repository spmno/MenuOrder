//
//  PageController.m
//  MenuOrder
//
//  Created by spmno on 13-7-24.
//  Copyright (c) 2013年 spmno. All rights reserved.
//

#import "PageController.h"
#import "../../Data/DisplayPage.h"
#import "../../Data/DisplayItem.h"
@interface PageController ()

@end

@implementation PageController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (id)initWithPage:(DisplayPage *)page
{
    displayPage = page;

    return [super init];
}
            
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    NSArray *imageUrlItems = [displayPage.imageUrl componentsSeparatedByString:@"/"];
    NSString *imageName = [imageUrlItems lastObject];
    NSArray *paths = NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, NSUserDomainMask, YES);
    NSString *documentDirectory = [paths objectAtIndex:0];
    NSString *imagePath = [documentDirectory stringByAppendingPathComponent:imageName];
    UIImage *backgroundImage = [UIImage imageWithContentsOfFile:imagePath];
    UIColor *backgroundColor = [UIColor colorWithPatternImage:backgroundImage];
    self.view.backgroundColor = backgroundColor;
    
    for (DisplayItem* item in displayPage.subItems) {
        
    }
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
