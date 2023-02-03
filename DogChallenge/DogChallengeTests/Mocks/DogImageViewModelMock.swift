//
//  DogImageViewModelMock.swift
//  DogChallengeTests
//
//  Created by Tori Rosa on 2/3/23.
//

@testable import DogChallenge

class DogImageViewModelMock: ContentViewModeling {
	var errorStub: Error?
	var error: Error? {
		get { errorStub }
		set {}
	}

	var itemsStub: [String] = []
	var items: [String] {
		get { itemsStub }
		set {}
	}

	var serviceStub: NetworkServicing = NetworkService()
	var service: NetworkServicing {
		get { serviceStub }
		set {}
	}

	var showAlertStub: Bool = false
	var showAlert: Bool {
		get { showAlertStub }
		set {}
	}

	var fetchDataCompletion: ((String?) -> Void)?
	func fetchData(item: String?) {
		fetchDataCompletion?(item)
	}
}
