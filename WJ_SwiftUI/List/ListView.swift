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
            }
            .navigationBarTitle("List的删除、移动",displayMode: .automatic)
            .navigationBarItems(trailing: EditButton())
        }
    }
    
    
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
    }
}
