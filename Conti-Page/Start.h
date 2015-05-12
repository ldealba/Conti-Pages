//
//  ViewController.h
//  Conti-Page
//
//  Created by Walter Gonzalez Domenzain on 12/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Start : UIViewController<UIPageViewControllerDataSource, UIPageViewControllerDelegate>

@property (strong, nonatomic) UIPageViewController *pageViewController;

//Buttons
@property (strong, nonatomic) IBOutlet UIButton *btnBack;
@property (strong, nonatomic) IBOutlet UIButton *btnForward;


//Actions
- (IBAction)btnBackPressed:(id)sender;
- (IBAction)btnForwardPressed:(id)sender;

@end

