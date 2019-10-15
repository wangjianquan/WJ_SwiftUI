//
//  HomeView.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/12.
//  Copyright © 2019 wjq. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    var colors = ["gray","red","green","blue","orange","yellow","pink","purple","primary","secondary"]

    @State private var selectedColor = 0
    
    var body: some View {
        VStack {
            Picker(selection: $selectedColor, label: Text("选择颜色")) {
                ForEach (0 ..< colors.count) {
                    Text(self.colors[$0])
                }
            }
            Text("You selected : \(colors[selectedColor])")
        }
        .padding()
//        .offset(x: 5, y: 0)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
