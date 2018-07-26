# BLIINK IOS SDK

## Installation
### CocoaPods
- Add the Sdk to your ```Podfile```
```
pod 'BliinkSdk', '[LATEST_VERSION]'
```
### Add the import
```
import BliinkSdk
```
## Load an ad
### Initialize the Sdk
In your file ```AppDelegate.swift```
- You need to create an instance of BLIINK with : the network ID, site ID, a boolean if you authorize or not the location and the timeout for the requests. If the timeout is nil the default value is 5 seconds
```
BLIINK.getInstance().initialize(network_id: [YOUR_NETWORK_ID], site_id: [YOUR_SITE_ID], authorizeLocation: true, timeout: 3)
```
```
network_id : Integer : It's your network id
site_id : Integer : It's your site id
authorizeLocation : Boolean : This parameter is optional and false by default. It's a boolean to authorize or not the location
timeout : Integer : This parameter is optional and set to 5 seconds by default. It's the timeout that will be used to request the ad
```
### Create the BLIINKInImageView in your ```soryboard``` or ```.xib``` file
- Create an instance of BLIINKInImageView in your storyboard or in a .xib file. It need to be encapsulated in the same view as the image like :
```
- contentView
  - image
  - BLIINKInImageView
 ```
Link the BLIINKInImageView in your controller
```
@IBOutlet var inImageView: BLIINKInImageView!
```

### Call to load the ad
In your ```ViewController.swift``` file
- Call the function loadAd with the tag ID, an array of options and an optional handler. For the handler your class can inherit from ```AdResponseHandlerProtocol```
```
//Handler
func adLoadingCompleted(adContent: BLIINKAdContent) {
    print("adLoadingCompleted")
}
    
func adLoadingFailed() {
    print("adLoadingFailed")
}

//Array with your parameters
let options = [
            "pageTitle" : "Coupe du monde 2018",
            "pageDescription" : "Le bus des Bleus sur les Champs-Elysees",
            "keywords" : "bliink, foot, coupe du monde",
            "imageUrl" : "https://bliink.io/img/pictures/pic--tablet.png",
            "pageUrl" : "https://bliink.io/technology"
        ]

//Call to load the new ad
inImageView.loadAd(tagId: [YOUR_TAG_ID], options: options, adResponseHandler: self)
```
The ```options``` Array is used to contextualize your article, it contains :
````
pageTitle : String : Title of the page
pageDescription : String : Description of the page
keywords : String : Keywords for the targeting
imageUrl : String : Url of the image
pageUrl : String : Url of the page
tags : String : Tags for the targeting
