# BLIINK IOS SDK

## Installation
### CocoaPods
- Add the Sdk to your ```Podfile```
```
pod 'BliinkSdk', '[LATEST_VERSION]'
```

## Usage
### Load an ad
#### Initialize the Sdk
In your file ```AppDelegate.swift```
- You need to create an instance of BLIINK with : the network ID, site ID, a boolean if you authorize or not the location and the timeout for the requests. If the timeout is nil the default value is 5 seconds
```
BLIINK.getInstance().initialize(network_id: [YOUR_NETWORK_ID], site_id: [YOUR_SITE_ID], authorizeLocation: true, timeout: 3)
```
```
network_id : It's your network id
site_id : It's your site id
authorizeLocation : This parameter is optional and false by default. It's a boolean to authorize or not the location
timeout : This parameter is optional and set to 5 seconds by default. It's the timeout that will be used to request the ad
```

#### Add your parameters
In your ```ViewController.swift``` file
- Create an array with your options:
````
let options = [
            "pageTitle" : "Les meilleures citations de ...",
            "pageDescription" : "Vainqueur au match aller en Italie (0-3)...",
            "keywords" : "bliink, rafael varane, has_diapo",
            "imageUrl" : "http://sf1.viepratique.fr/wp-content/uploads/sites/4/2018/03/c1-1.png",
            "pageUrl" : "http://www.viepratique.fr/psycho/citations-de-caroline-receveur-606352.html",
            "tags" : "bliink, raphael varane, has_diapo"
        ]
````
````
pageTitle : Title of the page
pageDescription : Description of the page
keywords : Keywords for the targeting
imageUrl : Url of the image
pageUrl : Url of the page
tags : Tags for the targeting
````

#### Create the view
- Create an instance of BLIINKInImageView linked with a simple UIView in your storyboard
```
@IBOutlet var inImageView: BLIINKInImageView!
```

#### Call to load the ad
- Call the function loadAd with the tag ID, your array of options and an optional handler with your class inheriting from ```AdResponseHandlerProtocol```
```
//Handler
func adLoadingCompleted(adContent: BLIINKAdContent) {
        print("adLoadingCompleted")
    }
    
    func adLoadingFailed() {
        print("adLoadingFailed")
    }
        
//Call to load the new ad
inImageView.loadAd(tagId: [YOUR_TAG_ID], options: options, adResponseHandler: self)
```
