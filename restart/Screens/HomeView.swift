//
//  HomeView.swift
//  restart
//
//  Created by Ahmed Gomaa on 29/01/2024.
//

import SwiftUI

struct HomeView: View {
    @AppStorage("onBoarding") var isOnboardingView : Bool = false
    
    
    var body: some View {
        VStack(spacing : 20) {
            Spacer()
                
            ZStack {
                CircleGroupView(ShapeColor: .blue, ShapeOpacity: 0.15)
                Image("character-2")
                    .resizable()
                    .scaledToFit()
                .padding()
            }
            
            
            
            Text("The time that leads to mastery is dependent on the intensity of our focus.")
                .font(.title3)
                .fontWeight(.light)
                .foregroundColor(.secondary)
                .multilineTextAlignment(.center)
                .padding()

            Button( action: {
                isOnboardingView = true
            
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
    }
}

#Preview {
    HomeView()
}
