# BLIINK iOS SDK

## Objective-C Sample Quick Start

### Download our sample app

Download ou sample app from our github repository
```
git clone https://github.com/bliink-io/bliink-ios-sdk.git
```

### Install dependencies

Install **BLIINK SDK** from the **Podfile**
```
cd bliink-ios-sdk/BliinkSampleObjc
pod install
```

### Run the sample app

Run the project by pressing clicking on run button in xcode or CMD + R

## Installation

### CocoaPods
Add the SDK to your **Podfile**
```
pod 'BliinkSdk'
```

Install the pod  with the command:
```
pod install
```
### Import

Import the library in your **AppDelegate.h** and in your **ViewControllers.h** who will show the in-image ad
```
#import <BliinkSdk/BliinkSdk-Swift.h>
```
## Load an ad
### Initialize the Sdk
In your file **AppDelegate.m** you need to create an instance of **BLIINK SDK**:
```
BLIINK *bliink = [BLIINK  getInstance];

[bliink initializeWithNetwork_id: NETWORK_ID  site_id: SITE_ID  authorizeLocation: true  timeout: TIMEOUT];
```

**Parameters:**
- **network_id * _(Integer)_:** It's your network id
- **site_id * _(Integer)_:** It's your site id
- **authorizeLocation _(Boolean)_:** This parameter is optional and false by default. It's a boolean to authorize or not the location
- **timeout _(Integer)_:** This parameter is optional and set to 5 seconds by default. It's the timeout that will be used to request the ad

> parameters with * are mandatory

### Create the BLIINKInImageView
Create the BLIINKInImageView in your **storyboard** or in a **.xib** file. It need to be encapsulated in the same view as the image like :
```
- contentView
  - image
  - BLIINKInImageView
 ```

Link the BLIINKInImageView in your **ViewController.h**
```
@property (weak, nonatomic) IBOutlet  BLIINKInImageView *inImageView;
```

### Call for an in-image ad

In your **ViewController.m** file call the **loadAd** function with the tag ID, an array of options and an optional handler. For the handler your class can inherit from **AdResponseHandlerProtocol**

**Handlers**
```
- (void)adLoadingCompletedWithAdContent:(BLIINKAdContent * _Nonnull)adContent {
  NSLog(@"adLoadingCompletedWithAdContent");
}

- (void)adLoadingFailedWithError:(NSString * _Nullable)error {
  NSLog(@"adLoadingFailedWithError");
}
```
**Array with your parameters**
```
NSDictionary *options = @{
	     	      	"pageTitle" : "BLIINK - Technology",
            "pageDescription" : "Open up a whole new range of possibilities through our in-image technology",
            "keywords" : "bliink, technology",
            "imageUrl" : "https://bliink.io/img/pictures/pic--tablet.png",
            "pageUrl" : "https://bliink.io/technology"
};
```

The **options** Array is used to contextualize your article, it contains :

- **pageTitle * _(NSString)_:** Title of the page
- **pageDescription * _(NSString)_:** Description of the page
- **keywords * _(NSString)_:** Keywords for the targeting
- **imageUrl * _(NSString)_:** Url of the image
- **pageUrl * _(NSString)_:** Url of the page

> parameters with * are mandatory

**Call for an in-image ad**
```
[_inImageView  loadAdWithTagId: TAG_ID  options:options adResponseHandler:self];
```