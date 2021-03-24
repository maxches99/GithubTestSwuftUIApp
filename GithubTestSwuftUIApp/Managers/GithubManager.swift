//
//  GithubManager.swift
//  GithubTestSwuftUIApp
//
//  Created by Студия on 24.03.2021.
//

import Foundation
import GithubAPI
import BaseAPI
import Combine

class GithubManager {
	
	static var shared = GithubManager()
	
	var userApi = UserAPI()
	var authentication = TokenAuthentication(token: "")
	private(set) var user: UserResponse?
	
	func auth(token: String) {
		authentication = TokenAuthentication(token: token)
		userApi = UserAPI(authentication: authentication)
	}
	
	func getUser(handler: @escaping ((UserResponse?)->Void)) {
		userApi.getUser { [weak self] (response, error) in
			handler(response)
			if let response = response {
				self?.user = response
			}
		}
	}
	
	func getRepos(handler: @escaping (([RepositoryResponse]?)->Void)) {
			RepositoriesAPI(authentication: authentication).repositories { (response, error) in
				handler(response)
			}
	}
	
	
	func searchRepos(search string: String, page: Int = 1, handler: @escaping (([SearchRepositoriesItem]?)->Void)) {
		SearchAPI().searchRepositories(q: string, page: page, per_page: 100) { (response, error) in
			handler(response?.items)
		}
	}
}

