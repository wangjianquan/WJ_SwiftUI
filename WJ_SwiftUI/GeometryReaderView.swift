//
//  GeometryReaderView.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/14.
//  Copyright © 2019 wjq. All rights reserved.
//如何使用GeometryReader提供相对大小
//GeometryReader在视图层次结构中没有考虑任何偏移或间距
//如何使用labelsHidden（）隐藏Picker，Stepper，Toggle等标签?
//提示：如果要隐藏所有标签，则可以将labelsHidden()修饰符应用于VStack或用作最外层容器的任何内容。
import SwiftUI

struct GeometryReaderView: View {
    
    @State private var selectedNumber = 2
    
    var body: some View {
        GeometryReader { geometry in
            VStack{
                Picker("Select a number", selection: self.$selectedNumber) {
                    ForEach(0..<10) {
                        Text("\($0)")
                    }
                }
                .labelsHidden()
                
                HStack(spacing: 0) {
                   Text("Left")
                    .frame(width: geometry.size.width / 2, height: geometry.size.height/2)
                       .background(Color.yellow)
                   Text("Right")
                       .frame(width: geometry.size.width / 2, height: 50)
                       .background(Color.orange)
               }
            }
       }
    }
}

struct GeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderView()
    }
}
