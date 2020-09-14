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
https://www.hackingwithswift.com/quick-start/swiftui/whats-the-difference-between-observedobject-state-and-environmentobject
        1: @State 用于属于单个视图的简单属性，apple建议用private修饰
        2: @ObservedObject 用于可能属于多个视图的复杂属性或在视图之间共享的属性,每当使用引用类型时，都应使用@ObservedObject;
        3: @EnvironmentObject 用于可能被许多视图间接共享的属性;
         将@EnvironmentObject用于在应用程序其他位置创建的属性，例如共享数据。
    */
    
    //设置默认选中第1个
    @State private var selectedView = 0
    
    var body: some View {
        //TabView提供了与的等效功能UITabBarController
        TabView(selection: $selectedView) {
            RespondEevent()
                .tabItem {
                    Image(systemName: "list.dash")
                    Text("First")
                }.tag(0)
            ListView()
                .tabItem {
                    Image(systemName: "square.and.pencil")
                    Text("列表")
                }.tag(1)
            TextTestView()
                .tabItem {
                    Image(systemName: "1.circle")
                    Text("Text")
                }.tag(2)
            ProfileView()
                .tabItem {
                    Image(systemName: "2.circle")
                    Text("Third")
                }.tag(3)
            LayoutView()
                .tabItem {
                    Image(systemName: "3.circle")
                    Text("Layout")
                }.tag(4)
        }
    }
}

struct AppView_Previews: PreviewProvider {
    static var previews: some View {
        AppView()
    }
}

#if canImport(UIKit)
extension View {
    //强制SwiftUI隐藏键盘
    func hideKeyboard() {
        UIApplication.shared.sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}
#endif
