//
//  PictureGameViewModelTests.swift
//  English HelperTests
//
//  Created by 老房东 on 2022-02-09.
//

import XCTest
@testable import Learn_English_Helper

// Naming Structure: test_UnitOfWork_StateUnderTest_ExpectedBehavior
// Testing Structure: Given, When, Then

class PictureGameViewModelTests: XCTestCase {

    var vm : PictureGameViewModel?
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        vm = PictureGameViewModel()
        guard let vm = vm else {
            XCTFail()
            return
        }
        vm.mokeData()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        vm = nil
    }

    func test_UnitForGeneratePictureExam_isUniqExamTrue_should100Answer() throws {
        guard let vm = vm else {
            XCTFail()
            return
        }
        vm.length = 100
        vm.isUniqExam = true
        vm.generatePictureExam()
        XCTAssertEqual(vm.length, 100)
        XCTAssertTrue(vm.startExam)
        XCTAssert(vm.question.count > 1)

        
        for _ in 0..<99{
            vm.goToNextQuestion()
            XCTAssert(vm.question.count > 1)
            XCTAssertTrue(vm.startExam)
            XCTAssertFalse(vm.reachedEnd)
        }

        vm.goToNextQuestion()
        XCTAssert(vm.question.count > 1)
        XCTAssertTrue(vm.startExam)
        XCTAssertTrue(vm.reachedEnd)
    }
    
    func testPerformanceUnitForGeneratePictureExam_isUniqExamTrue() throws {
        guard let vm = vm else {
            XCTFail()
            return
        }
        vm.length = 100
        vm.isUniqExam = true
        self.measure {
            vm.generatePictureExam()
        }
    }

    func testPerformanceUnitForGeneratePictureExam_isUniqExamFalse() throws {
        guard let vm = vm else {
            XCTFail()
            return
        }
        vm.length = 100
        vm.isUniqExam = false
        self.measure {
            vm.generatePictureExam()
        }
    }
}