# BLIINK IOS SDK

### Load an ad
To load an ad you need to :
- Create an instance of BLIINK with : the context, network ID, site ID and a boolean if you authorize the location or not the location authorization
```
BLIINK.getInstance().initialize(this, [YOUR_NETWORK_ID], [YOUR_SITE_ID], true);
```

- An array of NSURLQueryItem with your options:
````
let queryItems = [
             NSURLQueryItem(name: "pageTitle", value: [YOUR_TITLE]),
             NSURLQueryItem(name: "pageDescription", value: [YOUR_DESCRIPTION]),
             NSURLQueryItem(name: "imageUrl", value: [YOUR_IMAGE_URL])
             ]
````

- An instance of BLIINKInImageView linked with a simple UIView in your storyboard
```
@IBOutlet var inImageView: BLIINKInImageView!
```

- And a call to the function loadAd with the tag ID, your array of options and an optional handler with your class inheriting from ```AdResponseHandlerProtocol```
You can also add a timeout, it's an optional parameter
```
//Handler
func adLoadingCompleted(adContent: BLIINKAdContent) {
        print("adLoadingCompleted")
    }
    
    func adLoadingFailed() {
        print("adLoadingFailed")
    }
        
//Call to load the new ad
inImageView.loadAd(tagId: [YOUR_TAG_ID], options: queryItems, adResponseHandler: self, timeout: 4)
```
