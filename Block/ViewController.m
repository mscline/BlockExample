//
//  ViewController.m
//  Block
//
//  Created by xcode on 7/12/18.
//  Copyright © 2018 MSCline. All rights reserved.
//

#import "ViewController.h"
#import "MyAlert.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)onTap:(id)sender {

    MyAlert *myAlert = [MyAlert new];
    [myAlert  presentAlertWithTitle:@"Do something" parentViewController:self completionBlock:^(NSString *buttonClicked) {

        // completion block
        // (void)completionBlock:(NSString *)
        NSLog(@"run my code: %@", buttonClicked);
        [self doX];
    }];
}

-(void)doX {
    NSLog(@"reload table view");
}




@end
