//
//  CustomTextView.swift
//  WJ_SwiftUI
//
//  Created by MacBook Pro on 2020/9/16.
//  Copyright © 2020 wjq. All rights reserved.
//

import SwiftUI

struct WJTextView: UIViewRepresentable {
    @Binding var text: String

    func makeUIView(context: Context) -> UITextView {
        return UITextView()
    }
    
    func updateUIView(_ uiView: UITextView, context: Context) {
        uiView.text = text
        uiView.font = UIFont.systemFont(ofSize: 15.0)
        uiView.showsVerticalScrollIndicator = true
        uiView.backgroundColor = .systemGroupedBackground
    }
    
}
struct CustomTextView: View {
    @State var text = ""
    var body: some View {
        Group {
            VStack {
                WJTextView(text: $text)
                    .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: 320)
            }
        }
       
    }
}

struct CustomTextView_Previews: PreviewProvider {
    static var previews: some View {
        CustomTextView()
    }
}
