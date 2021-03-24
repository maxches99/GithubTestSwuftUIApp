//
//  RepositoriesView.swift
//  GithubTestSwuftUIApp
//
//  Created by Студия on 24.03.2021.
//

import SwiftUI

struct RepositoriesView: View {
	
	@StateObject var viewModel = RepositoriesViewModel()
	
	var body: some View {
		VStack {
			List(viewModel.repositories, id: \.id) { repo in
				Text(repo.name ?? "")
			}
		}
		.navigationTitle("Мои репозитории")
		.onAppear() {
			viewModel.getRepos()
		}
	}
}

struct RepositoriesView_Previews: PreviewProvider {
    static var previews: some View {
        RepositoriesView()
    }
}
