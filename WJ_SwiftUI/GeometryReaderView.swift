//
//  GeometryReaderView.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/14.
//  Copyright © 2019 wjq. All rights reserved.
//

import SwiftUI

struct GeometryReaderView: View {
    var body: some View {
//        GeometryReader { geometry in
//           HStack(spacing: 0) {
//               Text("Left")
//                .frame(width: geometry.size.width / 2, height: geometry.size.height/2)
//                   .background(Color.yellow)
//               Text("Right")
//                   .frame(width: geometry.size.width / 2, height: 50)
//                   .background(Color.orange)
//           }
//       }
        Text("Hello World")
        .frame(minWidth: 0, maxWidth: .infinity, minHeight: 0, maxHeight: .infinity)
        .background(Color.red)
        .edgesIgnoringSafeArea(.all)

    }
}

struct GeometryReaderView_Previews: PreviewProvider {
    static var previews: some View {
        GeometryReaderView()
    }
}
