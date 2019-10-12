//
//  ImageTestView.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/12.
//  Copyright © 2019 wjq. All rights reserved.
//

import SwiftUI

struct ImageTestView: View {
    let colors = Gradient(colors: [.red, .yellow, .green, .blue, .purple])
//    let conic = RadialGradient(gradient: colors, center: .center, startRadius: 50, endRadius: 200)

    var body: some View {
        
        List{
            
            Image("turtlerock")
            Image("all-out-donuts-thumb")
                //图像平铺
                .resizable(resizingMode: .tile)

            Image("super-sundae-thumb")
                //平铺图像的一部分
                .resizable(capInsets: EdgeInsets(top: 20, leading: 10, bottom: 10, trailing: 20), resizingMode: .tile)

                .aspectRatio(contentMode: .fill)
                .padding()
            Image(systemName: "cloud.heavyrain.fill")
                .foregroundColor(.blue)
                .font(.largeTitle)
            
            Rectangle()
                .fill(Color.red)
                .frame(width: 80, height: 80, alignment: .center)
            Circle()
                .fill(Color.blue)
                .frame(width: 50, height: 50)
//            Spacer()
        }
    }
}

struct ImageTestView_Previews: PreviewProvider {
    static var previews: some View {
        ImageTestView()
    }
}
