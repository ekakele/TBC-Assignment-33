//
//  UITableViewRepresentableView.swift
//  Assignment-33
//
//  Created by Eka Kelenjeridze on 27.12.23.
//

import SwiftUI

struct UITableViewRepresentableView: UIViewRepresentable {
    @Binding var news: [News]
    
    
    // MARK: - Protocol Methods
    func makeUIView(context: Context) -> UITableView {
        let tableView = UITableView()
        tableView.dataSource = context.coordinator
        tableView.register(CustomNewsCell.self, forCellReuseIdentifier: "CustomCell")
        tableView.backgroundColor = .clear
        return tableView
    }
    
    //update data from SwiftUI to UIKit
    func updateUIView(_ uiView: UIViewType, context: Context) {
        context.coordinator.news = self.news
        uiView.reloadData()
    }
    
    //update data from UIKit to SwiftUI
    func makeCoordinator() -> Coordinator {
        Coordinator(news: news)
    }
    
    //Coordinator
    class Coordinator: NSObject, UITableViewDataSource {
        //        @Binding var news: [News]
        var news: [News]
        
        
        init(news: [News]) {
            self.news = news
        }
        
        func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
            news.count
        }
        
        func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
            if let cell = tableView.dequeueReusableCell(withIdentifier: "CustomCell", for: indexPath) as? CustomNewsCell {
                cell.configure(with: news[indexPath.row])
                return cell
            } else {
                return UITableViewCell()
            }
        }

    }
}



#Preview {
    UITableViewRepresentableView(news: .constant([NewsMockData.previewExample]))
}
