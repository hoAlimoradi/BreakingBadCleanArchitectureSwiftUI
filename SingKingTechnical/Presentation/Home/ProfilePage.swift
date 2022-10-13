//
//  ProfilePage.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi on 7/22/1401 AP.
//

import SwiftUI

 
struct ProfilePage : View {
    var character: Character
    
    @State var count = 0
    @State var height = UIScreen.main.bounds.height
    
    var body: some View{
        
        ZStack{
            
            Color("Color").edgesIgnoringSafeArea(.all)
            
            VStack(spacing: 0){
                
                //Image("breakingbadImage")
                CachedImage(withURL: character.imageURL, transition: .scale.combined(with: .opacity)) { state in
                    switch state {
                    case .empty:
                        ProgressView()
                            .background(.blue, in: RoundedRectangle(cornerRadius: 8, style: .continuous))
                        
                    case .success(let image):
                        image
                            .resizable()
                            .aspectRatio(contentMode: .fill)
                                
                        
                    case .failure:
                        Image(systemName: "photo.on.rectangle.angled")
                            .font(.largeTitle)
                            .foregroundColor(.white)
                        
                    @unknown default:
                        fatalError()
                    }
                }
                .frame(height: UIScreen.main.bounds.width)
                 
                
                ZStack(alignment: .topTrailing) {
                    VStack{
                        
                        HStack{
                            
                            VStack(alignment: .leading, spacing: 15) {
                                
                                Text("nickname:")
                                    .font(.caption)
                                    .foregroundColor(.gray)
                                    .padding(.top, 25)
                                
                                HStack{
                                    
                                    Text(character.nickName)
                                        .font(.title)
                                        .fontWeight(.bold)
                                        .foregroundColor(.black)
                                    
                                    Spacer()
                                    
                                }.padding(.top, 8)
                                 
                            }
                            
                            Spacer()
                        }
                        .padding(.top)
                        
                        
                        HStack(spacing: 18){
                            Button(action: {
                            }) {
                                VStack{
                                    Text("Status")
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 4)
                            }
                            .foregroundColor(.black)
                            Button(action: {
                            }) {
                                VStack{
                                    Text(character.status)
                                }
                                .padding()
                                .background(Color.white)
                                .cornerRadius(10)
                                .shadow(radius: 4)
                            }
                            .foregroundColor(.black)
                        }
                        .padding(.bottom, 40)
                        
                    }
                    .padding(.bottom, 40)
                    .padding(.horizontal,20)
                    .background(CustomShape().fill(Color.white))
                    .clipShape(Corners())
                    
                    VStack(spacing : 15){
                        Button(action: {
                        }) {
                            
                            Image(systemName: "plus.circle")
                                .foregroundColor(.gray)
                                .font(.title)
                        }
                        
                        Text("\(self.count)")
                        .foregroundColor(.yellow)
                        .padding(10)
                        .background(Color.black)
                        .clipShape(Circle())
                        
                        Button(action: {
                            
                            if self.count != 0{
                                
                                self.count -= 1
                            }
                            
                        }) {
                            
                            Image(systemName: "minus.circle")
                                .foregroundColor(.gray)
                                .font(.title)
                        }
                    }
                    .padding()
                    .background(Color.white)
                    .cornerRadius(10)
                    .shadow(radius: 4)
                    .padding(.trailing,25)
                    .offset(y: -55)
                }
                .zIndex(40)
                .offset(y: -40)
                .padding(.bottom, -40)
                
                HStack{
                    
                    VStack(alignment: .leading, spacing: 15) {
                        
                        Text(character.name)
                            .fontWeight(.bold)
                        
                        HStack(spacing : 18){
                            
                            VStack(spacing: 8){
                                
                                Text("betterCallSaulAppearance  count")
                                    .fontWeight(.bold)
                                
                                Text("\(character.betterCallSaulAppearance.count)")
                            }
                            
                            VStack(spacing: 8){
                                
                                Text("portrayed")
                                    .fontWeight(.bold)
                                
                                Text(character.portrayed)
                            }
                        }
                    }
                    .foregroundColor(.white)
                    .padding(.leading, 20)
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                        
                    }) {
                        
                        VStack{
                            
                            Text("More")
                                .fontWeight(.bold)
                            
                            
                        }
                        .foregroundColor(.white)
                        .padding(.horizontal, 25)
                        .padding(.vertical, 25)
                        .background(AppColorTheme().paleBlue)
                        .cornerRadius(15)
                        .shadow(radius: 4)
                    }
                    .padding(.trailing, 25)
                    .offset(y: -55)
                }
                .zIndex(40)
                .padding(.bottom, 10)
                
            }
            .edgesIgnoringSafeArea(.top)
            .animation(.default)
        }
    }
}
 
