//
//  TabBar.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi.
//

import SwiftUI

/// Custom TabBar View
/// Container of the main views
struct TabBar: View {
  
  @EnvironmentObject private var baseData: BaseViewModel
  
  init() {
    // hide the default tab view
    UITabBar.appearance().isHidden = true
  }
  
  var body: some View {
    TabView(selection: $baseData.currentTab) {
      
      HomeView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.04))
        .tag(Tab.home)
      
      FavouritesView()
        .tag(Tab.heart)
      
      AllEndPointsView()
        .tag(Tab.clipboard)
      
      AboutView()
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.black.opacity(0.04))
        .tag(Tab.profile)
      
    }
    .overlay(customTabBar, alignment: .bottom)
  }
  
}

// MARK: - Components
extension TabBar {
  
  private var customTabBar: some View {
    HStack(spacing: 0) {
      TabButton(tab: .home)
      
      TabButton(tab: .heart)
        .offset(x: -10)
      
      // center curved button
      Button {
        //baseData.showBasket.toggle()
          //todo show giftcard view
      } label: {
        Image(systemName: "giftcard.fill")
          .resizable()
          .renderingMode(.template)
          .aspectRatio(contentMode: .fit)
          .frame(width: 26, height: 26)
          .foregroundColor(.white)
          .padding(18)
          .background(Color.theme.main)
          .clipShape(Circle())
          .shadow(color: .black.opacity(0.04), radius: 5, x: -5, y: -5)
          .overlay(
            Text("3")
              .font(.footnote)
              .foregroundColor(.white)
              .padding(12)
              .background(Color.theme.actionColor)
              .clipShape(Circle())
              .offset(x: 10,y: -10)
               
            , alignment: .topTrailing
          )
      }
      .offset(y: -30)
      .fullScreenCover(isPresented: $baseData.showDetail) {
        NavigationView {
          
            Text("")
            .background(Color.black.opacity(0.02))
            .navigationBarHidden(true)
        }
      }
      
      TabButton(tab: .clipboard)
        .offset(x: 10)
      
      TabButton(tab: .profile)
    }
    .withCurvedBackground()
    // hide when the details page is shown
    .offset(y: baseData.showDetail ? 200 : 0)
  }
  
  @ViewBuilder
  func TabButton(tab: Tab) -> some View {
    Button {
      withAnimation {
        baseData.currentTab = tab
      }
    } label: {
      Image(systemName: tab.rawValue)
        .resizable()
        .renderingMode(.template)
        .aspectRatio(contentMode: .fit)
        .frame(width: 25, height: 25)
        .foregroundColor(baseData.currentTab == tab ? .theme.main : .secondary.opacity(0.5))
        .frame(maxWidth: .infinity)
    }
    
  }
}

struct BaseView_Previews: PreviewProvider {
  static var previews: some View {
    TabBar()
      .environmentObject(BaseViewModel()) 
  }
}

