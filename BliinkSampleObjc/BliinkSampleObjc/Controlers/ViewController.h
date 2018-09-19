//
//  ViewController.h
//  BliinkSampleObjc
//
//  Created by DAMS Saber on 31/07/2018.
//  Copyright © 2018 DAMS Saber. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <BliinkSdk/BliinkSdk-Swift.h>
#import "Constants.h"

@interface ViewController : UIViewController<AdResponseHandlerProtocol>

@property (weak, nonatomic) IBOutlet UIView *adView;

//@property (weak, nonatomic) IBOutlet BLIINKInImageView *inImageView;

@end

