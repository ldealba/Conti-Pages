//
//  Camera.m
//  Conti-Page
//
//  Created by Walter Gonzalez Domenzain on 12/05/15.
//  Copyright (c) 2015 Smartplace. All rights reserved.
//

#import "Camera.h"
#import "Start.h"

@interface Camera ()

@end

@implementation Camera
/**********************************************************************************************/
#pragma mark - Initialization
/**********************************************************************************************/
- (void)viewDidLoad
{
    [super viewDidLoad];
    NSLog(@"viewDidLoad Camera");
    // Do any additional setup after loading the view.
}
//-------------------------------------------------------------------------------
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
/**********************************************************************************************/
#pragma mark - Buttons functions
/**********************************************************************************************/
- (IBAction)btnBackIntroPressed:(id)sender
{
    self.view = (UIView *)[self.view viewWithTag:1];
    
    [self dismissViewControllerAnimated:YES completion:nil];
    /*Start*viewController = [[UIStoryboard storyboardWithName:@"Main" bundle:nil] instantiateViewControllerWithIdentifier:@"Start"];
    [self presentViewController:viewController animated:YES completion:nil];*/
}
//-------------------------------------------------------------------------------
- (IBAction)btnPhotosPressed:(id)sender
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc]
                                  initWithTitle:nil
                                  delegate:self
                                  cancelButtonTitle:[NSString stringWithFormat:@"Cancelar"]
                                  destructiveButtonTitle:nil
                                  otherButtonTitles:
                                  [NSString stringWithFormat:@"Tomar foto"],
                                  [NSString stringWithFormat:@"Seleccionar de carrete"],
                                  [NSString stringWithFormat:@"Usar Default"], nil];
    [actionSheet showInView:self.view];
}
/**********************************************************************************************/
#pragma mark Alert views
/**********************************************************************************************/
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{
    //Get the name of the current pressed button
    NSString *buttonTitle = [actionSheet buttonTitleAtIndex:buttonIndex];
    
    if([buttonTitle isEqualToString:[NSString stringWithFormat:@"Tomar foto"]])
    {
        if ([UIImagePickerController isSourceTypeAvailable:
             UIImagePickerControllerSourceTypeCamera])
        {
            UIImagePickerController *imagePicker    = [[UIImagePickerController alloc] init];
            imagePicker.delegate                    = self;
            imagePicker.sourceType                  = UIImagePickerControllerSourceTypeCamera;
            imagePicker.mediaTypes                  = @[(NSString *) kUTTypeImage];
            imagePicker.allowsEditing               = YES;
            [self presentViewController:imagePicker animated:YES completion:nil];
            self.newMedia = YES;
        }
    }
    else if([buttonTitle isEqualToString:[NSString stringWithFormat:@"Seleccionar de carrete"]])
    {
        if ([UIImagePickerController isSourceTypeAvailable:
             UIImagePickerControllerSourceTypeSavedPhotosAlbum])
        {
            UIImagePickerController *imagePicker    = [[UIImagePickerController alloc] init];
            imagePicker.delegate                    = self;
            imagePicker.sourceType                  = UIImagePickerControllerSourceTypePhotoLibrary;
            imagePicker.mediaTypes                  = @[(NSString *) kUTTypeImage];
            imagePicker.allowsEditing               = YES;
            [self presentViewController:imagePicker animated:YES completion:nil];
            self.newMedia = NO;
        }
    }
    else if([buttonTitle isEqualToString:[NSString stringWithFormat:@"Usar Default"]])
    {
        self.img.image  = [UIImage imageNamed:@"Chivas.png"];
        //[self dismissViewControllerAnimated:YES completion:nil];
    }
}
/**********************************************************************************************/
#pragma mark UIImagePickerControllerDelegate
/**********************************************************************************************/

-(void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary *)info
{
    NSString *mediaType = info[UIImagePickerControllerMediaType];
    [self dismissViewControllerAnimated:YES completion:nil];
    
    if ([mediaType isEqualToString:(NSString *)kUTTypeImage])
    {
        UIImage *image      = info[UIImagePickerControllerOriginalImage];
        [[UIApplication sharedApplication] setStatusBarHidden:NO withAnimation:UIStatusBarAnimationSlide];
        [[UIApplication sharedApplication] setStatusBarStyle:UIStatusBarStyleLightContent];
        self.img.image      = image;
    }
    else if ([mediaType isEqualToString:(NSString *)kUTTypeMovie])
    {
        // Code here to support video if enabled
    }
}
//-------------------------------------------------------------------------------
-(void)image:(UIImage *)image finishedSavingWithError:(NSError *)error contextInfo:(void *)contextInfo
{
    if (error) {
        UIAlertView *alert = [[UIAlertView alloc]
                              initWithTitle: [NSString stringWithFormat:@"Error"]
                              message: [NSString stringWithFormat:@"Error Foto"]
                              delegate: nil
                              cancelButtonTitle:[NSString stringWithFormat:@"OK"]
                              otherButtonTitles:nil];
        [alert show];
    }
}
//-------------------------------------------------------------------------------
-(void)imagePickerControllerDidCancel:(UIImagePickerController *)picker
{
    [self dismissViewControllerAnimated:YES completion:nil];
}
@end
