//
//  FindViewModel.swift
//  GithubTestSwuftUIApp
//
//  Created by Студия on 24.03.2021.
//

import Foundation
import Combine
import GithubAPI
import BaseAPI

class FindViewModel: ObservableObject {
	
	@Published private(set) var items: [SearchRepositoriesItem] = []
	@Published private(set) var loadingString: String = "Введите данные"
	
	func searchRepos(repName: String) {
		loadingString = "Ожидание получения данных"
		GithubManager.shared.searchRepos(search: repName, handler: { [weak self] repos in
			if let repos = repos {
				DispatchQueue.main.async {
					self?.items.append(contentsOf: repos)
				}
			}
		})
	}
}

extension SearchRepositoriesItem: Identifiable {
	public var id: UUID {
		UUID()
	}
}
