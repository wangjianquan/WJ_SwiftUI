//
//  ProfileView.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/12.
//  Copyright © 2019 wjq. All rights reserved.
//

import SwiftUI

struct ProfileView: View {
   
    var body: some View {
        NavigationView{
            
            ZStack(alignment: .top) {
                
                Rectangle()
                    .fill(Color.black)
                    .frame(width: 200, height: 200)

                RoundedRectangle(cornerRadius: 25, style: .continuous)
                    .fill(Color.red)
                    .frame(width: 150, height: 150)

                Capsule()
                    .fill(Color.green)
                    .frame(width: 100, height: 50)

                Ellipse()
                    .fill(Color.blue)
                    .frame(width: 80, height: 40)

                
                Circle()
                    .fill(Color.yellow)
                    .frame(width: 35, height: 35)
            }
            .navigationBarTitle("SwiftUI内置的形状", displayMode: .inline)
        }
    }
}

struct ProfileView_Previews: PreviewProvider {
    static var previews: some View {
        ProfileView()
    }
}
