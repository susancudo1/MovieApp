//
//  MovieUITests.swift
//  MovieUITests
//
//  Created by Javier Susa on 27/03/21.
//

import XCTest

class MovieUITests: XCTestCase {

    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        app.launch()
    }

    func testExample() throws {
        let searchTextField = app.textFields["Search ..."]
        XCTAssertEqual(searchTextField.label, "")

        searchTextField.tap()

        app.keys["G"].tap()

        app.keys["o"].tap()

        app.keys["d"].tap()

        app.keys["z"].tap()

        app.keys["i"].tap()

        app.keys["l"].tap()

        app.keys["l"].tap()

        app.keys["a"].tap()

        app.buttons["Return"].tap()

        let cell = app.tables.cells["chevron.right, Godzilla vs. Kong"].otherElements
        cell.containing(.button, identifier: "chevron.right").children(matching: .image).element.tap()

        let scrollViewsQuery = app.scrollViews
        let elementsQuery = scrollViewsQuery.otherElements

        let titleDescription = elementsQuery.staticTexts["DESCRIPTION"]
        XCTAssertEqual(titleDescription.label, "DESCRIPTION")

        let titleLanguage = elementsQuery.staticTexts["ORIGINAL LANGUAGE"]
        XCTAssertEqual(titleLanguage.label, "ORIGINAL LANGUAGE")

        let titleTitle = elementsQuery.staticTexts["ORIGINAL TITLE"]
        XCTAssertEqual(titleTitle.label, "ORIGINAL TITLE")

        let titlePopularity = elementsQuery.staticTexts["POPULARITY"]
        XCTAssertEqual(titlePopularity.label, "POPULARITY")
    }
}
