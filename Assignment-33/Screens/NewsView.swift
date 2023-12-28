//
//  NewsView.swift
//  Assignment-33
//
//  Created by Eka Kelenjeridze on 27.12.23.
//

import SwiftUI

struct NewsView: View {
    // MARK: - Properties
    @EnvironmentObject var viewModel: NewsViewModel
    @Environment(\.sizeCategory) var sizeCategory

    // MARK: - Body
    var body: some View {
        NavigationStack {
            tableViewZStackView
                .navigationTitle("Accessible News")
                .accessibilityElement()
                .accessibilityAddTraits(.isHeader)
        }
        .minimumScaleFactor(sizeCategory.customMinScaleFactor)
    }
    
    // MARK: - Components
    private var tableViewZStackView: some View {
        ZStack {
            Color.yellow.opacity(0.7)
                .ignoresSafeArea()
            tableViewVStackView
        }
    }
    
    private var tableViewVStackView: some View {
        VStack {
            UITableViewRepresentableView(news: $viewModel.news)
        }
        .padding(.horizontal, 10)
    }
}



#Preview {
    NewsView().environmentObject(NewsViewModel())
}
