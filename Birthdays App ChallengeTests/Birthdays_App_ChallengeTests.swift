//
//  Birthdays_App_ChallengeTests.swift
//  Birthdays App ChallengeTests
//
//  Created by Pete Chambers on 03/02/2022.
//

import XCTest
@testable import Birthdays_App_Challenge

class Birthdays_App_ChallengeTests: XCTestCase {

    private var sut: WebService!

    override func setUpWithError() throws {
        sut = WebService()
    }

    override func tearDownWithError() throws {
        sut = nil
    }

    func testAPIResponse() throws {
        let expectation = XCTestExpectation(description: "Alamofire")
        sut?.fetchBirthdays { (result) in
            switch result {
            case .success(let birthdays):
                XCTAssertEqual(birthdays.results.count, 1000)
                expectation.fulfill()
            case .failure(let error):
                debugPrint("test failed with error: \(error)")
            }
        }
        wait(for: [expectation], timeout: 5)

    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
