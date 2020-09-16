//
//  LearningTransform.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/17.
//  Copyright © 2019 wjq. All rights reserved.
//

import SwiftUI
extension View {
    func animate(using animation: Animation = Animation.easeInOut(duration: 1), _ action: @escaping () -> Void) -> some View {
        return onAppear {
            withAnimation(animation) {
                action()
            }
        }
    }
}
extension View {
    func animateForever(using animation: Animation = Animation.easeInOut(duration: 1), autoreverses: Bool = false, _ action: @escaping () -> Void) -> some View {
        let repeated = animation.repeatForever(autoreverses: autoreverses)

        return onAppear {
            withAnimation(repeated) {
                action()
            }
        }
    }
}

struct LearningTransform: View {
    @State private var rotation = 0.0
    @State private var isFlipped = false
    @Namespace private var animation
    @State private var scale: CGFloat = 1
    @State private var angle: Double = 0
    @State private var borderThickness: CGFloat = 1
    
    var body: some View {
        VStack (spacing: 23) {
            
            Group {
                HStack {
                    //延迟动画
                    Rectangle()
                        .fill(Color.red)
                        .frame(width: 44, height: 44)
                        .rotationEffect(.degrees(rotation))
                        .animation(Animation.easeInOut(duration: 3).delay(1))
                        .onTapGesture {
                            self.rotation += 360
                        }
                    //视图出现后立即开始动画,则应使用onAppear()修饰符附加动画
                    Circle()
                        .scaleEffect(scale)
                        .animateForever(autoreverses: true) { self.scale = 0.5 }
                }.padding()
            }
            
            Group {
                Button(action: {
                    self.angle += 45
                    self.borderThickness += 1
                }) {
                    Text("Tap here")
                        .padding()
                        .border(Color.red, width: borderThickness)
                        .rotationEffect(.degrees(angle))
    //                    .animation(.easeIn)//.spring()
                        .animation(.interpolatingSpring(mass: 1, stiffness: 1, damping: 0.5, initialVelocity: 5))

                }
                Toggle(isOn: $isFlipped.animation(.spring())) {
                    Text("Toggle label")
                }
                Slider(value: $rotation, in: 0...360, step: 1.0)
                Text("Hacking with Swift")
                    .padding()
                    .overlay(RoundedRectangle(cornerRadius: 26).stroke(Color.yellow, lineWidth: 4))
                    .rotationEffect(.degrees(rotation), anchor: .leading)
    //                .rotationEffect(.radians(.pi/3))
                
                Text("EPISODE LLVM")
                    .font(.largeTitle)
                    .foregroundColor(.yellow)
                    .rotation3DEffect(.degrees(rotation), axis: (x: 10, y: 10, z: 0))
                
                //放大或缩小视图
                Text("缩放scaleEffect")
    //                .scaleEffect(1.5)//放大五倍
    //                .scaleEffect(x: 1, y: 5)
                    //为缩放指定锚点
                    .scaleEffect(2, anchor: .bottomTrailing)
                Text("Round Me")
                    .padding()
                    .background(Color.red)
                    .cornerRadius(25)
            }
            
            VStack {
                if isFlipped {
                    Circle()
                        .fill(Color.red)
                        .frame(width: 44, height: 44)
                        .matchedGeometryEffect(id: "Shape", in: animation)
                    Text("Taylor Swift – 1989")
                        .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                        .font(.headline)
                } else {
                    Text("Taylor Swift – 1989")
                        .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                        .font(.headline)
                    Circle()
                        .fill(Color.blue)
                        .frame(width: 44, height: 44)
                        .matchedGeometryEffect(id: "Shape", in: animation)
                }
            }
            .onTapGesture {
                withAnimation {
                    self.isFlipped.toggle()
                    
                }
                
            }
            
        }
        .accentColor(.orange)
    }
}
struct MatchedGeometryEffectView: View {
    @Namespace private var animation
    @State private var isZoomed = false

    var frame: CGFloat {
        isZoomed ? 300 : 44
    }

    var body: some View {
        VStack {
            Spacer()

            VStack {
                HStack {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(Color.blue)
                        .frame(width: frame, height: frame)
                        .padding(.top, isZoomed ? 20 : 0)

                    if isZoomed == false {
                        Text("Taylor Swift – 1989")
                            .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                            .font(.headline)
                        Spacer()
                    }
                }

                if isZoomed == true {
                    Text("Taylor Swift – 1989")
                        .matchedGeometryEffect(id: "AlbumTitle", in: animation)
                        .font(.headline)
                        .padding(.bottom, 60)
                    Spacer()
                }
            }
            .onTapGesture {
                withAnimation(.spring()) {
                    self.isZoomed.toggle()
                }
            }
            .padding()
            .frame(maxWidth: .infinity)
            .frame(height: isZoomed ? 400 : 60)
            .background(Color(white: 0.9))
        }.background(Color.red)
    }
}

struct LearningTransform_Previews: PreviewProvider {
    static var previews: some View {
        LearningTransform()
//        MatchedGeometryEffectView()
    }
}
