//
//  FavouritesView.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi.
//


import SwiftUI

struct FavouritesView: View {
  
  var body: some View {
    VStack {
        Image(systemName: "photo.on.rectangle.angled")
          .font(.largeTitle)
          .foregroundColor(.white)
          .padding()
          .background(.blue, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
        
    }
  }
}

struct FavouritesView_Previews: PreviewProvider {
  static var previews: some View {
    FavouritesView()
  }
}

