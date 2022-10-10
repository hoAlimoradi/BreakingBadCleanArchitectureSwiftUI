//
//  HomeView.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi.
//

import SwiftUI

struct HomeView: View {
     
    @Namespace var animation
    @EnvironmentObject private var baseData: BaseViewModel
    @StateObject private var viewModel = HomeViewModel()
 
    @State private var showOptions = false
    @State var txt = ""
    @State var showingAlert = false
    
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
                .alert(isPresented: $showingAlert) {
                    Alert(title: Text("Important message"), message: Text("Wear sunscreen"), dismissButton: .default(Text("Got it!")))}
            
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
    
    private func listView() -> some View {
        
        ScrollView(.vertical, showsIndicators: false) {
            
            VStack(spacing: 15) {
                
                Navbar()
                HStack(spacing: 15){
                    
                    HStack{
                        
                        Image(systemName: "magnifyingglass").font(.body)
                        
                        TextField("Search Groceries", text: $txt)
                        
                    }.padding(10)
                    .background(Color("Color1"))
                    .cornerRadius(20)
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("mic").renderingMode(.original)
                    }
                }
                HStack {
                    
                    Text("All Characters")
                        .font(.title.bold())
                    
                    Spacer()
                    
                    Button {
                    } label: {
                        HStack(spacing: 3) {
                            Group {
                                switch viewModel.sortDescriptor {
                                case .default:
                                    Text("Sort by")
                                case .priceAscending:
                                    Text("Price ascending")
                                case .priceDescending:
                                    Text("Price descending")
                                }
                            }
                            .font(.caption.bold())
                            
                            Image(systemName: "chevron.down")
                                .rotationEffect(.degrees(showOptions ? 180 : 0))
                                .font(.caption.bold())
                        }
                        .foregroundColor(.secondary)
                    }
                }
                .padding(.top, 25)
                
                // MARK: - Custom Segment Tab - Character Filters
                ScrollView(.horizontal, showsIndicators: false) {
                    
                    HStack(spacing: 18) {
                        
                        // segment button - this will be product filters
                        ForEach(CharacterType.allCases, id: \.rawValue) { type in
                            SegmentButton(image: type.image, type: type)
                        }
                    }
                    .padding(.vertical)
                }
                
                // MARK: - Character View
                let columns = Array(repeating: GridItem(.flexible(), spacing: 15), count: 2)
                
                LazyVGrid(columns: columns, spacing: 18) {
                    
                    
                    ForEach(viewModel.characters) { character in
                        CardView(character: character)
                            .onTapGesture {
                                withAnimation {
                                    baseData.navigate(to: character)
                                }
                            }
                    }
                }
            }
            .padding()
            .padding(.bottom, 100)
        }
        
    }
}

extension HomeView {
   
    @ViewBuilder
    private func CardView(character: Character) -> some View {
        
        ZStack{
             
            VStack(spacing: 15) {
                Button {
                    
                } label: {
                    Image(systemName: "suit.heart.fill")
                        .font(.system(size: 13))
                        .foregroundColor(character.isLiked ? .white : .gray)
                        .padding(5)
                        .background(
                            Color.red.opacity(character.isLiked ? 1 : 0), in: Circle()
                        )
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                CachedImage(withURL: character.imageURL, transition: .scale.combined(with: .opacity)) { state in
                    switch state {
                    case .empty:
                        ProgressView()
                            .background(.blue, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                        
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fit)
                                .cornerRadius(10)
                        
                    case .failure:
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        
                    @unknown default:
                        fatalError()
                    }
                }
                .matchedGeometryEffect(id: character.id, in: animation)
                .frame(width: 140, height: 140)
                Text(character.name)
                    .fontWeight(.semibold)
                    .lineLimit(1)
                    .padding(.top, 8)
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                Text(character.portrayed)
                    .font(.caption.bold())
                    .frame(maxWidth: .infinity, alignment: .trailing)
                
                HStack(spacing: 3) {
                    ForEach(1...5, id: \.self) { index in
                        Image(systemName: "star.fill")
                            .font(.system(size: 9.5))
                            .foregroundColor(character.betterCallSaulAppearance.count >= index ? .yellow : .gray.opacity(0.6))
                    }
                    
                    Text("(\(character.nickName) )")
                        .font(.caption.bold())
                        .foregroundColor(.secondary)
                }
            }
            .padding()
            .background(Color.white, in: RoundedRectangle(cornerRadius: 12, style: .continuous))
            .onTapGesture {
                
                self.baseData.showDetail.toggle()
            }
            
        }
        
    }
    
    @ViewBuilder
    private func SegmentButton(image: Image, type: CharacterType) -> some View {
        
        Button {
            withAnimation {
                viewModel.selectedCharacterType = type
            }
            Task {
                
                //await viewModel.getAllCharacters()
            }
        } label: {
            
            HStack(spacing: 8) {
                image
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 27, height: 27)
                
                Text(type.rawValue)
                    .font(.system(size: 12.5))
                    .fontWeight(.bold)
                    .foregroundColor(.black)
                
            }
            .padding(.vertical, 8)
            .padding(.horizontal, 12)
            .background(
                ZStack {
                    // Transition Slider
                    if viewModel.selectedCharacterType == type {
                        RoundedRectangle(cornerRadius: 10, style: .continuous)
                            .fill(.white)
                            .matchedGeometryEffect(id: "TAB", in: animation)
                            .shadow(color: .black.opacity(0.05), radius: 5, x: 5, y: 5 )
                    }
                }
            )
        }
    }
    
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
            .environmentObject(BaseViewModel())
    }
}

