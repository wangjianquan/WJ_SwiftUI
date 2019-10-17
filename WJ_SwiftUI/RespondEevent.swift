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
            List {
                
                
                VStack (alignment: .leading, spacing: 2.0){
                    Toggle(isOn: $showGreeting.animation()) {
                       Text("Show welcome message")
                    }
                    if showGreeting {
                       Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
                    }
                }

                VStack(alignment: .leading, spacing: 2.0) {
                    Button(action: {
                        self.showDetails.toggle()
                    }) {
                        Text("Login Button")
                            .background(Color.red)
                            .frame(width: 120, height: 45, alignment: .bottomTrailing)
                    }
                    .frame(width: 120, height: 45)
                    .background(Color.gray)
                    if showDetails {
                        Image("mexican-mocha")
                    }
                }
                
                VStack {
                //value：Double将其绑定到的内容。
                //in：滑块的范围。
                //step：移动滑块时要更改多少值。
                    Slider(value: $celsius, in: -100...100, step: 0.1)
                    Text("\(celsius) Celsius is \(celsius * 9 / 5 + 32) Fahrenheit")
                }

                NavigationLink(destination: TestView()) {
                    Image("full-english-thumb")
                            .renderingMode(.original)
                    Text("Alert,Action")
                        .padding()//注意padding()的顺序
                        .background(Color.black)
                        .foregroundColor(.white)
                }.buttonStyle(PlainButtonStyle())
                
                
                VStack (spacing: 5){
                    TextField("Enter your name", text: $name)
                        .background(Color.red)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                     Spacer()
                    if !name.isEmpty {
                         Text("Hello, \(name)!")
                            .background(Color.yellow)
                    }
                    SecureField("Enter a password", text: $password)
                        .textFieldStyle(RoundedBorderTextFieldStyle())
                    Text("You entered: \(password)")
                        .background(Color.yellow)
                }

                VStack {
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
//
                Section(header: Text("Picker")) {
                    NavigationLink(destination:LearnPickerView()) {
                        Text("Picker")
                    }.buttonStyle(PlainButtonStyle())
                }
//
                Section(header:Text("GeometryReader 及labelsHidden()的使用")) {
                    NavigationLink(destination:GeometryReaderView()) {
                        Text("使用labelsHidden（）隐藏Picker，Stepper，Toggle等标签")
                    }.buttonStyle(PlainButtonStyle())
                }
               
                Section(header:Text("Image")) {
                    NavigationLink(destination:ImageTestView()) {
                        Text("Image相关")
                    }.buttonStyle(PlainButtonStyle())
                }
                
            }
            .navigationBarTitle("响应事件 @State", displayMode: .inline)
//          .navigationBari
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
