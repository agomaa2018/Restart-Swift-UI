//
//  Created by Robert Petras
//  Credo Academy ♥ Design and Code
//  https://credo.academy
//

import SwiftUI

struct CircleGroupView: View {
    // MARK: - PROPERTY
    
    @State var ShapeColor: Color
    @State var ShapeOpacity: Double
    @State private var isAnimating: Bool = false
    @State var RepeatedAnimation: Bool = false
    
    // MARK: - BODY
    
    var body: some View {
        ZStack {
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 40)
                .frame(width: 260, height: 260, alignment: .center)
            Circle()
                .stroke(ShapeColor.opacity(ShapeOpacity), lineWidth: 80)
                .frame(width: 260, height: 260, alignment: .center)
        } //: ZSTACK
        .blur(radius: isAnimating ? 0 : 10)
        .opacity(isAnimating ? 1 : 0)
        .scaleEffect(isAnimating ? 1 : 0.5)
        
        .animation (
            ShowAnimatedCircle()
            , value: isAnimating
        )
        
        .onAppear(perform: {
            DispatchQueue.main.asyncAfter(deadline: RepeatedAnimation ?  .now() + 3 : .now() , execute: {
                isAnimating = true
            })
        })
    }
    
    func ShowAnimatedCircle() -> Animation{
        if RepeatedAnimation {
            return   Animation.easeInOut(duration: 4)
                            .repeatForever()
        }
        else {
            return Animation.easeInOut(duration: 1)
        }
    }
    
    
}

// MARK: - PREVIEW

struct CircleGroupView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color("ColorBlue")
                .ignoresSafeArea(.all, edges: .all)
            
            CircleGroupView(ShapeColor: .white, ShapeOpacity: 0.2)
        }
    }
}
