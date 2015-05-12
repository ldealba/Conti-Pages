//
//  IntroPages.m
//  Conti-Page
//
//  Created by Walter Gonzalez Domenzain on 12/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "IntroPages.h"
#import "Declarations.h"

@interface IntroPages ()

@end

@implementation IntroPages

- (void)viewDidLoad {
    [super viewDidLoad];
    self.lblTeam.text   = aTeamNames[self.iPageIndex];
    self.imgTeam.image  = [UIImage imageNamed:aTeamImages[self.iPageIndex]];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
