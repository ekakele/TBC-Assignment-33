//
//  NewsViewModel.swift
//  Assignment-33
//
//  Created by Eka Kelenjeridze on 27.12.23.
//

import Foundation
import GenericNetworkManager

final class NewsViewModel: ObservableObject {
    // MARK: - Properties
    private var networkManager: GenericNetworkManager
    @Published var news: [News] = []
    @Published var newsMock: [News] =  [NewsMockData.previewExample]

    
    // MARK: - Init
    init() {
        self.networkManager = GenericNetworkManager(baseURL: "https://api.worldnewsapi.com/")
        fetchData()
    }
        
    //MARK: - Methods
    func fetchData() {
        let endpoint = "search-news?authors=Phil+Hutchinson&api-key=ef64d5ab17944807940b10369f9f7a44"
        networkManager.fetchData(endpoint: endpoint) { (result: Result<NewsData, Error>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.news = data.news
                }
            case .failure(let error):
                print("Error fetching items: \(error.localizedDescription)")
            }
        }
    }

}
