//
//  DogImageViewModelTests.swift
//  DogChallengeTests
//
//  Created by Tori Rosa on 2/3/23.
//

import XCTest
@testable import DogChallenge

final class DogImageViewModelTests: XCTestCase {
	private var dogListView: DogListView<DogImageViewModelMock>!
	private var dogListViewModel: DogImageViewModelMock!

	override func setUpWithError() throws {
		dogListViewModel = DogImageViewModelMock()
		dogListView = DogListView(viewModel: dogListViewModel)
	}

	override func tearDownWithError() throws {
		dogListView = nil
		dogListViewModel = nil
	}

	func testFetchData() throws {
		var fetchDataCalled = false
		let expectedResult = "otemStub"

		dogListViewModel.fetchDataCompletion = { item in
			fetchDataCalled = true
			XCTAssertEqual(item, expectedResult)
		}

		dogListViewModel.fetchData(item: expectedResult)

		XCTAssertTrue(fetchDataCalled)
	}
}
