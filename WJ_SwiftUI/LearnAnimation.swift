//
//  LearnAnimation.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/18.
//  Copyright © 2019 wjq. All rights reserved.
//
/*
 SwiftUI允许我们在添加视图时指定一个过渡，而在删除视图时指定另一个过渡，所有asymmetric()过渡都使用过渡类型完成
 SwiftUI使用colorScheme环境键检测当前是否启用了暗模式或亮模式。如果使用声明@Environment，则可以在视图中引用它，并且在更改配色方案时将自动重新加载它们。
 */
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
    
    @State private var isEnabled = false
    @State private var fontSize: CGFloat = 32

    @Environment(\.accessibilityReduceMotion) var reduceMotion
    @Environment(\.colorScheme) var colorScheme

    var body: some View {
        VStack (spacing:15) {
            
            Group{
                Text("Hello, World!")
    //                .animatableFont(name: "Georgia", size: fontSize)
                    .animatableSystemFont(size: fontSize)
                    .onTapGesture {
                        withAnimation(Animation.spring(response: 0.5, dampingFraction: 0.5, blendDuration: 1).repeatForever()) {
                            self.fontSize = 100
                        }
                }
            }
            Group {
                Toggle(isOn: $showingWelcome.animation(.spring())) {
                    Text("Toggle label")
                }
                if showingWelcome {
                    Text("Hello World")
                }
            }
            
            Group {
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
                
                Button("Tap Me") {
                    self.isEnabled.toggle()
                }
                .foregroundColor(.white)
                .frame(width: 100, height: 50)
                .background(isEnabled ? Color.green : Color.red)
                .animation(nil)
                .clipShape(RoundedRectangle(cornerRadius: isEnabled ? 100 : 0))
                .animation(.default)
                
                Button(action: {
                    withAnimation {
                        self.showDetails.toggle()
                    }
                }) {
                    Text("Tap to show details")
                    Text(colorScheme == .dark ? "In dark mode" : "In light mode")

                }
                if showDetails {
                    Text("Details go here.")
    //                    .transition(.move(edge: .leading))
    //                    .transition(.slide)
    //                    .transition(.scale)
                        //使用.combined(with:)方法组合过渡以制作新的动画样式
    //                    .transition(AnyTransition.opacity.combined(with: .slide))
                        .transition(.moveAndScale)//moveTopScale
                    ///不对称过渡
    //                    .transition(.asymmetric(insertion: .move(edge: .leading), removal: .move(edge: .bottom)))
                }
                
                VStack {
                    Spacer()

                    Circle()
                        .frame(width: 20, height: 20)
                        .scaleEffect(scale)
                        .animation(reduceMotion ? nil : .spring(response: 1, dampingFraction: 0.1))

                    Spacer()

                    Button("Increase Scale") {
                        self.scale *= 1.5
                    }
                }
            }
            
            Spacer()
        }.padding()
    }
}
#if DEBUG
struct LearnAnimation_Previews: PreviewProvider {
    static var previews: some View {
        LearnAnimation()
//        CustomAnimateView()
//        Group {
//            LearnAnimation()
//                .environment(\.sizeCategory, .extraSmall)//查看带有超小文本的视图的外观
//            LearnAnimation()
//                .environment(\.colorScheme, .light)
//            LearnAnimation()
//                .environment(\.colorScheme, .dark)
//
//            LearnAnimation()
//                .environment(\.sizeCategory, .accessibilityExtraExtraExtraLarge)
//        }
    }
}
#endif


struct ScaledCircle: Shape {
    var animatableData: CGFloat
    
    func path(in rect: CGRect) -> Path {
        let maximumCircleRadius = sqrt(rect.width * rect.width + rect.height * rect.height)
        let circleRadius = maximumCircleRadius * animatableData

        let x = rect.midX - circleRadius / 2
        let y = rect.midY - circleRadius / 2

        let circleRect = CGRect(x: x, y: y, width: circleRadius, height: circleRadius)

        return Circle().path(in: circleRect)
    }
}

struct ClipShapeModifier<T: Shape>: ViewModifier {
    let shape: T

    func body(content: Content) -> some View {
        content.clipShape(shape)
    }
}

extension AnyTransition {
    static var iris: AnyTransition {
        .modifier(
            active: ClipShapeModifier(shape: ScaledCircle(animatableData: 0)),
            identity: ClipShapeModifier(shape: ScaledCircle(animatableData: 1))
        )
    }
}


struct CustomAnimateView: View {
    @State private var isShowingRed = false

    var body: some View {
        NavigationView {

            ZStack {
                Rectangle()
                    .fill(Color.blue)
                    .frame(width: 300, height: 300)

                if isShowingRed {
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 300, height: 300)
                        .transition(.iris)
                        .zIndex(1)
                }
            }
            .navigationBarItems(trailing: Button("Switch") {
                withAnimation(.easeInOut) {
                    self.isShowingRed.toggle()
                }
            })
        }
    }
}


struct AnimatableCustomFontModifier: AnimatableModifier {
    var name: String
    var size: CGFloat

    var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }

    func body(content: Content) -> some View {
        content
            .font(.custom(name, size: size))
    }
}
struct AnimatableSystemFontModifier: AnimatableModifier {
    var size: CGFloat
    var weight: Font.Weight
    var design: Font.Design

    var animatableData: CGFloat {
        get { size }
        set { size = newValue }
    }

    func body(content: Content) -> some View {
        content
            .font(.system(size: size, weight: weight, design: design))
    }
}
extension View {
    func animatableFont(name: String, size: CGFloat) -> some View {
        self.modifier(AnimatableCustomFontModifier(name: name, size: size))
    }
    func animatableSystemFont(size: CGFloat, weight: Font.Weight = .regular, design: Font.Design = .default) -> some View {
           self.modifier(AnimatableSystemFontModifier(size: size, weight: weight, design: design))
       }
}
