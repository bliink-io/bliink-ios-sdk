# BLIINK iOS SDK

## Swift Sample Quick Start

### Download our sample app

Download ou sample app from our github repository
```
git clone https://github.com/bliink-io/bliink-ios-sdk.git
```

### Install dependencies

Install **BLIINK SDK** from the **Podfile**
```
cd bliink-ios-sdk/BliinkSampleSwift
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

Import the library in your **AppDelegate** and in your **Controllers** who will show the in-image ad
```
import BliinkSdk
```
## Load an ad
### Initialize the Sdk
In your file **AppDelegate.swift** you need to create an instance of **BLIINK SDK**:
```
BLIINK.getInstance().initialize(network_id: [YOUR_NETWORK_ID], site_id: [YOUR_SITE_ID], authorizeLocation: true, timeout: 3)
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

Link the BLIINKInImageView to your **Controller**
```
@IBOutlet var inImageView: BLIINKInImageView!
```

### Call for an in-image ad

In your **ViewController.swift** file call the **loadAd** function with the tag ID, an array of options and an optional handler. For the handler your class can inherit from **AdResponseHandlerProtocol**

**Handlers**
```
func adLoadingCompleted(adContent: BLIINKAdContent) {
    print("adLoadingCompleted")
}
    
func adLoadingFailed() {
    print("adLoadingFailed")
}
```
**Array with your parameters**
```
let options = [
            "pageTitle" : "BLIINK - Technology",
            "pageDescription" : "Open up a whole new range of possibilities through our in-image technology",
            "keywords" : "bliink, technology",
            "imageUrl" : "https://bliink.io/img/pictures/pic--tablet.png",
            "pageUrl" : "https://bliink.io/technology"
        ]
```

The **options** Array is used to contextualize your article, it contains :

- **pageTitle * _(String)_:** Title of the page
- **pageDescription * _(String)_:** Description of the page
- **keywords * _(String)_:** Keywords for the targeting
- **imageUrl * _(String)_:** Url of the image
- **pageUrl * _(String)_:** Url of the page

> parameters with * are mandatory

**Call for an in-image ad**
```
inImageView.loadAd(tagId: [YOUR_TAG_ID], options: options, adResponseHandler: self)
```
