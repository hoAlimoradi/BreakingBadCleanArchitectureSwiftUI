//
//  AllEndPointsView.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi on 7/19/1401 AP.
//

import SwiftUI

struct AllEndPointsView : View {
    
    @StateObject private var viewModel = AllEndPointsViewModel()
    @State var txt = ""
    private var content: some View {
        switch viewModel.state {
        case .idle:
            return AnyView(listView())
            
        case .fetching:
            return AnyView(listView().onAppear{
                Task {
                   // await viewModel.getAllCharacters()
                }
            })
            
        case .loading:
            return AnyView(loadingView())
             
            
        case .error :
            return AnyView(errorView())
            
            
        case .empty:
            return AnyView(emptyView())
            
        }
    }
    
    
    var body: some View {
        content
    }
    private func errorView() ->  some View {
        let view = VStack {
            Text(viewModel.error?.localizedDescription ?? "Error")
                .frame(width: 250, height: 150)
               
            
        }
        return view
    }
    
    private func emptyView() ->  some View {
        let view = VStack {
            Text("empty...")
                .frame(width: 100, height: 150)
            
            Image(systemName: "creditcard.trianglebadge.exclamationmark")
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
        }
        return view
    }
    
    private func loadingView() ->  some View {
        let view = VStack {
            Text("Loading...")
                .frame(width: 100, height: 150)
            
            Image(systemName: "creditcard.trianglebadge.exclamationmark")
                .resizable()
                .scaledToFit()
                .frame(width: 35, height: 35)
        }
        return view
    }
    
    private func listView() ->some View {
        VStack(spacing: 15){
            ScrollView(.vertical, showsIndicators: false) {
                VStack(spacing: 15){
                    Image("breakingbadImage")
                        .resizable()
                        .frame(height:  (UIScreen.main.bounds.width * (9/16) ) )
                        .overlay(
                        VStack{
                            Spacer()
                            HStack{
                                Text("breakingbadImage").font(.title).foregroundColor(.white)
                                Spacer()
                            }.padding()
                        })
                    //MARK: -- Episodes
                    HStack{
                        Text("Quotes").font(.title)
                        Spacer()
                        Button(action: {
                        }) {
                            Text("More")
                        }.foregroundColor(Color("Color"))
                    }.padding(.vertical, 15)
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 15){
                            ForEach(viewModel.quotes) { quote in
                                QuoteCardView(quote: quote)
                            }
                        }
                    }
                    EpisodesCardView(episodes: viewModel.episodes,
                                     deaths: viewModel.deaths)
                }
            }
            
        }.padding(.horizontal)
         
      
    }
}
extension AllEndPointsView {
    
    @ViewBuilder
    private func QuoteCardView(quote: Quote) -> some View {
        VStack{
            Text(quote.quote)
            Text("author: \(quote.author)")
        }.padding()
            .background(.yellow)
            .cornerRadius(15)
    }
    
}
    
 
struct EpisodesCardView : View {
    var episodes : [Episode]
    var deaths : [Death]
     
    var body : some View{
        VStack(spacing: 15){
            HStack{
                Text("Episodes").font(.title)
                Spacer()
                Button(action: {
                }) {
                    Text("More")
                }.foregroundColor(Color("Color"))
            }.padding(.vertical, 15)
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(spacing: 15){
                    ForEach(episodes) { episode in
                        EpisodesCardViewCellView(episode: episode)
                    }
                }
            }
            
            HStack{

                Text("Deaths").font(.title)
                
                Spacer()
                
                Button(action: {
                    
                }) {
                    Text("More")
                    
                }.foregroundColor(Color("Color"))
                
            }.padding(.vertical, 15)
            
            ScrollView(.horizontal, showsIndicators: false) {
                
                HStack(spacing: 15) {
                    ForEach(deaths){ death in
                        DeathsCellView(death: death)
                    }
                }
            }
            Spacer(minLength: 50).padding(.bottom)
        }
    }
}

struct EpisodesCardViewCellView : View {
    
    var episode : Episode
    @State var show = false
    
    var body : some View{
        VStack(spacing: 10){
            
            Text(episode.title)
            Text(episode.airDate).fontWeight(.semibold)
            Text(episode.season).foregroundColor(.green).fontWeight(.semibold)
            
        }.padding()
            .background(AppColorTheme().paleBlue)
            .cornerRadius(15)
    }
}

struct DeathsCellView : View {
    
    var death : Death
    
    var body : some View{
        
        VStack(spacing: 10){
            
            Text("id: \(death.id)")
            Text("death \(death.death)")
            Text("season \(death.season)"  )
            Text("numberOfDeaths \(death.numberOfDeaths)" ).foregroundColor(.green)

        }.padding()
            .background(AppColorTheme().palePink)
            .cornerRadius(15)
    }
}

 
