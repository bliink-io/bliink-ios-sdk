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
        Utils.shared.setPreference()

        let options = [
            Constants.OPTIONS.MODE_TEST_KEY.rawValue : Constants.OPTIONS.TRUE.rawValue,
            Constants.OPTIONS.PAGE_TITLE_KEY.rawValue : Constants.OPTIONS.PAGE_TITLE_VALUE.rawValue,
            Constants.OPTIONS.PAGE_DESCRIPTION_KEY.rawValue : Constants.OPTIONS.PAGE_DESCRIPTION_VALUE.rawValue,
            Constants.OPTIONS.IMAGE_URL_KEY.rawValue : Constants.OPTIONS.IMAGE_URL_VALUE.rawValue,
            Constants.OPTIONS.PAGE_URL_KEY.rawValue : Constants.OPTIONS.PAGE_URL_VALUE.rawValue,
            Constants.OPTIONS.KEYWORDS_KEY.rawValue : Constants.OPTIONS.KEYWORDS_VALUE.rawValue
        ]

        inImageView.initialize()
        inImageView.loadAd(tagId: Constants.TAG_ID, options: options, adResponseHandler: self)
    }
    
    func adLoadingCompleted(adContent: Ad) {
        print("adLoadingCompleted")
    }
    
    func adLoadingFailed(error: String?) {
        print("adLoadingFailed : \(String(describing: error))")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated
    }
}
