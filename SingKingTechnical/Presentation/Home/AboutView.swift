//
//  AboutView.swift
//  SingKingTechnical
//
//  Created by Hosein Alimoradi.
//

import SwiftUI

struct AboutView : View {
    
     
    @State var top = UIApplication.shared.windows.last?.safeAreaInsets.top
    
    
    @State var count = 0
    
    var body : some View{
        
        VStack(spacing: 0){
            Image("breakingbadImage")
                
                .resizable()
                .frame(height: UIScreen.main.bounds.width * (3/4))
                .edgesIgnoringSafeArea(.top)
                .overlay(
            
                    VStack{
                        
                        HStack(spacing: 12){
                            
                            Spacer()
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("download").renderingMode(.original)
                            }
                            
                            Button(action: {
                                
                            }) {
                                
                                Image("Wishlist").renderingMode(.original)
                            }
                            
                        }.padding()
                        
                        Spacer()
                    }
            
                )
           
            
            ScrollView(.vertical, showsIndicators: false) {
                
                VStack(alignment: .leading,spacing: 15){
                    
                    Text("Say My name").font(.title)
                    
                    Text("Heisenberg").foregroundColor(.green)
                    
                    Divider().padding(.vertical, 15)
                    
                    HStack{
                        
                        Image("rp1").renderingMode(.original)
                        
                        Text("Diana Organic Farm")
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Image("chat").renderingMode(.original)
                        }
                    }
                    
                    Text("Breaking Bad is an American crime drama television series created and produced by Vince Gilligan. Set and filmed in Albuquerque, New Mexico, the series follows Walter White (Bryan Cranston), an underpaid, overqualified, and dispirited high-school chemistry teacher who is struggling with a recent diagnosis of stage-three lung cancer. White turns to a life of crime and partners with a former student, Jesse Pinkman (Aaron Paul), to produce and distribute crystal meth to secure his family's financial future before he dies, while navigating the dangers of the criminal underworld...").foregroundColor(.gray)
                    
                    HStack{
                        
                        Text("Reviews (48)")
                        
                        Spacer()
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("More")
                            
                        }.foregroundColor(Color("Color"))
                        
                    }.padding(.vertical, 10)
                    
                    HStack{
                        
                        Image("rp2").renderingMode(.original)
                        
                        VStack(alignment: .leading, spacing: 6){
                            
                           HStack{
                                
                                Text("445")
                                Image(systemName: "star.fill").foregroundColor(.yellow)
                                
                            }
                            
                            Text("Oh NO NO:)")
                            Text("Among the show's co-stars are Anna Gunn and RJ Mitte as Walter's wife Skyler and son Walter Jr.....")
                        }
                        
                    }.padding()
                    .background(Color("Color1"))
                    .cornerRadius(12)
                    
                    HStack(spacing: 20){
                        
                        Spacer(minLength: 12)
                        
                        Button(action: {
                            
                            self.count += 1
                        }) {
                            
                            Image(systemName: "plus.circle").font(.largeTitle)
                            
                        }.foregroundColor(.green)
                        
                        Text("\(self.count)")
                        
                        Button(action: {
                            
                            if self.count != 0{
                                
                                self.count -= 1
                            }
                            
                        }) {
                            
                            Image(systemName: "minus.circle").font(.largeTitle)
                            
                        }.foregroundColor(.green)
                        
                        Button(action: {
                            
                        }) {
                            
                            Text("Export").padding()
                            
                        }.foregroundColor(.white)
                        .background(Color("Color"))
                        .cornerRadius(12)
                        
                        Spacer(minLength: 42)
                    }
                }
                
            }.padding()
            .overlay(
            
            
                VStack{
                    
                    HStack{
                        
                        Spacer()
                        
                        HStack{
                            
                            Text("4").foregroundColor(.white)
                            Image(systemName: "star.fill").foregroundColor(.yellow)
                            
                        }.padding()
                        .background(Color.green)
                        .cornerRadius(12)
                    }
                    .padding(.top,-20)
                    .padding(.trailing)
                        
                    
                    Spacer()
                }
            
            )
            .background(RoundedCorner().fill(Color.white))
            .padding(.top, -top! - 25)
                
            .navigationBarTitle("")
            .navigationBarHidden(true)
            .navigationBarBackButtonHidden(true)
        }
    }
}

struct RoundedCorner : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: [.topLeft,.topRight], cornerRadii: CGSize(width: 35, height: 35))
        
        return Path(path.cgPath)
    }
}
 


