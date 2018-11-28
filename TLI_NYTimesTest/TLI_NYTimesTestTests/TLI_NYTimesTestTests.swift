//
//  TLI_NYTimesTestTests.swift
//  TLI_NYTimesTestTests
//
//  Created by Bhrigesh Kumar Chawda on 28/11/18.
//  Copyright © 2018 Bhrigesh Kumar Chawda. All rights reserved.
//

import XCTest
@testable import TLI_NYTimesTest

class TLI_NYTimesTestTests: XCTestCase {
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testNewsModelInitilazationPass() {
        
        let date = "2018/07/09"
        let news = News(newsTitle: "HelloTitle", newsImageUrl: URL(string: "https://www.nytimes.com/")!, newsDate: date, newsAuthor: "auther", newsContent: "content", id: 20)
        XCTAssertNotNil(news)
    }
    
    func testNewsModelInitilazationFail() {
        
        let date = ""
        let news = News(newsTitle: "HelloTitle", newsImageUrl: URL(string: "https://www.nytimes.com/")!, newsDate: date, newsAuthor: "auther", newsContent: "content", id: 20)
        XCTAssertNotNil(news)
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
