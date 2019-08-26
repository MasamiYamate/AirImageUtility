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
        let request = AIUFlashAirCommandRequest.AIUFirmwareVersionInfo()
        let semaphore = DispatchSemaphore(value: 0)
        request.request(callback: {(res:String? , err: Error?) in
            print(res)
            semaphore.signal()
        })
        semaphore.wait()
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
