//
//  Example4.swift
//  Drawings and Animations in SwiftUI
//
//  Created by Roberto Liccardo on 31/03/2020.
//  Copyright © 2020 Roberto Liccardo. All rights reserved.
//

import SwiftUI

struct Example4: View {
    @State private var bounceBall: Bool = false
    @State private var hiddenText: String = "Kick the ball!"
    var body: some View {
        VStack {
            Text(hiddenText)
            Image("ball")
                .resizable()
                .frame(width: 150, height: 150)
                .clipShape(Circle())
                .animation(Animation.interpolatingSpring(stiffness: 90, damping: 1.5).repeatForever(autoreverses: false))
                .offset(y: bounceBall ? -200 : 200)
                .onTapGesture {
                    self.bounceBall.toggle()
                    self.hiddenText = ""
            }
        }
        .navigationBarTitle("Example 4")
    }
}

struct Example4_Previews: PreviewProvider {
    static var previews: some View {
        Example4()
    }
}
