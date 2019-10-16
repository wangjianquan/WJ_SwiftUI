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
        }
    }
}

struct FormView_Previews: PreviewProvider {
    static var previews: some View {
        FormView()
    }
}
