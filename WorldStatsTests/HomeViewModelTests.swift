//
//  HomeViewModelTests.swift
//  WorldStatsTests
//
//  Created by Emirates on 8/28/20.
//  Copyright © 2020 Fahied. All rights reserved.
//

import XCTest
@testable import WorldStats


let stub = [LifeExpectency(number: 0, country: "Sweden", both: 86.0, males: 88.0, females: 90.0),
LifeExpectency(number: 0, country: "Norway", both: 85.0, males: 80.0, females: 90.0)]

class LifeExpectencyRepositoryMock: LifeExpectencyRepository {
    
    override func refresh(completion: @escaping (Result<[LifeExpectency], NetworkError>) -> Void) {
        completion(.success(stub))
    }
}


class HomeViewModelTests: XCTestCase {

    var viewModel: HomeViewModel!
    
    override func setUpWithError() throws {
        viewModel = HomeViewModel(repository: LifeExpectencyRepositoryMock())
    }

    func testRecordCountIsCorrectAfterReloadingFromNetwork() throws {
        
        let expectation = self.expectation(description: "Reloading")
        viewModel.reload { expectation.fulfill() }
        waitForExpectations(timeout: 5, handler: nil)
        
        XCTAssert(viewModel.recordsCount == 2)
    }
    
    func testProvideRightItemAfterSortingArray() throws {
        
        let expectation = self.expectation(description: "Reloading")
        viewModel.reload { expectation.fulfill() }
        waitForExpectations(timeout: 5, handler: nil)
        
        let item = viewModel.item(at: 0)
        
        XCTAssertEqual(item?.country, "Norway")
    }
}
