//
//  MyAlert.m
//  Block
//
//  Created by xcode on 7/12/18.
//  Copyright © 2018 MSCline. All rights reserved.
//

#import "MyAlert.h"

@implementation MyAlert

-(void)presentAlertWithTitle:(NSString *)title parentViewController: (UIViewController *)parentViewController completionBlock:(void(^)(NSString *string))completionBlock {

    UIAlertController *alertVC = [UIAlertController alertControllerWithTitle:title message:@"" preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *buttonOne = [UIAlertAction actionWithTitle:@"Ok" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {

        // RUN MY CODE
        completionBlock(@"ok");
    }];
    [alertVC addAction:buttonOne];

    [parentViewController presentViewController:alertVC animated:true completion:^{
        // do nothing
    }];
}

@end
