//
//  BattleViewUITests.swift
//  StudyingAppUITests
//
//  Created by José Arsuaga Sotres on 09/07/24.
//

import XCTest

final class BattleViewUITests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    func testBattleView() throws {
        let battleTab = app.tabBars.buttons["Battle Random"]
        XCTAssertTrue(battleTab.exists)
        battleTab.tap()
        
        let scrollView = app.scrollViews["BattleView"]
        XCTAssertTrue(scrollView.exists)
        
        
    }
}
