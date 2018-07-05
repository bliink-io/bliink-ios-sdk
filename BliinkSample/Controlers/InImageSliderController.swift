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
            NSURLQueryItem(name: Constants.MODE_TEST_KEY, value: Constants.TRUE),
            NSURLQueryItem(name: Constants.PAGE_TITLE_KEY, value: Constants.PAGE_TITLE_VALUE),
            NSURLQueryItem(name: Constants.PAGE_DESCRIPTION_KEY, value: Constants.PAGE_DESCRIPTION_VALUE),
            NSURLQueryItem(name: Constants.IMAGE_URL_KEY, value: Constants.IMAGE_URL_VALUE)
        ]
        
        imageArray = [#imageLiteral(resourceName: "Image"), #imageLiteral(resourceName: "Image"), #imageLiteral(resourceName: "Image")]
        
        for i in 0..<imageArray.count {
            let imageView = UIImageView()
            imageView.image = imageArray[i]
            imageView.contentMode = .scaleAspectFill
            imageView.clipsToBounds = true
            imageView.frame.size.height = CGFloat(Constants.IMAGE_SIZE)
            imageView.frame.size.width = CGFloat(Constants.IMAGE_SIZE)

            let ratio: CGFloat = CGFloat(imageView.frame.size.width / imageView.frame.size.height)

            let imgWidth = scrollView.frame.width
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
    
    func adLoadingFailed() {
        print("adLoadingFailed")
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
