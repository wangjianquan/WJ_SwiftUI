//
//  FormView.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/16.
//  Copyright © 2019 wjq. All rights reserved.
//

import SwiftUI

struct FormView: View {
    
    @State private var showingAdvancedOptions = false
    @State private var enableLogging = false
    
    @State private var selectedColor = 0
    @State private var colors = ["Red", "Green", "Blue"]
    
    var strengths = ["Mild", "Medium", "Mature"]
    @State private var selectedStrength = 0
    
    @State private var revealDetails = false
    @State private var showingDetail = false
    
    var body: some View {
       
        Form {
            Picker(selection: $selectedColor, label: Text("Select a color"), content: /*@START_MENU_TOKEN@*/{
                ForEach(0 ..< colors.count) {
                    Text(self.colors[$0]).tag($0)
                }
            }/*@END_MENU_TOKEN@*/)
             //.pickerStyle(SegmentedPickerStyle())
             //.pickerStyle(WheelPickerStyle())


            
            Section {
                Toggle(isOn: $showingAdvancedOptions.animation(.easeInOut)) {
                    Text("Show advanced options")
                }
                if showingAdvancedOptions {
                    Toggle(isOn: $enableLogging) {
                        Text("Enable Logging")
                    }
                    if enableLogging {
                        ProgressView("Downloading…")
                    }
                }
                //disabled()修饰符来禁用其表单的任何部分甚至整个表单
                Section {
                    Button(action: {
                                    // activate theme!
                    }) {
                        Text("Save changes")
                    }.disabled(!enableLogging)
                }
            }
            Section {
                //DisclosureGroup视图: 隐藏和显示内容
                //和$showingAdvancedOptions比较
                DisclosureGroup("Show Terms", isExpanded: $revealDetails) {
                    Text("Long terms and conditions here long terms and conditions here long terms and conditions here long terms and conditions here long terms and conditions here long terms and conditions here.").background(Color.orange.opacity(0.5))
                }
                .padding()
//                Spacer()
            }
            Section {
                Button(action: {
                    print("Button tapped")
                }) {
                    Text("Welcome")
                        .frame(minWidth: 0, maxWidth: 200, minHeight: 0, maxHeight: 200)
                        .font(.largeTitle)
                }
                Text("Please log in")
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .background(Color.red)
            }


            // 切换iPad和iPhone模拟器查看该效果
            AdaptiveStack (spacing:5) {
                Text("Horizontal when there's lots of space")
                    .background(Color.red)
                Text("but")
                    .background(Color.yellow)
                Text("Vertical when space is restricted")
                    .background(Color.blue)
                    .edgesIgnoringSafeArea(.trailing)

            }
        }
        
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
