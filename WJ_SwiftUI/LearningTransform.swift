//
//  LearningTransform.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/17.
//  Copyright © 2019 wjq. All rights reserved.
//

import SwiftUI

struct LearningTransform: View {
    @State private var rotation = 0.0
    var body: some View {
        VStack (spacing: 23) {
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
            
            Text("缩放scaleEffect")
//                .scaleEffect(1.5)//放大五倍
                //.scaleEffect(x: 1, y: 3.5)
                .scaleEffect(2, anchor: .bottomTrailing)

        }
    }
}

struct LearningTransform_Previews: PreviewProvider {
    static var previews: some View {
        LearningTransform()
    }
}
