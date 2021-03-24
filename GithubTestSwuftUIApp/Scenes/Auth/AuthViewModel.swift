//
//  AuthViewModel.swift
//  GithubTestSwuftUIApp
//
//  Created by Студия on 24.03.2021.
//

import Foundation
import Combine
import GithubAPI
import BaseAPI

class AuthViewModel: ObservableObject {
	
	@Published private(set) var goToNextView: Bool = false
	@Published private(set) var isLoading: Bool = false
	@Published private(set) var isError: Bool = false
	
	func authUser(token: String) {
		isLoading = true
		GithubManager.shared.auth(token: token)
		
		GithubManager.shared.getUser(handler: { [weak self] userResponse in
			DispatchQueue.main.async {
				if let userResponse = userResponse, userResponse.name != nil {
					self?.goToNextView = true
					self?.isLoading = false
				} else {
					self?.isLoading = false
					self?.isError = true
				}
			}
		})
	}
}
