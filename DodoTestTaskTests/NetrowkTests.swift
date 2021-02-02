//
//  DodoTestTaskTests.swift
//  DodoTestTaskTests
//
//  Created by Mikhail Rubanov on 01.02.2021.
//

import XCTest
@testable import DodoTestTask

class DodoTestTaskTests: XCTestCase {

    func test_whenReadFile_shouldNotFail() throws {
        let network = Network()
        
        let loadExpect = expectation(description: "Load data")
        network.fetch { (result) in
            switch result {
            case .success:
                loadExpect.fulfill()
            
            case .failure:
                XCTFail("Should not fail")
            }
        }
        
        wait(for: [loadExpect], timeout: 1)
    }
}
