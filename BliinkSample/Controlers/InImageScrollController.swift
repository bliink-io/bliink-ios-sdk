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
    @IBOutlet var imageView: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let queryItems = [
            NSURLQueryItem(name: Constants.MODE_TEST_KEY, value: Constants.TRUE),
            NSURLQueryItem(name: Constants.PAGE_TITLE_KEY, value: Constants.PAGE_TITLE_VALUE),
            NSURLQueryItem(name: Constants.PAGE_DESCRIPTION_KEY, value: Constants.PAGE_DESCRIPTION_VALUE),
            NSURLQueryItem(name: Constants.IMAGE_URL_KEY, value: Constants.IMAGE_URL_VALUE)
        ]
        
        inImageView.initialize()
        //imageView.frame.size.width = 3//UIScreen.main.bounds.width
        inImageView.loadAd(tagId: Constants.TAG_ID, options: queryItems, adResponseHandler: self)    }
    
    func adLoadingCompleted(adContent: BLIINKAdContent) {
        print("adLoadingCompleted")
    }
    
    func adLoadingFailed() {
        print("adLoadingFailed")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
