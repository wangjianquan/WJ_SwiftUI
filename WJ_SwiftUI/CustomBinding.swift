//
//  CustomBinding.swift
//  WJ_SwiftUI
//
//  Created by MacBook Pro on 2020/9/14.
//  Copyright © 2020 wjq. All rights reserved.
//
/*自定义绑定
 当使用@State属性包装器时，它代我们做了很多工作，以允许用户界面控件进行双向绑定。但是，我们也可以使用该Binding类型手动创建绑定，该类型可以随定制get和set闭包一起提供，以在读取或写入值时运行。

 例如，这将创建一个琐碎的绑定，该绑定仅充当另一个属性的传递：
 */

import SwiftUI

struct CustomBinding: View {
    @State private var username = ""
    
    @State private var firstToggle = false
    @State private var secondToggle = false
    
    var body: some View {
        let binding = Binding(
            get: { self.username },
            set: { self.username = $0 }
        )
        
        let firstBinding = Binding(
            get: {self.firstToggle},
            set: {
                self.firstToggle = $0
                if $0 == true {
                    self.secondToggle = false
                }
            }
        )
        let secondBinding = Binding(
            get: { self.secondToggle },
            set: {
                self.secondToggle = $0

                if $0 == true {
                    self.firstToggle = false
                }
            }
        )
        return VStack {
            TextField("Enter your name", text: binding)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            Toggle(isOn: firstBinding, label: {
                Text("First toggle")
            })
            Toggle(isOn: secondBinding, label: {
                Text("Second toggle")
            })
        }.padding()
    }
}

struct CustomBinding_Previews: PreviewProvider {
    static var previews: some View {
        CustomBinding()
    }
}
