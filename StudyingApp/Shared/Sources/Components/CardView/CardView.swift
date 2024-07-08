//
//  SwiftUIView.swift
//
//
//  Created by José Arsuaga Sotres on 05/07/24.
//

import SwiftUI

public struct CardView: View {
    
    @Binding var isSelected: Bool
    
    var title: String
    var subtitle: String
    var imageURL: URL?
    
    public init(
        title: String,
        subtitle: String,
        imageURL: URL? = nil,
        isSelected: Binding<Bool> = .constant(false)
    ) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
        self._isSelected = isSelected
    }
    
    public var body: some View {
        VStack {
            AsyncImage(url: imageURL, content: { image in
                image.resizable()
            }, placeholder: {
                Image("pokeball", bundle: .module)
            })
                .scaledToFit()
            
            VStack(alignment: .leading) {
                Text(title)
                    .font(.headline)
                    .foregroundColor(.primary)
                
                Text(subtitle)
                    .font(.subheadline)
                    .foregroundColor(.secondary)
            }
            .padding()
        }
        .background(Color.white)
        .cornerRadius(10)
        .shadow(radius: 5)
        .overlay(
            RoundedRectangle(cornerRadius: 10)
                .stroke(isSelected ? Color.blue : Color.clear, lineWidth: 2)
               )
        .onTapGesture {
            isSelected.toggle()
        }
        .padding()
    }
}
#Preview {
    CardView(title: "Bulbasaur", subtitle: "Leaf", isSelected: .constant(false)).previewDisplayName("Card Without Selection")
}

#Preview {
    CardView(title: "Bulbasaur", subtitle: "Leaf", isSelected: .constant(true)).previewDisplayName("Card Selected")
}
