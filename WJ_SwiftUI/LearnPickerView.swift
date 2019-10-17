//
//  LearnPickerView.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/15.
//  Copyright © 2019 wjq. All rights reserved.
//

//提示：由于表单中的选择器具有这种导航行为，因此将它们包装NavigationView在iOS 上很重要，否则您会发现点击它们不起作用。
//如果要禁用此行为，则可以通过使用.pickerStyle(WheelPickerStyle())修饰符来强制选择器采用其常规样式
import SwiftUI

struct LearnPickerView: View {
    var colors: [Color] = [.red,.gray,.green,.blue,.orange,.yellow,.pink,.purple]
    @State private var selectedColor = 0
    
    var dateFormatter: DateFormatter {
        let formatter = DateFormatter()
        formatter.dateStyle = .long
        return formatter
    }
    @State private var birthDate = Date()
    @State private var favoriteColor = 0
    
    var body: some View {
       
        NavigationView {
            VStack { //Form
                VStack {
                    Picker(selection: $favoriteColor, label: Text("favorite color")) {
                        ForEach(0 ..< colors.count) { index in
                            Text(self.colors[index].description.capitalized)
                               }
                           }.pickerStyle(SegmentedPickerStyle())
                           Text("value:\(favoriteColor)")
                       }
                       
                VStack {
                    Picker(selection: $selectedColor, label: Text("choose colors")) {
                        ForEach (0 ..< colors.count) {
                            Text(self.colors[$0].description.capitalized)
                                .font(.title)
                                .foregroundColor(self.colors[$0])
                        }
                    }
//                    .pickerStyle(WheelPickerStyle())
                    Text("You selected : ")
                        .fontWeight(.bold)
                    +
                    Text("\(colors[selectedColor].description.capitalized)")
                        .font(.title)
                        .foregroundColor(colors[selectedColor])
                    }
                    Spacer().frame(height:15)
                VStack {
                       //displayedComponents: 日期格式，.hourAndMinute
                       //in: ...Date():当前日期之前可选 或者 Date()...：当前日期以后可选
                       DatePicker(selection: $birthDate, in: ...Date(), displayedComponents: .date) {
                           Text("日期")
                    }
                       Text("Date is \(birthDate, formatter: dateFormatter)")
                   }
               }
             .navigationBarTitle("表单 Form", displayMode: .inline)
        }.onAppear {
            print("LearnPickerView appeared!")
        }.onDisappear {
            print("LearnPickerView disappeared!")
        }

    }
}

struct LearnPickerView_Previews: PreviewProvider {
    static var previews: some View {
        LearnPickerView()
    }
}
