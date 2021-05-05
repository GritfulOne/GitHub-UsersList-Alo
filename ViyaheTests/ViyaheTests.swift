//
//  ViyaheTests.swift
//  ViyaheTests
//
//  Created by Gino Simon Alo on 5/4/21.
//

import XCTest
@testable import Viyahe

class ViyaheTests: XCTestCase {

    var colorSelector: ColorSelector!
    override func setUpWithError() throws {
        try super.setUpWithError()
        
        colorSelector = ColorSelector()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        colorSelector = nil
        try super.tearDownWithError()
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testIntIsEvenValueForEvenNumber() {
        //given
        let evenNumber = 2
        
        //when
        let isEven = evenNumber.isEven
        
        //then
        XCTAssertTrue(isEven, "Wrong value return by isEven")
    }
    
    func testIntIsEvenValueForOddNumber() {
        //given
        let oddNumber = 1
        
        //when
        let isEven = oddNumber.isEven
        
        //then
        XCTAssertFalse(isEven, "Wrong value return by isEven")
    }

    func testProperColorIsSelectedForOddNumber() {
        //given
        let oddNumber = 1
        
        //when
        let cgColor = colorSelector.getColor(forInt: oddNumber)
        
        XCTAssertEqual(cgColor, UIColor.blue.cgColor, "Color selected is wrong")
    }
    
    
    func testProperColorIsSelectedForEvenNumber() {
        //given
        let evenNumber = 2
        
        //when
        let cgColor = colorSelector.getColor(forInt: evenNumber)
        
        XCTAssertEqual(cgColor, UIColor.green.cgColor, "Color selected is wrong")
    }

    
    func testGetLastIDReturnsLastID() {
        //given
        let users = [GithubUser(id: 10, login: "String", avatarURL: "String", htmlURL: "String", type: "String"), GithubUser(id: 20, login: "String", avatarURL: "String", htmlURL: "String", type: "String")]
        
        //when
        let lastID = UserUtils.getLastID(users: users)
        
        //then
        XCTAssertEqual(lastID, 20, "Wrong last ID returned")
    }

}
