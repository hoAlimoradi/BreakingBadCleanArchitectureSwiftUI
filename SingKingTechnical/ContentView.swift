//
//  ContentView.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi  
//

import SwiftUI
import CoreData
struct ContentView: View {
  
  @StateObject private var baseData = BaseViewModel()
  @StateObject private var networkMonitor = NetworkMonitor()
  
  var body: some View {
    ZStack {
      TabBar()
        .environmentObject(baseData)
      
      SidebarView(show: $baseData.showSideBar) {
        sidebarContent
          .frame(width: 2 * (UIScreen.main.bounds.width / 3))
          .frame(maxHeight: .infinity)
          .background(.white)
      }
    
       
        /*
         NetworkModalView(show: $networkMonitor.connected,
         message: networkMonitor.connectionDescription,
         symbol: networkMonitor.symbolName
       )
         */
    }
  }
}

extension ContentView {
  private var sidebarContent: some View {
    VStack(alignment: .leading) {
      HStack(spacing: 8) {
        Image.logo
          .resizable()
          .frame(width: 30, height: 30)
          .scaledToFit()
        
        Text("Hosien Alimoradi")
              .font(.title3)
           .fontWeight(.medium)
      }
      
      Spacer()
      
      // links
      VStack(spacing: 4) {
          Text("iOS Developer")
             .font(.caption2)
             .fontWeight(.medium)
          Text("Android Developer")
             .font(.caption2)
             .fontWeight(.medium)
      }
      .font(.title2)
       
       
      Spacer()
 
    }
    .frame(maxWidth: .infinity)
    .padding(.top, 20)
  }
}

 

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView().environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
    }
}
