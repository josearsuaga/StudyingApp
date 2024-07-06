//
//  SwiftUIView.swift
//
//
//  Created by José Arsuaga Sotres on 05/07/24.
//

import SwiftUI

public struct CardView: View {
    var title: String
    var subtitle: String
    var imageURL: URL?
    
    public init(
        title: String,
        subtitle: String,
        imageURL: URL? = nil
    ) {
        self.title = title
        self.subtitle = subtitle
        self.imageURL = imageURL
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
        .padding()
    }
}
#Preview {
    CardView(title: "Bulbasaur", subtitle: "Leaf")
}
