//
//  LearnLazyGrid.swift
//  WJ_SwiftUI
//
//  Created by MacBook Pro on 2020/9/9.
//  Copyright © 2020 wjq. All rights reserved.
//

import SwiftUI

struct LearnLazyGrid: View {
    
    let data = (1...1000).map { "Item \($0)" }
    let columns = [GridItem(.adaptive(minimum: 80))]
    @State private var showingAlert = false

    var body: some View {
        ScrollView {
           
            LazyVGrid(columns: columns, spacing:20, content: /*@START_MENU_TOKEN@*/{
                ForEach(data, id: \.self) { (item) in
                    
                    Button(action: {
                        self.showingAlert = true
                    }, label: {
                        Text("Button \(item)")
//                            .font(.system(size: 16))
                            .padding(10)
                            .multilineTextAlignment(.center)
                    }).alert(isPresented: $showingAlert, content: {
                        Alert(title: Text("title"), message: Text("message"), primaryButton: Alert.Button.destructive(Text("default")), secondaryButton: .cancel())
                    }).background(Color.red)
                }
            }/*@END_MENU_TOKEN@*/)
        }
    }
}

struct LearnLazyGrid_Previews: PreviewProvider {
    static var previews: some View {
        LearnLazyGrid()
    }
}
