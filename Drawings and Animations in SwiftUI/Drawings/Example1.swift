//
//  Example1.swift
//  Drawings and Animations in SwiftUI
//
//  Created by Roberto Liccardo on 31/03/2020.
//  Copyright © 2020 Roberto Liccardo. All rights reserved.
//

import SwiftUI

struct Example1: View {
    var body: some View {
        Path { path in
            path.move(to: CGPoint(x: 200, y: 200))
            path.addLine(to: CGPoint(x: 50, y: 600))
            path.addLine(to: CGPoint(x: 360, y: 600))
            path.addLine(to: CGPoint(x: 200, y: 200))
        }
        .foregroundColor(.blue)
        .navigationBarTitle("Example 1")
    }
}

struct Example1_Previews: PreviewProvider {
    static var previews: some View {
        Example1()
    }
}
