//
//  DogService.swift
//  DogChallenge
//
//  Created by Tori Rosa on 2/3/23.
//

import Foundation

//enum DogListServiceType {
//	case houndList
//	case houndImages(String)
//
//	var url: String {
//		let baseUrl = "https://dog.ceo/api/breed/hound/"
//		var url = ""
//
//		switch self {
//		case .houndList:
//			url = baseUrl + "list"
//
//		case .houndImages(let hound):
//			url = baseUrl.replacingOccurrences(of: "hound", with: hound) + "images"
//		}
//
//		return url
//	}
//}

class DogListService: DogServicing {
	private var url: String {
		Constants.baseUrl.rawValue + endpoint
	}
	private let endpoint = "breeds/list/all"

	func urlRequest() -> URLRequest? {
		let allHttpHeaderFields: [String: String] = [:]
		let httpMethod: NetworkHttpMethod = .get
		let queryItems: [URLQueryItem] = []
		let params = NetworkParameters(allHttpHeaderFields: allHttpHeaderFields, httpMethod: httpMethod, queryItems: queryItems, url: url)

		return NetworkRequest(params: params).urlRequest
	}
}

protocol DogServicing: ObservableObject {
	func urlRequest() -> URLRequest?
}

/*
 Using Dog API (https://dog.ceo/dog-api/documentation/breed), create an app (or Swift Playground) entirely in SwiftUI. The app should have at least basic functionality of seeing dog breeds and being able to see a list of images and/or a random image for a selected breed. We're looking for use of animations, custom alignments, Combine, and/or error handling. Things that give your SwiftUI code a nice touch.
 //Dog API
 //Dog CEO's Dog API Documentation. Over 20,000 images of dogs programmaticaly accessible by over 120 breeds. Image supplied by the Stanford Dogs Dataset.
 }
 */

