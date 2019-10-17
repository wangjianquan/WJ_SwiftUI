//
//  TextTestView.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/12.
//  Copyright © 2019 wjq. All rights reserved.
//

import SwiftUI

struct TextTestView: View {
   /*
      *
        .font(.system(size: 16))    //字体
        .fontWeight(.bold)          //加粗
        .background(Color.black)    //Text的背景颜色
        .foregroundColor(.red)      //文字颜色
        .lineLimit(3)               //文字行数（默认为0）
        .lineSpacing(10)            //文字行间距
        .kerning(1)                 //字符间距
        .truncationMode(.middle)    //多文字单行显示时，省略号位置
        .multilineTextAlignment(.center)  //文字对齐方式
        .underline()                        //文本下划线
        .strikethrough(true, color: .red)   //横线
        //文本视图的渐变背景
        .background(LinearGradient(gradient: Gradient(colors: [.blue,.green]), startPoint: .topLeading, endPoint: .bottomTrailing))
    
        渐变：
            1: LinearGradient 线性渐变
            2. RadialGradient 圆心渐变
            3. AngularGradient 圆锥渐变
     */
    
    
    static let taskDateFormat : DateFormatter = {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }()
    var dueDate = Date()
    var colors:[Color] = [.gray,.red,.green,.blue,.orange,.yellow,.pink,.purple,.primary,.secondary]

    var body: some View {
        NavigationView{
            List {
                
                
            Text("默认情况下，文本视图会根据需要自动换行，但是如果您希望限制它们可以使用的行数，则应添加lineLimit修饰符")
                    .font(.system(size: 17))
                    .fontWeight(.bold)
                    .background(LinearGradient(gradient: Gradient(colors: [.blue, .green]), startPoint: .topLeading, endPoint: .bottomTrailing))
                    .foregroundColor(.white)
                    .lineLimit(3)
                    .lineSpacing(10)
                    .multilineTextAlignment(.center)
                
                Text("This is an extremely long textbstring that will never fit even the widest of Phones")
                    .lineLimit(1)
                    .truncationMode(.middle)
                    .background(Color.purple)


                Text("This is an extremely long text string that will never fit even the widest of Phones")
                    .underline(true, color: .white)
                    .kerning(1)
                    .multilineTextAlignment(.center)
                    .background(RadialGradient(gradient: Gradient(colors: colors), center: .center, startRadius: 20, endRadius: 100))

                
                Text("Task due date: \(dueDate, formatter: Self.taskDateFormat)")
                    .padding()
                    .font(.title)
                    //文本视图的渐变背景
                    .background(AngularGradient(gradient: Gradient(colors: colors),center: .center, startAngle: .zero, endAngle: .degrees(360)))
                
                Text("Hacking with Swift")
                    .font(.largeTitle)
                    .background(
                        Image("turtlerock")
                            .resizable()
                            .frame(width: 100, height: 100))
                            .clipped()
                
                Text("Hacking with Swift")
                    .font(.largeTitle)
                    .background(Circle()
                        .fill(Color.red)
                        .frame(width: 200, height: 200))
                        .clipped()
                                
                Text("用‘+’实现文本拼接：")
                +
                Text("SwiftUI  ")
                    .font(.largeTitle)//标题样式
                    .foregroundColor(.orange)
                    .kerning(1)//字符间距
                    .baselineOffset(10)
                    .underline()
                    .strikethrough(true, color: .red)
                +
                Text("is  ")
                    .font(.title)
                    .fontWeight(.black)
                    .foregroundColor(.blue)
                    .underline(true, color: .red)
                    .strikethrough()
                    .tracking(1)
                +
                Text("awesome")
                    .font(.footnote)
                    .foregroundColor(.red)
                    
                HStack {
                    Text("border")
                        .padding()
                        .border(Color.red, width: 4)
                    Text("圆角")
                        .padding()
                        .overlay(
                            RoundedRectangle(cornerRadius: 16)
                                .stroke(Color.blue, lineWidth: 4)
                        )
                    Text("阴影1")
                        .padding()
                        .shadow(color: .red, radius: 5, x: 20, y: 10)
                        .border(Color.red, width: 4)
                    Text("阴影2")
                        .padding()
                        .border(Color.red, width: 4)
                        .shadow(color: .red, radius: 5, x: 20, y: 10)
                }
                
                HStack {
                    Button(action: {
                        print("Button tapped")
                    }) {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.white)
                            .padding()
                            .background(Color.green)
                            .clipShape(Circle())
                    }
                    Button(action: {
                        print("Button tapped")
                    }) {
                        Image(systemName: "bolt.fill")
                            .foregroundColor(.white)
                            .padding(EdgeInsets(top: 10, leading: 20, bottom: 10, trailing: 20))
                            .background(Color.green)
                            .clipShape(Capsule())
                    }
                }
                                                
                HStack {
                    Text(".cornerRadius, .opacity")
                        .padding()
                        .background(Color.red)
                        .cornerRadius(25)
                        .opacity(0.5)
                    
                    Text("高斯模糊 .blur")
                        .blur(radius: 2)
                }

            }
                
            .navigationBarTitle("Text相关", displayMode: .inline)
        }
        
    }
}

struct TextTestView_Previews: PreviewProvider {
    static var previews: some View {
        TextTestView()
    }
}
