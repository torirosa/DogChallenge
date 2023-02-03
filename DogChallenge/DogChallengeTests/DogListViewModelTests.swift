//
//  DogListViewModelTests.swift
//  DogChallengeTests
//
//  Created by Tori Rosa on 2/3/23.
//

import XCTest
@testable import DogChallenge

final class DogListViewModelTests: XCTestCase {
	private var dogListView: DogListView<DogListViewModelMock>!
	private var dogListViewModel: DogListViewModelMock!

    override func setUpWithError() throws {
		dogListViewModel = DogListViewModelMock()
		dogListView = DogListView(viewModel: dogListViewModel)
    }

    override func tearDownWithError() throws {
		dogListView = nil
		dogListViewModel = nil
    }

    func testFetchData() throws {
		var fetchDataCalled = false

		dogListViewModel.fetchDataCompletion = { item in
			fetchDataCalled = true
			XCTAssertNil(item)
		}

		dogListViewModel.fetchData()

		XCTAssertTrue(fetchDataCalled)
    }
}
