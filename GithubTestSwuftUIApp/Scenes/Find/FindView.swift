//
//  FindView.swift
//  GithubTestSwuftUIApp
//
//  Created by Студия on 24.03.2021.
//

import SwiftUI

struct FindView: View {
	
	@State var finderString: String = ""
	@StateObject var viewModel = FindViewModel()
	
    var body: some View {
		VStack {
			HStack {
			TextField("Найти репозиторий", text: $finderString, onCommit: {
				viewModel.searchRepos(repName: finderString)
				  })
				.textFieldStyle(RoundedBorderTextFieldStyle())
			}
			.padding()
			Spacer()
			Group {
				if viewModel.items.isEmpty {
					ProgressView()
					Text(viewModel.loadingString)
				} else {
					List(viewModel.items, id: \.id) { repo in
						HStack {
							Text(repo.name ?? "")
							Spacer()
							Text(repo.owner?.login ?? "")
								.fontWeight(.bold)
						}
					}
				}
			}
			Spacer()
		}
		.navigationTitle("Поиск репозиториев")
    }
}

struct FindView_Previews: PreviewProvider {
    static var previews: some View {
        FindView()
    }
}
