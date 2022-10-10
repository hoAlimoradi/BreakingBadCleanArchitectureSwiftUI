//
//  NetworkModalView.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi.
//

import SwiftUI

struct NetworkModalView: View {
    @Binding var show: Bool

    var message: String
    var symbol: String
    
   
   init(show: Binding<Bool>,
        message: String,
        symbol: String ) {
     self._show = show
       self.message = message
       self.symbol = symbol
   }
  var body: some View {
    HStack(spacing: 20) {
      Image(systemName: symbol)
        .font(.largeTitle)
      
      Text(message)
        .font(.callout)
    }
    .padding(.vertical, 60)
    .padding(.horizontal, 60)
    .overlay(alignment: .topTrailing) {
      Button {
      } label: {
        Image(systemName: "xmark")
          .foregroundColor(.primary)
          .padding()
      }

    }
    .background(.ultraThinMaterial)
    .clipShape(RoundedRectangle(cornerRadius: 12, style: .continuous))
  }
}

//struct NetworkModalView_Previews: PreviewProvider {
//  static var previews: some View {
//    NetworkModalView(
//      message: "It looks like you don't have internet connection",
//      symbol: "wifi.slash"
//    )
//  }
//}
