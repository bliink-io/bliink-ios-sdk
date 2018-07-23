//
//  InImageSliderController.swift
//  BliinkSample
//
//  Created by bliink on 18/06/2018.
//  Copyright © 2018 DAMS Saber. All rights reserved.
//

import UIKit
import BliinkSdk

class InImageSliderController: UIViewController, AdResponseHandlerProtocol {
    
    @IBOutlet var scrollView: UIScrollView!
    @IBOutlet var inImageView: BLIINKInImageView!
    
    var imageArray = [UIImage]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let queryItems = [
            NSURLQueryItem(name: Constants.OPTIONS.MODE_TEST_KEY.rawValue, value: Constants.OPTIONS.TRUE.rawValue),
            NSURLQueryItem(name: Constants.OPTIONS.PAGE_TITLE_KEY.rawValue, value: Constants.OPTIONS.PAGE_TITLE_VALUE.rawValue),
            NSURLQueryItem(name: Constants.OPTIONS.PAGE_DESCRIPTION_KEY.rawValue, value: Constants.OPTIONS.PAGE_DESCRIPTION_VALUE.rawValue),
            NSURLQueryItem(name: Constants.OPTIONS.IMAGE_URL_KEY.rawValue, value: Constants.OPTIONS.IMAGE_URL_VALUE.rawValue)
        ]
        
        imageArray = [#imageLiteral(resourceName: "img1"), #imageLiteral(resourceName: "Image"), #imageLiteral(resourceName: "img4"), #imageLiteral(resourceName: "img8"), #imageLiteral(resourceName: "img9"), #imageLiteral(resourceName: "img10")]
        
        scrollView.contentSize.width = UIScreen.main.bounds.width
        scrollView.frame.size.width = UIScreen.main.bounds.width
        
        for i in 0..<imageArray.count {
            let imageView = UIImageView()
            imageView.image = imageArray[i]
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.center = scrollView.center
            imageView.frame.size.height = scrollView.frame.height
            imageView.frame.size.width = scrollView.frame.width
            
            let ratio: CGFloat = CGFloat(imageView.frame.size.width / imageView.frame.size.height)
            let imgWidth = self.scrollView.frame.width
            let imgHeight = imgWidth / ratio
            
            let xPosition = self.view.frame.width * CGFloat(i)
            imageView.frame = CGRect(x: xPosition, y: 0, width: imgWidth, height: imgHeight)
            
            scrollView.contentSize.width = scrollView.frame.width * CGFloat(i + 1)
            
            scrollView.addSubview(imageView)
        }
        inImageView.initialize()
        inImageView.loadAd(tagId: Constants.TAG_ID, options: queryItems, adResponseHandler: self)
    }
    
    func adLoadingCompleted(adContent: BLIINKAdContent) {
        print("adLoadingCompleted")
    }
    
    func adLoadingFailed(error: String?) {
        print("adLoadingFailed")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
