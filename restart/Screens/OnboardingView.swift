//
//  OnboardingView.swift
//  restart
//
//  Created by Ahmed Gomaa on 29/01/2024.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onBoarding") var isOnboardingView : Bool = true
    
    
    var body: some View {
        ZStack{
          Color("ColorBlue")
            .ignoresSafeArea(.all, edges: .all)
            
          VStack(spacing: 20) {
                Spacer()
                
                VStack(spacing: 0){
                    Text("Share")
                    .font(.system(size: 60))
                    .fontWeight(.heavy)
                    .foregroundColor(.white)
                    
                     Text("""
          It's not how much we give but
          how much love we put into giving.
          """)
                        .foregroundColor(.white)
                        .multilineTextAlignment(.center)
                        .font(.title3)
                        .fontWeight(.light)
                        .padding(.horizontal, 10)
                }
                
                ZStack {
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
              }
                
                Spacer()
                
                
                ZStack {
                    Text("Get Started")
                        .font(.title3)
                        .fontWeight(/*@START_MENU_TOKEN@*/.bold/*@END_MENU_TOKEN@*/)
                        .offset(x: 20)
                        .foregroundColor(.white)
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                    Capsule()
                        .fill(Color.white.opacity(0.2))
                        .padding(8)
                    
                    HStack {
                        ZStack {
                            Capsule()
                                .fill(Color.red)
                                .frame(width: 80)
                            
                          
                        }
                        
                        Spacer()
                    }
                    
                    HStack {
                        ZStack {
                            Circle()
                                .fill(Color("ColorRed") )
                            
                            Circle()
                                .fill(Color(.black.opacity(0.15) ))
                                .padding(8)
                            
                            Image(systemName: "chevron.right.2")
                                .foregroundColor(.white)
                                .font(.system(size: 24))
                                .fontWeight(.bold)
                            
                        }
                        .foregroundColor(.white)
                        .frame(width: 80, height: 80, alignment: .center)
                        .onTapGesture {
                            isOnboardingView = false
                        }
                        Spacer()
                    }
                    
                }
              
                .frame(height: 80, alignment: .center)
                .padding()
            }
        }
          
    }
}

#Preview {
    OnboardingView()
}
