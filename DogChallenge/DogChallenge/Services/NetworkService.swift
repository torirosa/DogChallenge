//
//  NetworkService.swift
//  DogChallenge
//
//  Created by Tori Rosa on 2/3/23.
//

import Foundation

struct NetworkService: NetworkServicing {
	func request<DataType: Decodable>(urlRequest: URLRequest?) async throws -> DataType {
		guard let urlRequest = urlRequest else {
			throw NetworkError.invalidRequest
		}

		let (data, response) = try await URLSession.shared.data(for: urlRequest)

		guard (response as? HTTPURLResponse)?.statusCode == 200 else {
			throw NetworkError.invalidResponse
		}

		if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String: Any] {
			// try to read out a string array
			print("json: \(json)")
		}

		do {
			try JSONDecoder().decode(DataType.self, from: data)
		} catch {
			print("error: \(error)")
		}

		return try JSONDecoder().decode(DataType.self, from: data)
	}
}

protocol  NetworkServicing {
	func request<DataType: Decodable>(urlRequest: URLRequest?) async throws -> DataType
}

