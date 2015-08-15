//
//  ViewController.m
//  namelessApp
//
//  Created by Patrick Ye on 2015-07-05.
//  Copyright (c) 2015 FerriWhale. All rights reserved.
//

#import "ViewController.h"
#import <FBSDKCoreKit/FBSDKCoreKit.h>
#import <FBSDKLoginKit/FBSDKLoginKit.h>
#import "HomeViewController.h"

@interface ViewController () <FBSDKLoginButtonDelegate>


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    FBSDKLoginButton *loginButton = [[FBSDKLoginButton alloc] init];
    loginButton.delegate = self;
    loginButton.readPermissions = @[@"public_profile", @"email", @"user_friends"];
    // Optional: Place the button in the center of your view.
    loginButton.center = self.view.center;
    [self.view addSubview:loginButton];
}

- (void)viewDidAppear:(BOOL)animated {
    [super viewDidAppear:(BOOL)animated];
    if ([FBSDKAccessToken currentAccessToken]) {
        HomeViewController *homeVC = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateInitialViewController];
        [self presentViewController:homeVC animated:YES completion:nil];
    }
}

- (void)viewWillAppear:(BOOL)animated {
    NSLog(@"");
}

#pragma mark -
- (void)  loginButton:(FBSDKLoginButton *)loginButton
didCompleteWithResult:(FBSDKLoginManagerLoginResult *)result
                error:(NSError *)error {
    HomeViewController *homeVC = [[UIStoryboard storyboardWithName:@"Home" bundle:nil] instantiateInitialViewController];
    [self presentViewController:homeVC animated:YES completion:nil];
}



@end
