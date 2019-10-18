//
//  MockProductServiceTests.swift
//  ShoppingAppMVVVCTests
//
//  Created by Jaroslavc Cervenka on 09/09/2019.
//  Copyright © 2019 POC Software. All rights reserved.
//

import XCTest

@testable import ShoppingAppMVVVC

class MockProductServiceTests: XCTestCase {

    private var sut: ProductService!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        self.sut = ProductServiceMock()
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testGetList() {
        //Arrange
        let expectedProductsCount = 10

        //Act
        let result = self.sut.getList()

        //Assert
        XCTAssertNotNil(result, "Should return list of products")
        XCTAssertEqual(result.count, expectedProductsCount, "Result should have 10 products")
    }


}
