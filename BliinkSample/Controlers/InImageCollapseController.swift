//
//  InImageCollapseController.swift
//  BliinkSample
//
//  Created by bliink on 25/06/2018.
//  Copyright © 2018 DAMS Saber. All rights reserved.
//

import UIKit
import BliinkSdk

class InImageCollapseController: UIViewController, UIScrollViewDelegate, AdResponseHandlerProtocol {    

    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var image: UIImageView!
    @IBOutlet var inImageView: BLIINKInImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        scrollView.delegate = self
        let queryItems = [
            NSURLQueryItem(name: Constants.OPTIONS.MODE_TEST_KEY.rawValue, value: Constants.OPTIONS.TRUE.rawValue),
            NSURLQueryItem(name: Constants.OPTIONS.PAGE_TITLE_KEY.rawValue, value: Constants.OPTIONS.PAGE_TITLE_VALUE.rawValue),
            NSURLQueryItem(name: Constants.OPTIONS.PAGE_DESCRIPTION_KEY.rawValue, value: Constants.OPTIONS.PAGE_DESCRIPTION_VALUE.rawValue),
            NSURLQueryItem(name: Constants.OPTIONS.IMAGE_URL_KEY.rawValue, value: Constants.OPTIONS.IMAGE_URL_VALUE.rawValue)
        ]
        
        inImageView.initialize()
        inImageView.loadAd(tagId: Constants.TAG_ID, options: queryItems, adResponseHandler: self)
    }
    
    func testIsVisible(view: UIView) -> Bool {
        func testIsVisible(view: UIView, inView: UIView?) -> Bool {
            guard let inView = inView else { return true }
            let viewFrame = inView.convert(view.bounds, from: view)
            if viewFrame.intersects(inView.bounds) {
                return testIsVisible(view: view, inView: inView.superview)
            }
            return false
        }
        return testIsVisible(view: view, inView: view.superview)
    }
    
    public func scrollViewDidScroll(_ scrollView: UIScrollView) {
        image.frame.origin.y =  (scrollView.contentOffset.y + 64) / 2
        inImageView.frame = image.frame
        //print("View is visible : \(testIsVisible(view: inImageView))")
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
