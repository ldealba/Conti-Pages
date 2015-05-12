//
//  Camera.h
//  Conti-Page
//
//  Created by Walter Gonzalez Domenzain on 12/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <QuartzCore/QuartzCore.h>
#import <ImageIO/ImageIO.h>
#import <MobileCoreServices/MobileCoreServices.h>
#import "Declarations.h"

@interface Camera : UIViewController<UIPickerViewDelegate, UIAlertViewDelegate, UIActionSheetDelegate, UIImagePickerControllerDelegate, UINavigationControllerDelegate>
@property BOOL newMedia;

//Images
@property (strong, nonatomic) IBOutlet UIImageView *img;
//Actions
- (IBAction)btnBackIntroPressed:(id)sender;
- (IBAction)btnPhotosPressed:(id)sender;

@end
