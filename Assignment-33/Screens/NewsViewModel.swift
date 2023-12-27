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
        self.networkManager = GenericNetworkManager(baseURL: "https://mocki.io/v1/")
        fetchData()
    }
        
    //MARK: - Methods
    func fetchData() {
        let endpoint = "9ded1a15-89b5-4566-92fe-466bfd8cd544"
        networkManager.fetchData(endpoint: endpoint) { (result: Result<NewsData, Error>) in
            switch result {
            case .success(let data):
                DispatchQueue.main.async {
                    self.news = data.news
                    print(data.news)
                }
            case .failure(let error):
                print("Error fetching items: \(error.localizedDescription)")
            }
        }
    }
}
