//
//  TextTestView.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/12.
//  Copyright © 2019 wjq. All rights reserved.
//

import SwiftUI

//自定义修饰符 (可以用于导航文字或一级/二级固定标题)
struct PrimaryLabel: ViewModifier {
    func body(content: Content) -> some View {
        content
            .padding()
            .background(Color.red)
            .foregroundColor(Color.white)
            .font(.largeTitle)
    }
}

struct TextTestView: View {
   /*
      *
        .font(.system(size: 16))            //字体
        .blur(radius: 2)                    //高斯模糊
        .clipped()                          //裁剪
        .opacity(0.8)                       //透明度
        .underline()                        //文本下划线
        .kerning(1)                         //字符间距
        .lineLimit(3)                       //文字行数（默认为0）
        .fontWeight(.bold)                  //加粗
        .lineSpacing(10)                    //文字行间距
        .truncationMode(.middle)            //多文字单行显示时，省略号位置
        .background(Color.black)            //Text的背景颜色
        .foregroundColor(.red)               //文字颜色
        .multilineTextAlignment(.center) //文字对齐方式
        .strikethrough(true, color: .red) //横线
        .clipShape(Capsule())   //圆角
        .cornerRadius(25)       //圆角: 任意大小的圆角
        .contextMenu{}          //菜单项（长按）可以添加任何SwiftUI视图，此处仅以Text控件为例
        //文本视图的渐变背景
        .background(LinearGradient(gradient: Gradient(colors: [.blue,.green]), startPoint: .topLeading, endPoint: .bottomTrailing))
    
        渐变：由于三种渐变类型均符合ShapeStyle协议，因此可以将它们用于背景，填充和笔触。
            1: LinearGradient 线性渐变
            2. RadialGradient 圆心渐变
            3. AngularGradient 圆锥渐变
     
     //检测用户鼠标是否悬停在某个视图上
     修饰符：onHover()和hoverEffect()
     onHover允许您跟踪指针当前是否悬停在视图上方，并传递一个反映该状态的布尔值。例如，根据指针是否悬停在文本上方，这将使某些文本变为红色或绿色：
     注意：在iPadOS simulator进行测试, 点击菜单（I/O -> "Input" > 'Send Cursor to Device').
     */
    
    //将视图存储为属性
    @State private var timeRemaining = 60
    @State private var timeName: String = "获取验证码"
    @State private var overText = false
    @State private var showingDetail = false
    @State private var phase: CGFloat = 0
    @State private var completionAmount: CGFloat = 0.0
    @State private var name = "Paul"
    @State private var profileText: String = "TextEditor用于处理多行滚动文本的视图。您可以设置字体，根据需要更改颜色，甚至调整行距以及可以创建多少行。"

    let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    let propertiesText = Text("propertiesText").font(.largeTitle)
    
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
                Group {

                    Text("Hello, SwiftUI")
                        .modifier(PrimaryLabel())
                    Text("EPISODE LLVM")
                        .font(.largeTitle)
                        .foregroundColor(.yellow)
                        .rotation3DEffect(.degrees(45), axis: (x: 1, y: 0, z: 0))
                    Text("文本视图默认会自动换行，限制行数则添加lineLimit修饰符")
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
                        .multilineTextAlignment(.center)
                        .background(RadialGradient(gradient: Gradient(colors: colors), center: .center, startRadius: 20, endRadius: 100))
                    
                    Text("Task due date: \(dueDate, formatter: Self.taskDateFormat)")
                        .padding()
                        .font(.title)
                        //文本视图的渐变背景
                        .background(AngularGradient(gradient: Gradient(colors: colors),center: .center, startAngle: .zero, endAngle: .degrees(360)))
                    
                    Text("Hacking with Swift")
                        .font(.largeTitle)
                        .background(Image("turtlerock").resizable().frame(width: 100, height: 100))
                        .clipped()
                    
                    Text("Hacking with Swift")
                        .font(.largeTitle)
                        .background(Circle().fill(Color.red).frame(width: 200, height: 200))
                        .clipped()
                    
                    //文本拼接
                    Text("用‘+’实现文本拼接：")
                    +
                    Text("SwiftUI  ")
                        .font(.largeTitle)//标题样式
                        .foregroundColor(.orange)
                        .tracking(10)//字符间距
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
                        .tracking(10)
                    +
                    Text("awesome")
                        .font(.footnote)
                        .foregroundColor(.red)
                        .kerning(10)//字符间距
                }
                
                Group {
                    Text("Hello ") + Text(Image(systemName: "star")) + Text(" World!")
                   (Text("Hello ") + Text(Image(systemName: "star")) + Text(" World!"))
                        .foregroundColor(.blue)
                        .font(.largeTitle)
                    Text("Hello ") + Text(Image(systemName: "star")) + Text(" World!")
                        .foregroundColor(.blue)
                        .font(.largeTitle)
                        Text("菜单项")
                            .foregroundColor(.blue)
                            .contextMenu {
                                
                                Button(action: {
                                    self.showingDetail.toggle()
                                }) {
                                    Text("Choose Country")
                                    Image(systemName: "globe")
                                }.sheet(isPresented: $showingDetail) {
                                    FormView()
                                }

                                Button(action: {
                                    // enable geolocation
                                }) {
                                    Text("Detect Location")
                                    Image(systemName: "location.circle")
                                }
                            }
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
                        Rectangle()
                            .strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10]))
                        Circle()
                            .fill(Color.blue)
                            .frame(width: 50, height: 50)
                        Circle()
                            .trim(from: 0, to: 0.5)
                            //trim()修饰符绘制笔画的一部分或填充形状，该修饰符采用两个参数：起始值和终止值，均存储为CGFloat0到1之间的值。
                            .frame(width: 50, height: 50)
                        Rectangle()
                            .fill(Color.red)
                            .frame(width: 66, height: 33)
                        Spacer()
                        Circle()
                            .trim(from: 0, to: completionAmount)
                            .stroke(Color.red, lineWidth: 5)
                            .frame(width: 40, height: 40)
                            .rotationEffect(.degrees(-90))
                            .onReceive(timer) { _ in
                                withAnimation {
                                    guard self.completionAmount < 1 else { return }
                                    self.completionAmount += 0.2
                                }}
                        
                    }
                    Rectangle()
                        .strokeBorder(style: StrokeStyle(lineWidth: 4, dash: [10], dashPhase: phase))
                        .frame(width: 200, height: 200)
                        .onAppear { self.phase -= 20 }
                        .animation(Animation.linear.repeatForever(autoreverses: false))
                    HStack {

                        Text(".cornerRadius, .opacity")
                            .padding()
                            .background(Color.red)
                            .cornerRadius(25)
                            .opacity(0.8)
                        Text("高斯模糊 .blur")
                            .background(Color.red)
                            .blur(radius: 1)

                    }
                }
                
                VStack {
                    //iOS 14的新功能

                    HStack {
                        Label("Your account", systemImage: "person.crop.circle")
                        Label("Your account", systemImage: "person.crop.circle")
                            .font(.title)
                    }
                    //将文本标记为占位符: redacted(reason:)
                    VStack {
                        Text("This is placeholder text")
                        Text("And so is this")
                    }.redacted(reason: .placeholder)
                    
                    //如果需要，可以为文本和图像提供完全自定义的视图，如下所示：
                    Label {
                        Text("Paul Hudson")
                            .foregroundColor(.primary)
                            .font(.largeTitle)
                            .padding()
                            .background(Color.gray.opacity(0.2))
                            .clipShape(Capsule())
                    } icon: {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.blue)
                            .frame(width: 64, height: 64)
                    }
                    Text(Date()...Date().addingTimeInterval(600))
                    //仅显示日期
                    Text(Date().addingTimeInterval(600), style: .date)//年月日
                    //只显示时间
                    Text(Date().addingTimeInterval(600), style: .time)//时分
                    //显示从现在开始的相对距离，并自动更新
                    Text(Date().addingTimeInterval(600), style: .relative)
                    //创建计时器样式，自动更新
                    Text(Date().addingTimeInterval(600), style: .timer)
                    
                    TextField("Shout your name at me", text: $name)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                        .textCase(.uppercase)//textCase()修饰符强制使用大写或小写文本。
                        .padding(.horizontal)
                    
//                    ZStack {
//                        ContainerRelativeShape()
//                            .inset(by: 4)
//                            .fill(Color.blue)
//                        Text("Hello, World!")
//                            .font(.headline)
//                    }
                    VStack{
                        Text("onHover")
                            .foregroundColor(overText ? Color.green : Color.red)
                            .font(.headline)
                            .onHover(perform: { hovering in
                                self.overText = hovering
                            })
                        Text("Tap me!")
                            .font(.largeTitle)
                            .hoverEffect(.automatic)//.lift, .highlight,.automatic
                            .onTapGesture {
                                print("Text tapped")
                            }
                        //多行文本
                        TextEditor(text: $profileText)
                            .border(Color.black, width: 1)
                            .cornerRadius(3.0)
                            .foregroundColor(.red)
                        
                        Button(action: {
                            

                        }, label: {
                            Text("\(timeRemaining)")
                                .foregroundColor(.primary)
//                                .font(.largeTitle)
                                .padding()
                                .clipShape(Capsule())
                                .background(Color.orange)
                        }).onReceive(timer, perform: { _ in
                            if self.timeRemaining > 0 {
                                self.timeRemaining -= 1
                            }
                        })
                        .clipShape(Capsule())
                        
//                        Text("获取验证码 \(timeRemaining)")
                        Text("\(timeName)")
                            .onReceive(timer, perform: { _ in
                                if self.timeRemaining > 0 {
                                    self.timeRemaining -= 1
                                    timeName = "获取验证码 \(timeRemaining)"
                                }else{
                                    timeName = "重新获取"
                                }
                        })
                    }

                }.padding()
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
