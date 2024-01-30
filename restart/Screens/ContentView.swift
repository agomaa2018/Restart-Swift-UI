//
//  ContentView.swift
//  restart
//
//  Created by Ahmed Gomaa on 29/01/2024.
//

import SwiftUI

struct ContentView: View {
@AppStorage("onBoarding") var isOnboardingView : Bool = true
    var body: some View {
        ZStack{
            if isOnboardingView {
                OnboardingView()
            }
            else {
                HomeView()
            }
        }
       
    }
}

#Preview {
    ContentView()
}
