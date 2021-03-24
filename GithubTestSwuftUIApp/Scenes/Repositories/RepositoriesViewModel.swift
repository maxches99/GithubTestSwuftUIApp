//
//  RepositoriesViewModel.swift
//  GithubTestSwuftUIApp
//
//  Created by Студия on 24.03.2021.
//

import Foundation
import Combine
import GithubAPI
import BaseAPI

class RepositoriesViewModel: ObservableObject {
	
	@Published private(set) var repositories: [RepositoryResponse] = []
	
	func getRepos() {
		GithubManager.shared.getRepos(handler: { [weak self] repos in
			if let repos = repos {
				DispatchQueue.main.async {
					self?.repositories = repos
				}
			}
		})
	}
}

extension RepositoryResponse: Identifiable {
	public var id: UUID {
		UUID()
	}
}
