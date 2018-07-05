//
//  ViewController.swift
//  BliinkSample
//
//  Created by DAMS Saber on 19/04/2018.
//  Copyright © 2018 DAMS Saber. All rights reserved.
//

import UIKit
import BliinkSdk

class InImageBasicController: UIViewController, AdResponseHandlerProtocol {

    @IBOutlet var mainView: UIView!
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
        inImageView.loadAd(tagId: Constants.TAG_ID, options: queryItems, adResponseHandler: self)
    }

    
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
