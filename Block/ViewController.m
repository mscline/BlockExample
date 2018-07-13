//
//  ViewController.m
//  Block
//
//  Created by xcode on 7/12/18.
//  Copyright © 2018 MSCline. All rights reserved.
//


#import "ViewController.h"
#import "MyAlert.h"
#import "PhotoPicker.h"

@interface ViewController ()

@property PhotoPicker *photoPicker;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.photoPicker = [PhotoPicker new];
}

- (IBAction)onTap:(id)sender {

    __weak ViewController *weakSelf = self;

    [self.photoPicker presentPhotoPickerViewControllerFromVC:self completionBlock:^(UIImage *image) {

        [weakSelf onImagePicked:image];
    }];

}

- (void)onImagePicked:(UIImage *)image {

    // do something
}


// PRACTICE
- (void)presentAlert {

    MyAlert *myAlert = [MyAlert new];
    [myAlert  presentAlertWithTitle:@"Do something" parentViewController:self completionBlock:^(NSString *buttonClicked) {

        // completion block
        // (void)completionBlock:(NSString *)
        NSLog(@"run my code: %@", buttonClicked);
        [self doX];
    }];
}

- (void)doX {
    NSLog(@"reload table view");
}

@end
