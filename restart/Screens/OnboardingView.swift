//
//  OnboardingView.swift
//  restart
//
//  Created by Ahmed Gomaa on 29/01/2024.
//

import SwiftUI

struct OnboardingView: View {
    @AppStorage("onBoarding") var isOnboardingView : Bool = true
    
    @State private var buttonWidth : Double = UIScreen.main.bounds.width - 80
    @State private var buttonOffset : CGFloat  = 0
    @State private var isAnimated: Bool = false
    @State private var imageOffset: CGSize = .zero
    @State private var indicatorOpacity: Double = 1.0
    @State private var titleText : String = "Share."
    var body: some View {
        ZStack{
          Color("ColorBlue")
            .ignoresSafeArea(.all, edges: .all)
            
          VStack(spacing: 20) {
                Spacer()
                
                VStack(spacing: 0){
                    Text(titleText)
                        .font(.system(size: 60))
                        .fontWeight(.heavy)
                        .foregroundColor(.white)
                        .offset(y : isAnimated ? 0 :  -40)
                        .opacity( isAnimated ? 1 : 0 )
                        .animation(.easeOut(duration: 1) , value: isAnimated)
                        .id(titleText)
                        .transition(.opacity)
                    
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
                    CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.3, RepeatedAnimation: false)
                        .offset(x: imageOffset.width * -1)
                        .blur(radius: abs(imageOffset.width / 5))
                        .animation(.easeOut(duration: 1), value: imageOffset)
                    
                    Image("character-1")
                        .resizable()
                        .scaledToFit()
                        .opacity(isAnimated ? 1 : 0 )
                        .animation(.easeOut(duration: 1), value: isAnimated)
                        .offset(x : imageOffset.width * 1.2 , y : 0)
                        .rotationEffect(.degrees(imageOffset.width / 20))
                        .gesture(
                            DragGesture()
                                .onChanged { gesture in
                                    
                                    if abs(imageOffset.width) <= 150 {
                                        imageOffset = gesture.translation
                                        
                                        withAnimation(.linear(duration: 0.25)) {
                                            indicatorOpacity = 0
                                            titleText = "Give."                                     }
                                        
                                    }
                                }
                                .onEnded {_ in
                                    imageOffset = .zero
                                    withAnimation(.linear(duration: 0.25)) {
                                        indicatorOpacity = 1
                                        titleText = "Share."
                                }
                                }
                        )
                        .animation(.easeOut(duration: 1), value: imageOffset)
              }
                .overlay(
                    Image(systemName: "arrow.left.and.right.circle")
                        .font(.system(size: 60, weight: .ultraLight))
                        .foregroundColor(.white)
                        .offset(y: 20)
                        .opacity(indicatorOpacity)
                        .animation(.easeOut(duration: 1).delay(2), value: isAnimated ? 1 : 0)
                    , alignment: .bottom
                )
              
                
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
                        .offset(x: buttonOffset)
                        .gesture(
                            DragGesture()
                                .onChanged{ gesture in
                                    if gesture.translation.width > 0 && buttonOffset <= buttonWidth - 80 {
                                        buttonOffset = gesture.translation.width
                                    }
                                    
                                }
                                .onEnded { _ in
                                    withAnimation(Animation.easeOut(duration: 0.5)) {
                                        if buttonOffset > buttonWidth / 2 {
                                            buttonOffset = buttonWidth - 80
                                            isOnboardingView = false
                                        }
                                        else {
                                            buttonOffset = 0
                                        }
                                    }
                                }
                        )
                        Spacer()
                    }
                    
                }
              
                .frame(width: buttonWidth, height: 80, alignment: .center)
                .padding()
                .opacity(isAnimated ? 1 : 0 )
                .offset(y: isAnimated ? 0 :  40 )
                .animation(.easeOut(duration: 1) , value: isAnimated)
            }
        }
        .onAppear( perform: {
            isAnimated  = true
        })
    }
}

#Preview {
    OnboardingView()
}
