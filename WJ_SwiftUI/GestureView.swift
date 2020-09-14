//
//  GestureView.swift
//  WJ_SwiftUI
//
//  Created by MacBook Pro on 2020/9/14.
//  Copyright © 2020 wjq. All rights reserved.
//

import SwiftUI

struct GestureView: View {
    @State private var scale: CGFloat = 1.0

    var body: some View {
        
        LazyVStack {
            Text("TapGesture")
            Image("full-english")
                .scaleEffect(scale)
                .gesture(
                    TapGesture()
                        .onEnded{ (_) in
                            self.scale += 0.1
                        }
                )
            
            Text("LongPressGesture")
            Image("full-english")
                .scaleEffect(scale)
                .gesture(
                    LongPressGesture(minimumDuration: 2)
                        .onEnded({ (tap) in
                            print("Pressed!")
                    })
                )
            
            Text("DragGesture")
            Image("full-english")
                .gesture(
                    DragGesture(minimumDistance: 50)
                        .onEnded { _ in
                            print("Dragged!")
                        }
                )
        }
    }
}

struct GestureView_Previews: PreviewProvider {
    static var previews: some View {
        GestureView()
    }
}
