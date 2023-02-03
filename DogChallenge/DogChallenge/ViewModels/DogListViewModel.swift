//
//  DogListViewModel.swift
//  DogChallenge
//
//  Created by Tori Rosa on 2/3/23.
//

import Foundation

class DogListViewModel: ContentViewModeling {
	// MARK: - Published Objects

	@Published var error: Error?
	@Published var showAlert = false
	@Published var items: [String] = []

	// MARK: - Properties

	var service: NetworkServicing = NetworkService()

	// MARK: - Private Methods

	@MainActor
	private func request(service: any DogServicing) async throws -> Void {
		let urlRequest = service.urlRequest()

		let list: DogList = try await self.service.request(urlRequest: urlRequest)

		self.items = Array(list.message.filter {
			$0.value.count > 0
		}.keys).sorted(by: <)
	}

	// MARK: - Methods

	func fetchData(item: String?) {
		Task {
			do {
				let service = DogListService()
				try await request(service: service)
			} catch {
				showAlert = true
				self.error = error
			}
		}
	}
}
