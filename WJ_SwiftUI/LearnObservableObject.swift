//
//  LearnObservableObject.swift
//  WJ_SwiftUI
//
//  Created by MacBook Pro on 2020/9/14.
//  Copyright © 2020 wjq. All rights reserved.
//
/*ObservableObject:可观察对象
 使用观察对象时，我们需要处理三个关键事项：ObservableObject协议与某种可以存储数据的类一起使用，@ObservedObject属性包装器在视图内部用于存储可观察的对象实例，并且@Published添加了属性包装器到观察对象内部的任何属性，这些属性应导致视图在更改时更新。
 
 如何使用objectWillChange手动发送状态更新
 尽管使用@Published控制状态更新是最简单的方法，但是如果需要某些特定的操作，也可以手动进行。例如，您可能只希望对给定的值感到满意才刷新视图。

 使用此方法需要三个步骤：导入Combine框架，添加发布者，然后使用发布者。发布者是Combine宣布对正在观看的内容进行更改的方式，在SwiftUI中，该视图为零或更多视图。
 
 **/
    
import SwiftUI
import Combine

class Contact: ObservableObject {
    @Published var name: String
    @Published var age: Int
    
    init(name: String, age: Int) {
        self.name = name
        self.age = age
    }
    func haveBirthday() -> Int {
        age += 1
        return age
    }
}

class UserSettings: ObservableObject {
    //当值更改时，@Published属性包装器将确保刷新所有使用该值的视图。
    @Published var score = 0
}

class UserAuthentication: ObservableObject {
    let objectWillChange = ObservableObjectPublisher()//来自Combine框架

    //其次，我们在willSet属性的属性上附加了属性观察器username，UserAuthentication以便只要该值发生更改，我们就可以运行代码。
    //只要username发生更改，调用objectWillChange.send()，
    //这是告诉objectWillChange发布者发布有关我们的数据已更改的消息，以便任何订阅的视图都可以刷新的消息。
    var username = "" {
        willSet {
            objectWillChange.send()
        }
    }
}
struct LearnObservableObject: View {
    //1.
    @ObservedObject var settings = UserSettings()
    //2.
    @ObservedObject var authentication = UserAuthentication()
    
    var body: some View {
        VStack {
            Text("Your score is \(settings.score)")
            Button(action: {
                self.settings.score += 1
            }, label: {
                Text("Increase Score")
            })
            Spacer().frame(height:30)
            TextField("Username", text: $authentication.username)
                .textFieldStyle(RoundedBorderTextFieldStyle())
           Text("Your username is: \(authentication.username)")
        }.padding(15)
    }
}

struct LearnObservableObject_Previews: PreviewProvider {
    static var previews: some View {
        LearnObservableObject()
    }
}
