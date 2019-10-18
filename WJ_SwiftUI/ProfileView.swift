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

struct ProfileView: View {
   
    let user = User(name: "Jack", jobTitle: "teacher", emailAddress: "939730129@qq.com", profilePicture: "strawberry-cooler-thumb")
    
    var body: some View {
        NavigationView{
                VStack {
                    UserView(user: self.user)
                        .frame(height: 140)
                        .shadow(radius: 5)
//                        .background(Color.blue)
                    List {
                        ForEach (0 ..< 23) {
                            Text("\($0)")
                        }
                    }

                }

            .navigationBarTitle("个人中心", displayMode: .inline)
            .navigationBarItems(leading: Button(action: {
                
                }) {
                    Image(systemName: "list.dash")
                }, trailing:
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
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
