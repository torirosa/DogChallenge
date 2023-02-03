//
//  DogImageService.swift
//  DogChallenge
//
//  Created by Tori Rosa on 2/3/23.
//

import Foundation

class DogImageService: DogServicing {
	private let breed: String
	private var endpoint: String {
 		"breed/\(breed)/images"
	}
	private var url: String {
		Constants.baseUrl.rawValue + endpoint
	}

	init(breed: String) {
		self.breed = breed
	}

	func urlRequest() -> URLRequest? {
		let allHttpHeaderFields: [String: String] = [:]
		let httpMethod: NetworkHttpMethod = .get
		let queryItems: [URLQueryItem] = []
		let params = NetworkParameters(allHttpHeaderFields: allHttpHeaderFields, httpMethod: httpMethod, queryItems: queryItems, url: url)

		return NetworkRequest(params: params).urlRequest
	}
}
