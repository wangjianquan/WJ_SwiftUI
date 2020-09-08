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
    
    var body: some View {
        Form {
            Section {
                Toggle(isOn: $showingAdvancedOptions.animation()) {
                    Text("Show advanced options")
                }
                if showingAdvancedOptions {
                    Toggle(isOn: $enableLogging) {
                        Text("Enable logging")
                    }
                }
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
