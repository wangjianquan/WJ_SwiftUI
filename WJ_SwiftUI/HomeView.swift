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
    @State private var rotation = 0.0

    var body: some View {
        VStack {
            Text("Forecast: Sun")
                .font(.largeTitle)
                .foregroundColor(.white)
                .padding()
                .background(Color.red)
                .padding()
                .background(Color.orange)
                .padding()
                .background(Color.yellow)
            
            Slider(value: $rotation, in: 0...360, step: 1.0)
            Text("Up we go")
                .rotationEffect(.degrees(rotation))
                .rotationEffect(.degrees(rotation), anchor: .topLeading)

        }
       
        
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
