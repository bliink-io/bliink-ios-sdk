//
//  ViewController.m
//  BliinkSampleObjc
//
//  Created by DAMS Saber on 31/07/2018.
//  Copyright © 2018 DAMS Saber. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    NSDictionary *options = @{ PAGE_DESCRIPTION_KEY : PAGE_DESCRIPTION_VALUE,
                               IMAGE_URL_KEY : IMAGE_URL_VALUE,
                               PAGE_URL_KEY : PAGE_URL_VALUE,
                               KEYWORDS_KEY : KEYWORDS_VALUE,
                               PAGE_TITLE_KEY : PAGE_TITLE_VALUE,
                               MODE_TEST_KEY : @"true",
                             };

    [_inImageView loadAdWithTagId: TAG_ID options:options adResponseHandler:self];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)adLoadingCompletedWithAdContent:(BLIINKAdContent * _Nonnull)adContent {
    NSLog(@"adLoadingCompletedWithAdContent");
}

- (void)adLoadingFailedWithError:(NSString * _Nullable)error {
    NSLog(@"adLoadingFailedWithError");
}

@end
