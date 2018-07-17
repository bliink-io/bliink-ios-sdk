//
//  InImageScrollController.swift
//  BliinkSample
//
//  Created by bliink on 15/06/2018.
//  Copyright © 2018 DAMS Saber. All rights reserved.
//

import UIKit
import BliinkSdk

class InImageScrollController: UIViewController, AdResponseHandlerProtocol {
    

    @IBOutlet var inImageView: BLIINKInImageView!
    //@IBOutlet var inImageView: BLIINKInImageView!
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let queryItems = [
            NSURLQueryItem(name: Constants.OPTIONS.MODE_TEST_KEY.rawValue, value: Constants.OPTIONS.TRUE.rawValue),
            NSURLQueryItem(name: Constants.OPTIONS.PAGE_TITLE_KEY.rawValue, value: Constants.OPTIONS.PAGE_TITLE_VALUE.rawValue),
            NSURLQueryItem(name: Constants.OPTIONS.PAGE_DESCRIPTION_KEY.rawValue, value: Constants.OPTIONS.PAGE_DESCRIPTION_VALUE.rawValue),
            NSURLQueryItem(name: Constants.OPTIONS.IMAGE_URL_KEY.rawValue, value: Constants.OPTIONS.IMAGE_URL_VALUE.rawValue)
        ]
        
        inImageView.initialize()
        //imageView.frame.size.width = 3//UIScreen.main.bounds.width
        inImageView.loadAd(tagId: Constants.TAG_ID, options: queryItems, adResponseHandler: self)
    }
    
    func adLoadingCompleted(adContent: BLIINKAdContent) {
        print("adLoadingCompleted")
    }
    
    func adLoadingFailed(error: String?) {
        print("adLoadingFailed : \(String(describing: error))")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
