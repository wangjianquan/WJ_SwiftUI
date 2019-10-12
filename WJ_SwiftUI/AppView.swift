//
//  AppView.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/12.
//  Copyright © 2019 wjq. All rights reserved.
//

// AppView 类似自定义UITabBarController
import SwiftUI

struct AppView: View {
    /*Apple为我们提供了三种在应用程序中使用状态的方式
    1:@State用于简单的本地属性，所以用@State标记的属性apple建议用private修饰
    2: @ObservedObject用于复杂的属性或在视图之间共享的属性;
    3: @EnvironmentObject用于可能被许多视图间接共享的属性;
    */
    
    //设置默认选中第1个
    @State private var selectedView = 0
    
    var body: some View {
        //TabView提供了与的等效功能UITabBarController
        TabView(selection: $selectedView) {
            HomeView()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("First")
                }.tag(0)
            TestView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("Second")
                }.tag(1)
            TextTestView()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Third")
                }.tag(2)
            ProfileView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Third")
                }.tag(3)
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}
