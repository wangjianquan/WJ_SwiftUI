//
//  ContentView.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/12.
//  Copyright © 2019 wjq. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
            NavigationView {
                List {
                    Text("用‘+’实现文本拼接：")
                    +
                    Text("SwiftUI  ")
                        .font(.largeTitle)//标题样式
                        .foregroundColor(.orange)
                        .kerning(1)//字符间距
                        .baselineOffset(10)
                        .strikethrough(true, color: .red)
                    +
                    Text("is  ")
                        .font(.subheadline)
                        .fontWeight(.black)

                        .foregroundColor(.blue)
                        .underline(true, color: .red)
                        .tracking(1)
                    +
                    Text("awesome")
                        .font(.footnote)
                        .foregroundColor(.red)
    //                Spacer()
                }
                .navigationBarTitle("Menu", displayMode: NavigationBarItem.TitleDisplayMode.automatic)
            }
           
            
            
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
