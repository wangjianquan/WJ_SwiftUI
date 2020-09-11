//
//  LearnLazyGrid.swift
//  WJ_SwiftUI
//
//  Created by MacBook Pro on 2020/9/9.
//  Copyright © 2020 wjq. All rights reserved.
//

import SwiftUI

struct LearnLazyGrid: View {
    
    let data = (1...1000).map { "Item \($0)" }
    //1. 使用GridItem(.adaptive(minimum: 80))网格每行尽可能地容纳尽可能多的项目，每个网格的最小大小为80点。
//    let columns = [GridItem(.adaptive(minimum: 80))]
    
    //2. 控制列数，可以改用.flexible()
//    let columns = [
//        GridItem(.flexible()),
//        GridItem(.flexible()),
//        GridItem(.flexible())
//    ]
    //3.使用固定大小。第一列的宽度恰好为100点，并允许第二列填充所有剩余空间：
    let columns = [
        GridItem(.fixed(100)),
        GridItem(.flexible()),
    ]
    
    
    @State private var showingAlert = false
    let items = 1...10
    let rows = [ GridItem(.fixed(200)),]
    
    var body: some View {
        //1.
//        ScrollView {
//            LazyVGrid(columns: columns, spacing:20, content: /*@START_MENU_TOKEN@*/{
//                ForEach(data, id: \.self) { (item) in
//
//                    Button(action: {
//                        self.showingAlert = true
//                    }, label: {
//                        Text("Button \(item)")
////                            .font(.system(size: 16))
//                            .padding(10)
//                            .multilineTextAlignment(.center)
//                    }).alert(isPresented: $showingAlert, content: {
//                        Alert(title: Text("title"), message: Text("message"), primaryButton: Alert.Button.destructive(Text("default")), secondaryButton: .cancel())
//                    }).background(Color.red)
//                }
//            }/*@END_MENU_TOKEN@*/)
//        }
        //2.
        ScrollView(.horizontal) {
            LazyHGrid(rows: rows, alignment: .center) {
                ForEach(1...10, id: \.self) { item in
                    Text("Heading\(item)").background(Color.red)
//                    Text(item)
                }
            }
        }

    }
}

struct LearnLazyGrid_Previews: PreviewProvider {
    static var previews: some View {
        LearnLazyGrid()
    }
}
