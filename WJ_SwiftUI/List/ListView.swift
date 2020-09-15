//
//  ListView.swift
//  WJ_SwiftUI
//
//  Created by jieyue on 2019/10/15.
//  Copyright © 2019 wjq. All rights reserved.
//  

import SwiftUI

struct ListView: View {
    @State private var imageNames = ["all-out-donuts-thumb", "corn-on-the-cob-thumb","full-english-thumb"]

    
    func delete(at offset: IndexSet) {
        imageNames.remove(atOffsets: offset)
    }
    
    func move(from source:IndexSet, to destination: Int) {
        imageNames.move(fromOffsets: source, toOffset: destination)
    }
    
    var body: some View {

        NavigationView {
            List {
                
                ForEach(imageNames, id: \.self) { name in
                    HStack {
                        Image(name)
                            .clipShape(Circle())
                            .overlay(Circle().stroke(Color.gray, lineWidth: 2))
                            .shadow(color: .gray, radius: 2, x: 0, y: 0)
                        Text(name)
                    }
                }
                .onDelete(perform: delete(at:))
                .onMove(perform: move(from:to:))
                .listRowBackground(Color.red)
                
                Section(header: Text("Important tasks")) {
                    TaskRow()
                    TaskRow()
                    TaskRow()
                }
                Section(header: Text("Examples")) {
                    TaskRow()
                    TaskRow()
                    TaskRow()
                }
                .listRowBackground(Color.blue)
                Section(header: Text("Other tasks"), footer: Text("End")) {
                    TaskRow()
                    TaskRow()
                    TaskRow()
                }
                
            }
            
//            .listStyle(DefaultListStyle())
//            .listStyle(GroupedListStyle())
//            .listStyle(InsetGroupedListStyle())//圆角
//            .listStyle(InsetListStyle())//header悬停
//            .listStyle(SidebarListStyle())
//            .listStyle(PlainListStyle())
            .navigationBarTitle("List的删除、移动",displayMode: .large)
            .navigationBarItems(trailing: EditButton())
        }
    }
}

struct ListModel: Identifiable {
    var id = UUID()
    var username = "Anonymous"
}
struct Bookmark: Identifiable {
    let id = UUID()
    let name: String
    let icon: String
    var items: [Bookmark]?

    // some example websites
    static let apple = Bookmark(name: "Apple", icon: "1.circle")
    static let bbc = Bookmark(name: "BBC", icon: "square.and.pencil")
    static let swift = Bookmark(name: "Swift", icon: "bolt.fill")
    static let twitter = Bookmark(name: "Twitter", icon: "mic")

    // some example groups
    static let example1 = Bookmark(name: "Favorites", icon: "star", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example2 = Bookmark(name: "Recent", icon: "timer", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
    static let example3 = Bookmark(name: "Recommended", icon: "hand.thumbsup", items: [Bookmark.apple, Bookmark.bbc, Bookmark.swift, Bookmark.twitter])
}
struct ListDemoView: View {
    let users = [ListModel(), ListModel(), ListModel()]
    let items: [Bookmark] = [.example1, .example2, .example3]

    @State private var showingAdvancedOptions = false
    @State private var enableLogging = false
    @State private var selectedColor = 0
    @State private var colors = ["Red", "Green", "Blue"]
    
    var strengths = ["Mild", "Medium", "Mature"]
    @State private var selectedStrength = 0
    @State private var revealDetails = false
    
    var body: some View {
        NavigationView {

        ///1.
//        List(users) { user in
//            Image("mexican-mocha-thumb")
//                .resizable()
//                .frame(width: 40, height: 40)
//            Text(user.username)
//        }
            ///2.
            List(items, children: \.items) { (row)  in
                Image(systemName: row.icon)
                Text(row.name)
            }
            
           
            .navigationBarTitle("expanding lists",displayMode: .inline)
        }

    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
//        ListView()
        ListDemoView()
    }
}
