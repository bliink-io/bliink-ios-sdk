//
//  BliinkSampleTests.swift
//  BliinkSampleTests
//
//  Created by DAMS Saber on 19/04/2018.
//  Copyright © 2018 DAMS Saber. All rights reserved.
//

import XCTest
@testable import BliinkSample

class BliinkSampleTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        let queryItems = [
            NSURLQueryItem(name: "test", value: "test")
        ]
        
        guard let storyBoard = UIStoryboard(name: "Main", bundle: nil).instantiateInitialViewController() as? UIViewController else {
            XCTFail("Fail to instanciate story board")
            return
        }
        storyBoard.loadViewIfNeeded()
        //tuto
        //https://medium.com/@joesusnick/how-to-test-a-nib-533d02847d78
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
}
