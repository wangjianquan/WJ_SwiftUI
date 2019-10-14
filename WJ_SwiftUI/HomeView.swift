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
        VStack (alignment: .leading){
            Picker(selection: $selectedColor, label: Text("请选择你喜欢的颜色")) {
                        ForEach (0 ..< colors.count) {
                            Text(self.colors[$0])
                        }
                    }
            HStack {
                Text("You selected : ")
                    .fontWeight(.bold)
                +
                Text("\(colors[selectedColor])")
                    .foregroundColor(.red)
            }
//            HStack {
//                
//            }
            Spacer()
        }.offset(x: 5, y: 0)
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
