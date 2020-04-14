//
//  PankAppTests.swift
//  PankAppTests
//
//  Created by Motonari Nakashima on 2020/04/13.
//  Copyright © 2020 motoshima1150. All rights reserved.
//

import XCTest
@testable import PankApp

class PankAppTests: XCTestCase {

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() {
        let testBundle = Bundle(for: type(of: self))
        let path = testBundle.url(forResource: "random", withExtension: "json")!
        let data = try! Data(contentsOf: path, options: .uncached)
        
        let decorder = JSONDecoder()
        decorder.keyDecodingStrategy = .convertFromSnakeCase
        let beers = try! decorder.decode([Beer].self, from: data)
        
        XCTAssertFalse(beers.isEmpty)
        let sampleBeer = beers.first!
        print(sampleBeer.id)
        print(sampleBeer.name)
        XCTAssertEqual(sampleBeer.id, "91")
        XCTAssertEqual(sampleBeer.name, "Dead Pony Club")
        XCTAssertEqual(sampleBeer.imageURL.absoluteString, "https://images.punkapi.com/v2/91.png")
        XCTAssertEqual(sampleBeer.boilVolume.value, 25.0)
        XCTAssertEqual(sampleBeer.boilVolume.unit.symbol, UnitVolume.liters.symbol)
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
