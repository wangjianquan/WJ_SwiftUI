//
//  TestView.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/12.
//  Copyright © 2019 wjq. All rights reserved.
//

import SwiftUI

struct TestView: View {
    let imageNames = ["all-out-donuts-thumb", "corn-on-the-cob-thumb","full-english-thumb"]

    var body: some View {

        NavigationView{
            List(imageNames, id: \.self) { image in
                Image(image).resizable().frame(width: 40)
                Text(image)
            }
            .navigationBarTitle("隐式 HStack",displayMode: .automatic)
        }
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
