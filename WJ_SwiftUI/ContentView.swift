//
//  ContentView.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/12.
//  Copyright © 2019 wjq. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    let user = User(name: "Jack", jobTitle: "teacher", emailAddress: "939730129@qq.com", profilePicture: "strawberry-cooler-thumb")
    @EnvironmentObject var settings: UserSettings

    var body: some View {
            NavigationView {
                List {
                    UserView(user: user)
                }
                .navigationBarTitle("Menu", displayMode: NavigationBarItem.TitleDisplayMode.automatic)
            }
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
