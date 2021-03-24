//
//  FirstViewModel.swift
//  GithubTestSwuftUIApp
//
//  Created by Студия on 23.03.2021.
//

import Foundation
import Combine
import GithubAPI
import BaseAPI

class HomeViewModel: ObservableObject {
	
	@Published private(set) var user: UserResponse?
	
	func getUser() {
		
		GithubManager.shared.getUser(handler: { [weak self] userResponse in
			if let userResponse = userResponse {
				DispatchQueue.main.async {
					self?.user = userResponse
				}
			}
		})
	}
}
