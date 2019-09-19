//
//  AirImageUtilityTests.swift
//  AirImageUtilityTests
//
//  Created by MasamiYamate on 2019/08/23.
//  Copyright © 2019 net.yamatte. All rights reserved.
//

import XCTest
@testable import AirImageUtility

class AirImageUtilityTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        var values = [1,2,3,4]
        while values.count != 0 {
            print(values)
            values.removeFirst()
            values.append(1)
        }
        
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
