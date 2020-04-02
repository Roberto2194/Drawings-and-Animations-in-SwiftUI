//
//  Example6.swift
//  Drawings and Animations in SwiftUI
//
//  Created by Roberto Liccardo on 31/03/2020.
//  Copyright © 2020 Roberto Liccardo. All rights reserved.
//

import SwiftUI

struct Example6: View {
    @State private var moveOnCircularPath: Bool = false
    @State private var textField: String = "Tap the airplane to make it move!"
    var body: some View {
        ZStack {
            Text(textField)
            Circle()
                .stroke(style: StrokeStyle(lineWidth: 3, lineCap: CGLineCap.round, dash: [8]))
                .frame(width: 300, height: 300)
                .foregroundColor(.purple)
            
            Image(systemName: "airplane")
                .font(.largeTitle)
                .foregroundColor(.red)
                .offset(y: -150)
                .rotationEffect(.degrees(moveOnCircularPath ? 0 : -360))
                .animation(Animation.linear(duration: 5).repeatForever(autoreverses: false))
                .onTapGesture {
                    self.moveOnCircularPath.toggle()
                    self.textField = ""
            }
        }.navigationBarTitle("Example 6")
    }
}

struct Example6_Previews: PreviewProvider {
    static var previews: some View {
        Example6()
    }
}
