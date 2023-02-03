//
//  DogChallengeApp.swift
//  DogChallenge
//
//  Created by Tori Rosa on 2/3/23.
//

import SwiftUI

@main
struct DogChallengeApp: App {
    var body: some Scene {
        WindowGroup {
			let viewModel = DogListViewModel()
            DogListView(viewModel: viewModel)
        }
    }
}
