//
//  MyAlert.h
//  Block
//
//  Created by xcode on 7/12/18.
//  Copyright © 2018 MSCline. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyAlert : NSObject

-(void)presentAlertWithTitle:(NSString *)title parentViewController: (UIViewController *)parentViewController completionBlock:(void(^)(NSString *string))completionBlock;

@end
