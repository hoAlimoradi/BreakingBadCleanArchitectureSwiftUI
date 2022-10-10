//
//  Navbar.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi.
//

import SwiftUI

struct Navbar: View {
  
  @EnvironmentObject private var baseData: BaseViewModel
  
  var body: some View {
    HStack {
      
      Button {
        withAnimation(.easeInOut) {
          baseData.showSideBar = true
        }
      } label: {
        menuButtonShape
      }
      .frame(width: 30, height: 25)
      
      
      Spacer()
      
      Button {
        
      } label: {
          Image("filter").renderingMode(.original)
      }
      
    }
    .foregroundColor(.black)
    .overlay(
      Image.logo
        .resizable()
        .frame(width: 30, height: 30)
        .scaledToFit()
    )
  }
}

extension Navbar {
  
  private var menuButtonShape: some View {
    
    VStack(alignment: .trailing, spacing: 4) {
      RoundedRectangle(cornerRadius: 2, style: .continuous)
        .frame(height: 3)
      
      RoundedRectangle(cornerRadius: 2, style: .continuous)
        .frame(height: 3)
      
      RoundedRectangle(cornerRadius: 2, style: .continuous)
        .frame(width: 16, height: 3)
    }
  }
}

struct Navbar_Previews: PreviewProvider {
  static var previews: some View {
    Navbar()
      .previewLayout(.sizeThatFits)
      .environmentObject(BaseViewModel())
  }
}

