//
//  VideoView.swift
//  WJ_SwiftUI
//
//  Created by MacBook Pro on 2020/9/8.
//  Copyright © 2020 wjq. All rights reserved.
//

import SwiftUI
import AVKit

struct VideoView: View {
    var body: some View {
        VideoPlayer(player: AVPlayer(url:  URL(string: "http://clips.vorwaerts-gmbh.de/big_buck_bunny.mp4")!)) {
            VStack {
                Text("水印")
                    .font(.largeTitle)
                    .foregroundColor(.white)
                    .background(Color.black.opacity(0.7))
                    .clipShape(Capsule())
                Spacer()
            }
        }
    }
}

struct VideoView_Previews: PreviewProvider {
    static var previews: some View {
        VideoView()
    }
}
