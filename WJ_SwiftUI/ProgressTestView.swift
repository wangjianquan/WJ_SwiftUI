//
//  ProgressTestView.swift
//  WJ_SwiftUI
//
//  Created by MacBook Pro on 2020/9/14.
//  Copyright © 2020 wjq. All rights reserved.
/*
 iOS 14的新功能
 SwiftUI允许我们将onChange()修饰符附加到任何视图，当程序中的某些状态发生更改时，它将运行我们选择的代码。
 这很重要，因为我们不能将属性观察器与didSet一起使用@State。
    1.
 
 */

import SwiftUI
import MapKit

struct ProgressTestView: View {
    let timer = Timer.publish(every: 0.1, on: .main, in: .common).autoconnect()

    @State private var downloadAmount = 0.0
    @State private var region = MKCoordinateRegion(center: CLLocationCoordinate2D(latitude: 51.507222, longitude: -0.1275), span: MKCoordinateSpan(latitudeDelta: 0.5, longitudeDelta: 0.5))
    @State private var name = ""

    @Environment(\.openURL) var openURL

    var body: some View {
        VStack {
            Map(coordinateRegion: $region).frame(maxHeight: 300)
            Spacer().frame(height:30)

            //iOS 14的新功能
            ProgressView("Downloading…", value: downloadAmount, total: 100)
                .onReceive(timer, perform: { _ in
                    if downloadAmount < 100 {
                        downloadAmount += 2
                    }
                })
            Spacer().frame(height:30)
            ProgressView("Downloading…")
            TextField("Enter your name:", text: $name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .onChange(of: name, perform: { value in
                    print("Name changed to \(name)!")

                })
            Text(name)
            Link("Visit Apple",
                  destination: URL(string: "https://www.apple.com")!)
                .font(.title)
                .foregroundColor(.red)
            Link(destination: URL(string: "https://www.apple.com")!) {
                Image(systemName: "link.circle.fill")
                    .font(.largeTitle)
            }
            Button("Visit Apple") {
                openURL(URL(string: "https://www.apple.com")!)
            }
        }.padding()
    }
}

struct ProgressTestView_Previews: PreviewProvider {
    static var previews: some View {
        ProgressTestView()
    }
}
