//
//  LayoutView.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/14.
//  Copyright © 2019 wjq. All rights reserved.
//  VStack和HStack

import SwiftUI

struct LayoutView: View {
    
    let colors: [Color] = [.red, .green, .blue]

    @Environment(\.horizontalSizeClass) var horizontalSizeClass: UserInterfaceSizeClass?
    
    var body: some View {
        
    //1.
        //对齐和间距
//        VStack (alignment: .leading, spacing: 8){
//            Text("SwiftUI")
//            Divider()//创建分割线
//            Text("rocks")
//            Divider()
//            Text("job")
//            HStack (alignment: .bottom, spacing: 5) {
//                Text("alignment: .bottom")
//                    .foregroundColor(Color.white)
//
//                Text("spacing: 10")
//                    .foregroundColor(Color.blue)
//            }.background(Color.red)
//        }
        
    //2.
        //使用padding()修饰符在视图周围设置单独的填充,如果不使用此参数，则是系统默认的填充，
        //填充位置 及 填充量
        //.padding(<#T##edges: Edge.Set##Edge.Set#>, <#T##length: CGFloat?##CGFloat?#>)
         
        //
//        VStack {
//            Text("SwiftUI")
//                .padding()
//            Text("rocks")
//                .padding(.trailing, 20)//
//                .background(Color.yellow)
//
//        }.background(LinearGradient(gradient: Gradient(colors: [.blue,.green]), startPoint: .leading, endPoint: .trailing))
        
    //3. Spacer的位置在Text视图的前、后效果不同（自试）
        //Spacer会自动分割所有剩余空间，这意味着如果您使用多个Spacer，则可以按不同数量分割空间。
//        VStack {
//            Spacer()
//            Spacer()
//            Text("Hello")
//            Spacer()
//            Text("World")
//        }.background(LinearGradient(gradient: Gradient(colors: [.blue,.green]), startPoint: .top, endPoint: .bottom))
    
    //4.
        //精确尺寸Spacer： Spacer().frame(height: 40)
        //两个文本视图，它们之间有一个40点的空格
//        VStack {
//            Text("First Label").background(Color.white)
//            Spacer()
////                .frame(height: 40)
//                .frame(minHeight: 50, maxHeight: 500)
//            Text("Second Label")
//        }.background(LinearGradient(gradient: Gradient(colors: [Color.red,.blue]), startPoint: .topLeading, endPoint: .bottomTrailing))
        
    //5. ZStack
        ZStack(alignment: .bottomLeading) {
            Image("turtlerock")
            Text("Hacking with Swift")
                .font(.footnote)
                .background(Color.black)
                .foregroundColor(.white)
                .offset(x: 5, y: -5)
        }
        
//        VStack {
//            Text("Home")
//            Text("Options")
//                .offset(y: 15)
//                .padding(.bottom, 15)
//            Text("Help")
//        }.background(Color.blue)
    //6.zIndex()
//注：该zIndex()修改只会影响绘制当前的ZStack。这意味着，如果您有两个重叠的堆栈，则需要考虑堆栈的Z索引以及堆栈内部的视图。
//        ZStack {
//            Rectangle()
//                .fill(Color.green)
//                .frame(width: 50, height: 150)
//                .zIndex(1)
//            Rectangle()
//                .fill(Color.red)
//                .frame(width: 100, height: 100)
//        }
    
    //7. 返回不同的视图,some View 需要明确的返回
        //7.1用Group,将输出包装在一个组中
//        Group {
//            if Bool.random() {
//                Text("Better luck next time")
//            } else {
//                Image("turtlerock")
//            }
//        }
        //7.2 用AnyView（会降低性能，最好使用Group）
//           if Bool.random() {
//               return AnyView(Image("turtlerock"))
//           }else {
//               return AnyView(Text("Better luck next time"))
//           }
        
    
//8.
//该.id(: \.self)部分是必需的，以便SwiftUI可以唯一地标识数组中的每个元素
//        VStack(alignment: .leading) {
//            ForEach((1...10).reversed(), id: \.self) {
//                Text("\($0)...")
//            }
//            Text("Ready or not, here I come!")
//            Spacer()
//                .frame(height: 15)
//            ForEach(colors, id: \.self) { color in
//                Text(color.description.capitalized)
//                    .padding()
//                    .foregroundColor(color)
//                    .background(Color.black)
//            }
//        }
        
        
    //9. compact regular
//        if horizontalSizeClass == .compact {
//            return Text("Compact")
//        } else {
//            return Text("Regular")
//        }
        
        
//10. 自定义视图frame
//        Button(action: {
//            print("Button tapped")
//        }) {
//            Text("Welcome")
//                .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 100)
//                .font(.largeTitle)
//                .background(Color.gray)
//        }
        

    }
}

struct LayoutView_Previews: PreviewProvider {
    static var previews: some View {
        LayoutView()
    }
}
