//
//  RepositoryState.swift
//  GithubTestSwuftUIApp
//
//  Created by Студия on 24.03.2021.
//

import Foundation
import GithubAPI
import BaseAPI

enum RepositoryState {
	case loading
	case success(content: RepositoryResponse)
	case failed(error: Error)
	
	var title: String {
		switch self {
		case .loading:
			return "Идет поиск этой ебаной компании"
		case .success(_):
			return "Компания загружена, а ты все еще с нами"
		case .failed(_):
			return "Сервак работает, как сука, швейцарские часы, но не сеголня"
		}
	}
}
