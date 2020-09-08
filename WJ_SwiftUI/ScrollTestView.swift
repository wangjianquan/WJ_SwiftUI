//
//  ScrollTestView.swift
//  WJ_SwiftUI
//
//  Created by MacBook Pro on 2020/9/8.
//  Copyright © 2020 wjq. All rights reserved.
//

import SwiftUI

struct ScrollTestView: View {
    var body: some View {
//        ScrollView {
//            VStack(alignment: .leading, spacing: 20) {
//                ForEach(0..<10) {
//                    Text("Item \($0)")
//                        .foregroundColor(.white)
//                        .font(.largeTitle)
//                        .frame(width: 200, height: 200)
//                        .background(Color.red)
//                }
//            }
//        }
        //滚动视图默认情况下是垂直的，但是您可以通过.horizontal作为第一个参数传入来控制轴。因此，我们可以将前面的示例翻转为水平，如下所示：
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 20) {
                ForEach(0..<10) {
                    Text("Item \($0)")
                        .foregroundColor(.white)
                        .font(.largeTitle)
                        .frame(width: 200, height: 200)
                        .background(Color.red)
                }
            }.padding()
        }
        
        
    }
}

struct ScrollTestView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollTestView()
    }
}
