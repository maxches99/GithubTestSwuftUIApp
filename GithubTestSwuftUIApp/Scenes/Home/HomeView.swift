//
//  ContentView.swift
//  GithubTestSwuftUIApp
//
//  Created by Студия on 23.03.2021.
//

import SwiftUI
import Combine
import URLImage

struct HomeView: View {
	
	@StateObject var viewModel = HomeViewModel()
	
    var body: some View {
		NavigationView{
		VStack {
			HStack {
				Text(viewModel.user?.name ?? "User Name")
					.font(.title2)
					.padding(.leading)
				Spacer()
				if let url = URL(string: viewModel.user?.avatarUrl ?? "") {
					URLImage(url: url,
							 content: { image in
								image
									.resizable()
									.aspectRatio(contentMode: .fit)
							 })
						.frame(width: 40, height: 40, alignment: .center)
						.cornerRadius(20)
						.padding(.trailing)
				}
			}
			HStack {
				NavigationLink(destination: FindView()) {
					Text("Найти репозитории")
				}
				Spacer()
				NavigationLink(destination: RepositoriesView()) {
					Text("Мои репозитории")
				}
			}
			.padding([.top, .leading, .trailing])
			List {
				Section(header: Text("Основная информация")) {
					Text("Биография: \(viewModel.user?.bio ?? "User Name")")
					Text("Локация: \(viewModel.user?.location ?? "User Name")")
					Text("Открытых репозиториев: \(viewModel.user?.publicRepos ?? 0)")
				}
				
			}
			
		}
		.navigationTitle("GitHub")
		}
		.onAppear() {
			viewModel.getUser()
		}
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
		HomeView()
    }
}
