//
//  BullsEyeTests.swift
//  BullsEyeTests
//
//  Created by Larissa Barra Conde on 09/04/18.
//  Copyright © 2018 Razeware. All rights reserved.
//

import XCTest

@testable import BullsEye

class BullsEyeTests: XCTestCase {
  
    var viewController: ViewController!
    
    override func setUp() {
        super.setUp()
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        viewController = storyboard.instantiateViewController(withIdentifier: "ViewController") as! ViewController
      
        viewController.loadView()
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
      
        viewController = nil
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
  
    func testStartNewGame() {
        viewController.startNewGame()
      
        XCTAssertEqual(viewController.score, 0)
        XCTAssertEqual(viewController.round, 1)
    }
  
    func testStartNewRound() {
        let previousRound = viewController.round
      
        viewController.startNewRound()
      
        XCTAssertEqual(viewController.round, previousRound + 1)
        XCTAssertEqual(viewController.currentValue, 50)
    }
  
    func testScoreForPerfectGuess() {
        viewController.startNewGame()
        let randomTarget = viewController.targetValue
      
        let perfectGuess = randomTarget
        viewController.currentValue = perfectGuess
      
        viewController.showAlert()
      
        XCTAssertEqual(viewController.score, 200)
    }
  
    func testScoreForAlmostPerfectGuess() {
        viewController.startNewGame()
        let randomTarget = viewController.targetValue
      
        let almostPerfectGuess = randomTarget - 3
        viewController.currentValue = almostPerfectGuess
      
        viewController.showAlert()
      
        XCTAssertEqual(viewController.score, 97)
    }
  
    func testScoreForAlmostPerfectGuessWithBonus() {
        viewController.startNewGame()
        let randomTarget = viewController.targetValue
      
        let almostPerfectGuess = randomTarget - 1
        viewController.currentValue = almostPerfectGuess
      
        viewController.showAlert()
      
        XCTAssertEqual(viewController.score, 149)
    }
  
    func testScoreForGoodGuess() {
        viewController.startNewGame()
        let randomTarget = viewController.targetValue
      
        let goodGuess = randomTarget - 8
        viewController.currentValue = goodGuess
      
        viewController.showAlert()
      
        XCTAssertEqual(viewController.score, 92)
    }
  
    func testScoreForBadGuess() {
        viewController.startNewGame()
        let randomTarget = viewController.targetValue
      
        let badGuess = randomTarget - 20
        viewController.currentValue = badGuess
      
        viewController.showAlert()
      
        XCTAssertEqual(viewController.score, 80)
    }
    
}
