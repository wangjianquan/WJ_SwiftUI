//
//  ImageTestView.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/12.
//  Copyright © 2019 wjq. All rights reserved.
//
/*
 .mask()                用于彼此掩盖视图的
 .blur(radius: 3.0)     高斯模糊
 .blendMode(.multiply)  视图融合在
 .colorMultiply()       为图像视图着色
 .saturation(0.5)       饱和度调整（0.0 - 1.0）
 .contrast(10)          动态调整视图的对比度
 
 
 如何使用matchedGeometryEffect（）将动画从一个视图同步到另一个视图
 
 */
import SwiftUI

struct ImageTestView: View {
    let colors = Gradient(colors: [.red, .yellow, .green, .blue, .purple])
//    let conic = RadialGradient(gradient: colors, center: .center, startRadius: 50, endRadius: 200)


    
    var body: some View {
        
        List{
            Section(header: Text("动态调整视图的对比度 .contrast(10)//0.0:不会产生对比度(纯灰色图像)，1.0:原始图像;>1.0都会增加对比度。")) {
                Image("full-english")
                    .resizable()
                    .contrast(10)
            }
            
            Section(header: Text("饱和度调整.saturation(0.5)// 0.0:全灰色;1.0原始颜色")) {
                Image("full-english")
                    .resizable()
                    .saturation(0.5)
            }
            
            Section(header: Text("视图着色")) {
                Image("full-english")
                    .resizable()
                    .colorMultiply(.red)
            }
            
            Section(header: Text("Image 融合(.blendMode())")){
                ZStack {
                    Image("full-english")
                        .resizable()
                    Image("turtlerock")
                        .resizable()
                        .frame(width: 150, height: 150)
                        .blendMode(.multiply)
                }
            }

            Section(header: Text("高斯模糊 (.blur())").blur(radius: 0.5)){
                Image("full-english")
                    .resizable()
                    .blur(radius: 5)
            }
            
            Section(header:Text("视图遮罩 .mask()")){
                Image("turtlerock")
                    .resizable()
                    .mask(Text("遮罩.mask()")
                            .font(Font.system(size: 80).weight(.regular))
                )
            }
            
            Section(header:Text("图像平铺 .resizable(resizingMode: .tile)")){
               Image("all-out-donuts-thumb")
                    .resizable(resizingMode: .tile)
            }
            
            Section(header:Text("平铺图像的一部分 .resizable(capInsets: )")){
               Image("super-sundae-thumb")
                .resizable(capInsets: EdgeInsets(top: 5, leading: 5, bottom: 5, trailing: 5), resizingMode: .tile)
                .aspectRatio(contentMode: .fill)
                .padding()
            }

            Section(header:Text("平铺图像的一部分 .resizable(capInsets: )")){
               Image(systemName: "cloud.heavyrain.fill")
                .foregroundColor(.blue)
                .font(.largeTitle)
            }

                        

            
//            Spacer()
        }
    }
}

struct ImageTestView_Previews: PreviewProvider {
    static var previews: some View {
        ImageTestView()
    }
}
