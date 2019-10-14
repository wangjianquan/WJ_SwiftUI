//
//  RespondEevent.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/14.
//  Copyright © 2019 wjq. All rights reserved.
//

import SwiftUI

struct RespondEevent: View {
    
    @State private var showGreeting = true
    @State private var showDetails = false
    @State private var name: String = ""//有值时为默认文字， 为空字符串时是占位文字
    @State private var password: String = ""
    @State private var celsius: Double = 0
    var colors = ["Red", "Green", "Blue", "Tartan"]
    @State private var selectedColor = 0
    
    var body: some View {
          NavigationView {
            List {
                VStack (alignment: .leading, spacing: 2){
                    Toggle(isOn: $showGreeting) {
                       Text("Show welcome message")
                    }
                    if showGreeting {
                       Text(/*@START_MENU_TOKEN@*/"Hello World!"/*@END_MENU_TOKEN@*/)
                    }
                }
                
                VStack(alignment: .leading, spacing: 2) {
                    Button(action: {
                        self.showDetails.toggle()
                    }) {
                        Text("Login Button")
                            .background(Color.red)
                            .frame(width: 150, height: 45, alignment: .center)
                    }.background(Color.gray)
                    if showDetails {
                        Image("mexican-mocha")
                    }
                }
                
                NavigationLink(destination: Text("Detail view here")) {
                    Image("full-english-thumb")
                            .renderingMode(.original)
                }.buttonStyle(PlainButtonStyle())
                
                VStack {
                    HStack {
                         TextField("Enter your name", text: $name)
                            .background(Color.red)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                         Spacer()
                        if !name.isEmpty {
                             Text("Hello, \(name)!")
                                .background(Color.yellow)
                        }
                        
                    }.background(Color.blue)
                    
                    HStack {
                        SecureField("Enter a password", text: $password)
                            .textFieldStyle(RoundedBorderTextFieldStyle())
                        Text("You entered: \(password)")
                            .background(Color.yellow)
                        
                        
                    }.background(Color.blue)
                }
                VStack {
                    //value：Double将其绑定到的内容。
                    //in：滑块的范围。
                    //step：移动滑块时要更改多少值。
                    Slider(value: $celsius, in: -100...100, step: 0.1)
                    Text("\(celsius) Celsius is \(celsius * 9 / 5 + 32) Fahrenheit")
                }
                VStack {
                    Picker(selection: $selectedColor, label: Text("选择颜色")) {
                        ForEach (0 ..< colors.count) {
                            Text(self.colors[$0])
                        }
                    }
                    Text("You selected: \(colors[selectedColor])")
                }
            }
            .padding()
            .navigationBarTitle("响应事件 @State", displayMode: .inline)
        }
    }
}

struct RespondEevent_Previews: PreviewProvider {
    static var previews: some View {
        RespondEevent()
    }
}
