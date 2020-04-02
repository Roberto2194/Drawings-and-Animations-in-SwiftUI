//
//  Example5.swift
//  Drawings and Animations in SwiftUI
//
//  Created by Roberto Liccardo on 30/03/2020.
//  Copyright © 2020 Roberto Liccardo. All rights reserved.
//

import SwiftUI

struct Example5: View {
    @State private var zAxisRotation = false
    
    var body: some View {
        VStack {
            Image("Vinyl_record")
                .resizable()
                .frame(width: 400, height: 400)
                .rotationEffect(.degrees(zAxisRotation ? 360*4 : 0), anchor: .center)
                .animation(Animation.linear(duration: 3).repeatCount(1))
                .onTapGesture { self.zAxisRotation.toggle() }
            Text("Tap the vinyl to make it spin!")
        }.navigationBarTitle("Example 5")
    }
}

struct Example5_Previews: PreviewProvider {
    static var previews: some View {
        Example5()
    }
}
