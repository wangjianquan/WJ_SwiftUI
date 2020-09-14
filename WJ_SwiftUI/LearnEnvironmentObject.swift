//
//  LearnEnvironmentObject.swift
//  WJ_SwiftUI
//
//  Created by MacBook Pro on 2020/9/14.
//  Copyright © 2020 wjq. All rights reserved.
//

import SwiftUI

struct DetailView: View {
    @EnvironmentObject var settings: UserSettings

    var body: some View {
        // A text view that reads from the environment settings
        Text("Score: \(settings.score)")
    }
}


struct LearnEnvironmentObject: View {
    @EnvironmentObject var settings: UserSettings

    var body: some View {
        NavigationView(content: {
            VStack {
                Button(action: {
                    self.settings.score += 1
                }) {
                    Text("Increase Score")
                }
                Spacer().frame(height: 20)
                NavigationLink(destination: DetailView()) {
                    Text("Show Detail View")
                }
            }.padding()
        })
    }
}

struct LearnEnvironmentObject_Previews: PreviewProvider {
    static var previews: some View {
        LearnEnvironmentObject()
    }
}
