//
//  ScrollTestView.swift
//  WJ_SwiftUI
//
//  Created by MacBook Pro on 2020/9/8.
//  Copyright © 2020 wjq. All rights reserved.
//

import SwiftUI

struct ScrollTestView: View {
    let colors: [Color] = [.red, .green, .blue]
    
    var body: some View {
        //1.滚动视图默认情况下是垂直滚动
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
        //2. .horizontal使之水平滚动，showsIndicators: 滚动条显示、隐藏
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 20) {
//                ForEach(0..<10) {
//                    Text("Item \($0)")
//                        .foregroundColor(.white)
//                        .font(.largeTitle)
//                        .frame(width: 200, height: 200)
//                        .background(Color.red)
//                }
//            }
//            .padding()
//            .background(Color.blue)
//        }
        //3. 3D旋转
//        ScrollView(.horizontal, showsIndicators: false) {
//            HStack(spacing: 5) {
//                ForEach(1..<10) { num in
//                    ZStack (alignment: .bottomTrailing) {
//                        GeometryReader { geo in
//                            Image("full-english")
//                                .resizable()
////                                .frame(width: geo.size.width,height:200)
//                                .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX) / 8), axis: (x: 0, y: 1, z: 0))
//                                .rotation3DEffect(.degrees(-Double(geo.size.height / 20) / 20), axis: (x: 0, y: 1, z: 0))
//
////                            .rotation3DEffect(.degrees(Double(geo.size.height / 20)), axis: (x: 1, y: 0, z: 0))
//
//                            Text("Number \(num)")
//                                .font(.largeTitle)
//                                .fontWeight(.bold)
//                                .background(Color.black.opacity(0.5))
//                                .foregroundColor(.white)
//                                .multilineTextAlignment(.trailing) //文字对齐方式
//                                .offset(x: 5, y: 25)
//                                .frame(width: geo.size.width)
////                                .rotation3DEffect(.degrees(-Double(geo.frame(in: .global).minX) / 8), axis: (x: 0, y: 1, z: 0))
//                        }
//                    }
//                    .frame(width: 375,height:200)
////                    .background(Color.gray)
//                }
//            }
//            .padding()
////            .frame(height:200)
//            .background(Color.green)
//        }
//        ScrollView(.vertical, showsIndicators: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/, content: {
//            if #available(iOS 14.0, *) {
//                ScrollViewReader(content: { proxy in
//                    Button("jump to #8") {
////                        proxy.scrollTo(8)
//                        proxy.scrollTo(8, anchor: .top)
//                    }
//                    ForEach(0..<10) { i in
//                        Text("Example \(i)").frame(width: 100, height: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/)
//                            .background(colors[i % colors.count])
//                            .id(i)
//                    }
//                })
//            } else {
//            }
//        })
        ScrollView {
            LazyVStack( content: {
                ForEach(1...1000, id: \.self) { count in
                    Text("Placeholder \(count)")
                        .padding()
                        .background(Color.red)

                }
//                ForEach(1...1000, id: \.self, content: SampleRow.init)

            })
        }
    }
}
struct SampleRow: View {
    let id: Int

    var body: some View {
        Text("Row \(id)")
            .background(Color.red)
            .padding()
    }
    init(id: Int) {
        print("Loading row \(id)")
        self.id = id
    }
}
struct ScrollTestView_Previews: PreviewProvider {
    static var previews: some View {
        ScrollTestView()
    }
}
