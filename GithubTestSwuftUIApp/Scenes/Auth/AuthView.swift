//
//  AuthView.swift
//  GithubTestSwuftUIApp
//
//  Created by Студия on 24.03.2021.
//

import SwiftUI

struct AuthView: View {
	
	@State var token: String = ""
	@StateObject var viewModel = AuthViewModel()
	@State var goToNextView = false
	
	var body: some View {
		Group {
			switch viewModel.goToNextView {
				case true:
					HomeView()
				case false:
					VStack {
						Text("GitHub")
							.font(.title)
							.fontWeight(.bold)
						TextField("Введите ваш токен", text: $token, onCommit: {
							viewModel.authUser(token: token)
						})
						.textFieldStyle(RoundedBorderTextFieldStyle())
						if viewModel.isLoading {
							ProgressView()
								.padding()
						}
						if viewModel.isError {
							Text("Вы ввели неправильный токен")
								.foregroundColor(Color.red)
						}
					}
					.padding()
			}
		}
		
	}
}

struct AuthView_Previews: PreviewProvider {
    static var previews: some View {
        AuthView()
    }
}
