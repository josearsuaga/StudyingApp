//
//  HomeViewUITests.swift
//  StudyingAppUITests
//
//  Created by José Arsuaga Sotres on 08/07/24.
//

import XCTest
import Home
import Components

final class HomeViewUITests: XCTestCase {
    
    let app = XCUIApplication()
    
    override func setUpWithError() throws {
        continueAfterFailure = false
        app.launch()
    }
    
    
    func testHomeViewDisplaysPokemons() throws {
        // Selecciona la pestaña Home
        let homeTab = app.tabBars.buttons["Home"]
        XCTAssertTrue(homeTab.exists)
        homeTab.tap()
        
        // Espera a que HomeView aparezca
        let homeView = app.scrollViews["HomeView"]
        XCTAssertTrue(homeView.waitForExistence(timeout: 5))
        
        let firstCardPredicate = NSPredicate(format: "exists == true")
        let firstCard = app.scrollViews["HomeView"].otherElements["card_charizard"]
                
        let expectation = XCTNSPredicateExpectation(predicate: firstCardPredicate, object: firstCard)
                        
        let result = XCTWaiter.wait(for: [expectation], timeout: 5.0)
                        
        XCTAssertEqual(result, .completed, "Failed to find the card in time")
        XCTAssertTrue(firstCard.exists)
    }
}
