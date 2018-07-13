//
//  PhotoPicker.h
//  Block
//
//  Created by xcode on 7/13/18.
//  Copyright © 2018 MSCline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PhotoPicker : NSObject

-(void)presentPhotoPickerViewControllerFromVC:(UIViewController *)vc completionBlock:(void(^)(UIImage *image))onDidPickImage;

@end
