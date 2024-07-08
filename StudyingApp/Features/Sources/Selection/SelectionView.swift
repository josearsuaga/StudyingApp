//
//  SwiftUIView.swift
//  
//
//  Created by José Arsuaga Sotres on 08/07/24.
//

import SwiftUI

public struct SelectionView: View {
    @ObservedObject var viewModel: SelectionViewModel
    
    init(viewModel: SelectionViewModel) {
        self.viewModel = viewModel
    }
    
    public var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    SelectionView(viewModel: SelectionViewModel())
}
