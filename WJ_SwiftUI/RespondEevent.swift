//
//  RespondEevent.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/14.
//  Copyright © 2019 wjq. All rights reserved.
//

import SwiftUI

struct RespondEevent: View {
    
    @State private var rotation = 0.0
    @State private var showingSheet = false
    @State private var showingAlert = false
    @State private var showGreeting = true
    @State private var showDetails = false
    @State private var name: String = ""//有值时为默认文字， 为空字符串时是占位文字
    @State private var password: String = ""
    @State private var celsius: Double = 0
    var settings = UserSettings()

    let colors: [Color] = [.red,.gray,.green,.blue,.orange,.yellow,.pink,.purple,.primary,.secondary]
    @State private var selectedColor = 0
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    @State private var birthDate = Date()
    @State private var age = 18

    var body: some View {
        NavigationView {
            //SwiftUI中的所有容器都必须返回不超过十个视图
            //如果需要具有10个以上的视图body,则应该使用 Group
            List {
                Group {
                    Section(header: Text("控件: Toggle 对应 UIKit的UISwitch")) {
                        VStack(alignment: .leading, spacing: 2.0) {
                            Toggle(isOn: $showGreeting.animation(.spring())) {
                               Text("Show welcome message")
                            }
                            if showGreeting {
                               Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
                            }
                        }
                    }
                    
                    Section(header: Text("控件: Button")) {
                        VStack(alignment: .center, spacing: 2.0) {
                            Button(action: {
                                self.showDetails.toggle()
                            }) {
                                Text("Button name")
                                    .background(Color.red)
                                    .frame(width: 120, height: 45, alignment: .center)
                            }
                            .frame(width: 120, height: 45)
                            .background(Color.blue)
                            if showDetails {
                                Image("mexican-mocha")
                            }
                        }
                    }
                    
                    Section(header: Text("控件: TextField(明文),SecureField(密文)")) {
                        VStack (alignment: .leading, spacing: 5){
                        //如何从TextField读取文本
                            if !name.isEmpty {
                                Text("用户名: \(name)!")
//                                    .background(Color.yellow)
                            }
                            TextField("请输入手机号", text: $name)
                                .keyboardType(.phonePad)
                                .textFieldStyle(RoundedBorderTextFieldStyle())//添加边框
                            
                            Spacer()
                            
                            if !password.isEmpty {
                                Text("密码: \(password)")
                                    .background(Color.yellow)
                            }
                            SecureField("请输入密码", text: $password)
                                .textFieldStyle(RoundedBorderTextFieldStyle())
                            
                        }
                    }

                    Section(header: Text("控件: Slider")) {
                        //value：Double将其绑定到的内容。
                        //in：滑块的范围。
                        //step：移动滑块时要更改多少值。
                        Slider(value: $celsius, in: -100...100, step: 0.1)
                        Text("\(celsius) Celsius is \(celsius) Fahrenheit")
                    }

                    Section(header: Text("控件: Stepper")) {
                        Stepper("Enter your age", value: $age, in: 0...88)

                        Stepper("输入年龄", onIncrement: {
                            self.age += 1
                            print("Adding to age")
                        }, onDecrement: {
                            self.age -= 1
                            print("Subtracting from age")
                        })
                        Text("Your age is \(age)")
                    }
                }

                Group {
                    Section(header:Text("控件: Image")) {
                        NavigationLink(destination:ImageTestView()) {
                            Text("Image相关")
                        }.buttonStyle(PlainButtonStyle())
                    }

                    Section(header: Text("控件: Picker")) {
                         NavigationLink(destination:LearnPickerView()) {
                             Text("Picker")
                         }.buttonStyle(PlainButtonStyle())
                     }

                     Section(header:Text("GeometryReader 及labelsHidden()的使用")) {
                         NavigationLink(destination:GeometryReaderView()) {
                             Text("使用labelsHidden（）隐藏Picker，Stepper，Toggle等标签")
                         }.buttonStyle(PlainButtonStyle())
                     }

                     Section(header:Text("控件: Alert,ActionSheet")){
                         NavigationLink(destination: TestView()) {
                             Image("full-english-thumb")
                                     .renderingMode(.original)
                             Text("Alert,Action")
                                 .padding()//注意padding()的顺序
                                 .background(Color.black)
                                 .foregroundColor(.white)
                         }.buttonStyle(PlainButtonStyle())
                     }

                     Section(header:Text("DrawingView")) {
                         NavigationLink(destination:DrawingView()) {
                             Text("DrawingView")
                         }.buttonStyle(PlainButtonStyle())
                     }

                     Section(header:Text("Animation")) {
                         NavigationLink(destination:LearnAnimation()) {
                             Text("LearnAnimation")
                         }.buttonStyle(PlainButtonStyle())
                     }

                     Section(header:Text("Transform")) {
                         NavigationLink(destination:LearningTransform()) {
                             Text("LearningTransform")
                         }.buttonStyle(PlainButtonStyle())
                     }
                    Section(header:Text("VideoPlayer")) {
                        NavigationLink(destination:VideoView()) {
                            Text("VideoPlayer")
                        }.buttonStyle(PlainButtonStyle())
                    }
                    Section(header:Text("手势 GestureView" )) {
                        NavigationLink(destination:GestureView()) {
                            Text("GestureView")
                        }.buttonStyle(PlainButtonStyle())
                    }
                    Section(header:Text("环境对象使用" )) {
                        NavigationLink(destination:LearnEnvironmentObject().environmentObject(settings)) {
                            Text("GestureView")
                        }.buttonStyle(PlainButtonStyle())
                    }

                }
            }
            .navigationBarTitle("响应事件 @State", displayMode: .inline)
        }.onAppear {
        //viewDidAppear()
            print("RespondEevent appeared!")
        }.onDisappear {
        //viewDidDisappear()
            print("RespondEevent disappeared!")
        }
    }
}

struct RespondEevent_Previews: PreviewProvider {
    static var previews: some View {
        RespondEevent()
    }
}
