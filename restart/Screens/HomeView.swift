//
//  HomeView.swift
//  restart
//
//  Created by Ahmed Gomaa on 29/01/2024.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onBoarding") var isOnboardingView : Bool = false
    @State private var isAnimated: Bool = false
    
    
    var body: some View {
        VStack(spacing : 20) {
            Spacer()
                
            ZStack {
                CircleGroupView(ShapeColor: .blue, ShapeOpacity: 0.15, RepeatedAnimation: true)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                    .padding()
                    .offset(y: isAnimated ? 35 : -35 )
                    .animation(
                        Animation
                            .easeInOut(duration: 4)
                            .repeatForever()
                        , value: isAnimated
                    )
            }
            
            
            
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()

            Button( action: {
                withAnimation {
                    playSound(sound: "success", type: "m4a")
                    isOnboardingView = true
                }
            } ){
                Image(systemName: "arrow.triangle.2.circlepath.circle.fill")
                    .imageScale(.large)
                
                Text("Restart")
                    .font(.system(.title3, design: .rounded))
                    .fontWeight(.bold)
            }
            .buttonStyle(.borderedProminent)
            .buttonBorderShape(.capsule)
            .controlSize(.large)
        }
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: .now() + 3 , execute: {
                isAnimated = true
            })
        })
    }
}

#Preview {
    HomeView()
}
