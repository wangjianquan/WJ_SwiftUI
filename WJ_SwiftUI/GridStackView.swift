//
//  GridStackView.swift
//  WJ_SwiftUI
//
//  Created by MacBook Pro on 2020/9/9.
//  Copyright © 2020 wjq. All rights reserved.
//

import SwiftUI

struct GridStackView<Content: View>: View {
    let rows: Int
    let columns: Int
    let content: (Int, Int) -> Content
    
    var body: some View {
        VStack(spacing:3) {
//            Divider()
            ForEach(0..<rows, id: \.self) { row in
                HStack(spacing:3) {
                    ForEach(0..<self.columns, id: \.self) { column  in
                        self.content(row,column)
                    }.padding(1)
                }.background(Color.orange)
            }
        }
    }

    init(rows: Int, columns: Int, @ViewBuilder content: @escaping (Int, Int) -> Content) {
        self.rows = rows
        self.columns = columns
        self.content = content
    }
}

struct GridStackView_Previews: PreviewProvider {
    static var previews: some View {
        GridStackView(rows: 4, columns: 4) { (row, col)  in
//            Image(systemName: "\(row * 4 + col).circle")
//            Spacer()
//            Divider()
            Text("R\(row) C\(col)")
             .frame(width: 80, height: 80)
        }.background(Color.blue)
    }
}
