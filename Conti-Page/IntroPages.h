//
//  IntroPages.h
//  Conti-Page
//
//  Created by Walter Gonzalez Domenzain on 12/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface IntroPages : UIViewController

@property NSUInteger    iPageIndex;
@property (strong, nonatomic) IBOutlet UILabel *lblTeam;
@property (strong, nonatomic) IBOutlet UIImageView *imgTeam;

@end
