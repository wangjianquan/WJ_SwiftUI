//
//  ProfileView.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/12.
//  Copyright © 2019 wjq. All rights reserved.
//

import SwiftUI

struct User {
    var name           : String
    var jobTitle       : String
    var emailAddress   : String
    var profilePicture : String
}

struct ProfilePicture: View {
    var imageName: String

    var body: some View {
        Image(imageName)
            .resizable()
            .frame(width: 100, height: 100)
            .clipShape(Circle())
    }
}

struct EmailAddress: View {
    var address: String
    
    var body: some View {
        HStack {
            Image(systemName: "envelope")
            Text(address)
        }
    }
}

struct UserDetails: View {
    var user: User
    
    var body: some View {
        VStack (alignment: .leading, spacing: 0) {
            Text(user.name)
                .font(.largeTitle)
                .foregroundColor(.primary)
            Text(user.jobTitle)
                .foregroundColor(.secondary)
            EmailAddress(address: user.emailAddress)
        }
    }
}

struct UserView: View {
    var user: User

    var body: some View {
        
        HStack {
            ProfilePicture(imageName: user.profilePicture)
            Spacer()
            UserDetails(user: user)
        }
        .padding()
    }
}

struct TaskRow: View {
    var body: some View {
        Text("Task data goes here")
    }
}

struct ProfileView: View {
   
    let user = User(name: "Jack", jobTitle: "teacher", emailAddress: "939730129@qq.com", profilePicture: "strawberry-cooler-thumb")
    @State private var dataSource = [".red",".gray",".green",".blue",".orange",".yellow",".pink",".purple"]
    
    var body: some View {
        NavigationView{
                VStack {
                    UserView(user: self.user)
                        .frame(height: 140)
                        .shadow(radius: 5)
//                        .background(Color.blue)
                    List {
                        
                        //1.侧滑删除崩溃
//                        ForEach(0 ..< dataSource.count) { index in
//                            Text(dataSource[index])
//                        }.onDelete(perform: { indexSet in
//                            delete(at: indexSet)
//                        })
                        
                        //2.不奔溃
                        ForEach(dataSource, id: \.self) { dataSource in
                            Text(dataSource)
                        }
                        .onDelete(perform: { indexSet in
                            delete(at: indexSet)
                        })
                        .onMove(perform: { indices, newOffset in
                            dataSource.move(fromOffsets: indices, toOffset: newOffset)
                        })
                        
                        
                    }
                    .listStyle(GroupedListStyle())//分组样式

                }.background(Color.red)

            
            .navigationBarTitle("个人中心", displayMode: .inline)
            .navigationBarItems(leading: EditButton(), trailing:
                    HStack {
                        Button("About") {
                            print("About tapped!")
                        }
                        Button(action: {
                            
                        }) {
                            Image(systemName: "list.dash")
                        }
                })
        }
    }
    
    func delete(at offsets:IndexSet ){
        dataSource.remove(atOffsets: offsets)
    }
    
    func move(from source: IndexSet, to destination: Int) {
        dataSource.move(fromOffsets: source, toOffset: destination)
    }
    
    
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
