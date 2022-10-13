//
//  FavouritesView.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi.
//


import SwiftUI
//
struct FavouritesView: View {
    
    @StateObject private var viewModel = SharedViewModel()
    var body: some View {
        NavigationView {
            List(viewModel.characters){ character in
                CharacterCell(character: character)
            }
            .navigationBarTitle("Liked")
        }
    }
}

struct CharacterCell : View {
    var character : Character
    var body: some View {
        NavigationLink(destination: ProfilePage(character: character)) {
            HStack{
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
                .frame(width: 50, height: 50)
                
                Text(character.name)
            }
        }
    }
}

//

struct CustomShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in

            path.move(to: CGPoint(x: 0, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height - 40))
            
        }
    }
}

struct Corners : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}
