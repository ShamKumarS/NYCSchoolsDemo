//
//  NYCSchoolsTests.swift
//  NYCSchoolsTests
//
//  Created by Rolan on 8/1/22.
//

import XCTest
@testable import NYCSchools

final class NYCSchoolsTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGettingSchoolsWithMockEmptyResult() {
        let expectation = expectation(description: "testing empty state with mock api")
        
        let mockAPI = MockSchoolAPI()
        mockAPI.loadState = .empty
        
        let viewModel = SchoolsViewModel(apiService: mockAPI)
        viewModel.getSchools { schools, error in
            XCTAssertTrue(schools?.isEmpty == true, "Expected schools to be empty, but received some values")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0) { error in
            if let error = error {
                XCTFail("Expectation failed \(error)")
            }
        }
    }
    
    func testGettingSchoolsWithErrorResult() {
        let expectation = expectation(description: "testing error state with mock api")
        
        let mockAPI = MockSchoolAPI()
        mockAPI.loadState = .error
        
        let viewModel = SchoolsViewModel(apiService: mockAPI)
        viewModel.getSchools { schools, error in
            XCTAssertTrue(schools == nil, "Expected to get no schools and error, but received schools")
            XCTAssertNotNil(error, "Expected to get an error, but received no error")
            
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0) { error in
            if let error = error {
                XCTFail("Expectation failed \(error)")
            }
        }
    }
    
    func testGettingSchoolsWithSuccess() {
        let expectation = expectation(description: "testing success state with mock api")
        let mockAPI = MockSchoolAPI()
        mockAPI.loadState = .loaded
        
        let viewModel = SchoolsViewModel(apiService: mockAPI)
        viewModel.getSchools { schools, error in
            XCTAssert(schools?.isEmpty == false, "Expected to get schools")
            XCTAssertNil(error, "Expected error to be nil")
            expectation.fulfill()
        }
        
        waitForExpectations(timeout: 1.0) { error in
            if let error = error {
                XCTFail("Expectation failed \(error)")
            }
        }
    }
}
 
