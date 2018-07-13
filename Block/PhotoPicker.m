//
//  PhotoPicker.m
//  Block
//
//  Created by xcode on 7/13/18.
//  Copyright © 2018 MSCline. All rights reserved.
//

#import "PhotoPicker.h"

@interface PhotoPicker() <UIImagePickerControllerDelegate, UINavigationControllerDelegate>

@property UIImagePickerController *picker;

// SAVE COMPLETION BLOCK FOR LATER USE
typedef void (^CompletionBlock)(UIImage *image);
@property (nonatomic, copy) CompletionBlock onDidPickImage;

@end

@implementation PhotoPicker

-(void)presentPhotoPickerViewControllerFromVC:(UIViewController *)vc completionBlock:(void(^)(UIImage *image))onDidPickImage {

    self.onDidPickImage = onDidPickImage;
    self.picker = [UIImagePickerController new];
    self.picker.delegate = self;
    self.picker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;

    [vc presentViewController:self.picker animated:YES completion:nil];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *) Picker {
    [Picker dismissViewControllerAnimated:YES completion:nil];
}

- (void)imagePickerController:(UIImagePickerController *) Picker didFinishPickingMediaWithInfo:(NSDictionary *)info {

    UIImage *rawImageFromPicker = [info objectForKey:UIImagePickerControllerOriginalImage];
    UIImage *editedImageFromPicker = [info objectForKey:UIImagePickerControllerEditedImage];
    UIImage *image = editedImageFromPicker != nil ? editedImageFromPicker : rawImageFromPicker;

    // RUN COMPLETION BLOCK
    self.onDidPickImage(image);
    [Picker dismissViewControllerAnimated:YES completion:nil];
}

+ (UIImage*)imageWithImage:(UIImage*)image scaledToSize:(CGSize)newSize {

    // Or better yet, use recursive resize on image.  (I thought this was somewhere in the sample code, but couldn't find it.)
    UIGraphicsBeginImageContext(newSize);
    [image drawInRect:CGRectMake(0,0,newSize.width,newSize.height)];
    UIImage* newImage = UIGraphicsGetImageFromCurrentImageContext();
    UIGraphicsEndImageContext();

    return newImage;
}
@end
