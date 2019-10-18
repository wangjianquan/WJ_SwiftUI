//
//  LearnAnimation.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/18.
//  Copyright © 2019 wjq. All rights reserved.
//

import SwiftUI

extension AnyTransition {
    static var moveAndScale: AnyTransition {
        AnyTransition.move(edge: .bottom).combined(with: .scale)
    }
    
    static var moveTopScale: AnyTransition {
        AnyTransition.move(edge: .top).combined(with: .scale)
    }
}

struct LearnAnimation: View {
    @State private var scale           : CGFloat = 1
    @State private var angle           : Double  = 0
    @State private var springAngle     : Double  = 0
    @State private var borderThickness : CGFloat = 1
    @State private var showingWelcome            = false
    @State private var opacity                   = 1.0
    @State private var showDetails               = false

    var body: some View {
        VStack (spacing:15) {
            Toggle(isOn: $showingWelcome.animation(.spring())) {
                Text("Toggle label")
            }
            if showingWelcome {
                Text("Hello World")
            }
            
            Button(action: {
                self.scale += 1
            }) {
                Text("Tap here")
                    .scaleEffect(scale)
                    .animation(.easeIn(duration: 3))
            }

            Button(action: {
                self.angle += 45
                self.borderThickness += 1
            }) {
                Text("Tap here")
                    .padding()
                    .border(Color.red, width: borderThickness)
                    .rotationEffect(.degrees(angle))
                    .animation(.easeIn)
            }

            Button(action: {
                self.springAngle += 45
            }) {
                Text("spring animation")
                    .padding()
                    .rotationEffect(.degrees(springAngle))
                    .animation(.interpolatingSpring(mass: 1, stiffness: 1, damping: 0.5, initialVelocity: 5))
            }
            Button(action: {
                withAnimation(.linear(duration: 3)) {
                    self.opacity -= 0.2
                }
            }) {
                Text("Tap here")
                    .padding()
                    .opacity(opacity)
            }
            
            Button(action: {
                withAnimation {
                    self.showDetails.toggle()
                }
            }) {
                Text("Tap to show details")
            }
            if showDetails {
                Text("Details go here.")
//                    .transition(.move(edge: .leading))
//                    .transition(.slide)
//                    .transition(.scale)
                    //使用.combined(with:)方法组合过渡以制作新的动画样式
//                    .transition(AnyTransition.opacity.combined(with: .slide))
                    .transition(.moveAndScale)//moveTopScale
//                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .bottom)))
            }
            
            
            Spacer()
        }.padding()
    }
}

struct LearnAnimation_Previews: PreviewProvider {
    static var previews: some View {
        LearnAnimation()
    }
}
