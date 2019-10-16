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
    @State private var showingSheet = false
    @State private var showingAlert = false
    @State var showingDetail = false

    var body: some View {
        VStack (spacing:15) {
            Button(action: {
                self.showingDetail.toggle()
            }) {
                Text("isPresented")
            }.sheet(isPresented: $showingDetail) {
                FormView()
            }

            Button(action: {
                self.showingSheet = true
            }) {
                Text("Show Action Sheet")
            }.actionSheet(isPresented: $showingSheet) { () -> ActionSheet in
                ActionSheet(title: Text("ActionSheet"), message: Text("message"), buttons: [.cancel(Text("取消")),.default(Text("拍照"), action: {

                }),.default(Text("相册"), action: {

                })])
            }
            
            Button(action: {
                self.showingAlert = true
            }) {
                Text("Show Alert")
            }.alert(isPresented:$showingAlert) {
                Alert(title: Text("Are you sure you want to delete this?"), message: Text("There is no undo"), primaryButton: .destructive(Text("Delete")) {
                   print("Deleting...")
                }, secondaryButton: .cancel())
            }
        }.padding()
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        TestView()
    }
}
