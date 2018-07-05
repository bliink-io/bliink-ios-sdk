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
            NSURLQueryItem(name: Constants.MODE_TEST_KEY, value: Constants.TRUE),
            NSURLQueryItem(name: Constants.PAGE_TITLE_KEY, value: Constants.PAGE_TITLE_VALUE),
            NSURLQueryItem(name: Constants.PAGE_DESCRIPTION_KEY, value: Constants.PAGE_DESCRIPTION_VALUE),
            NSURLQueryItem(name: Constants.IMAGE_URL_KEY, value: Constants.IMAGE_URL_VALUE)
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
    
    func adLoadingFailed() {
        print("adLoadingFailed")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
}
