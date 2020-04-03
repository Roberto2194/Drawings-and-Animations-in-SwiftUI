//
//  Example7.swift
//  Drawings and Animations in SwiftUI
//
//  Created by Roberto Liccardo on 31/03/2020.
//  Copyright © 2020 Roberto Liccardo. All rights reserved.
//

import SwiftUI

struct Example7: View {
    @State private var backViewSize: CGFloat = 80
    @State private var size: CGSize = .zero
    @State private var color: UIColor = .random
    var body: some View {
        GeometryReader { reader in
            ZStack {
                VStack {
                    Color(self.color)
                }.frame(width: reader.size.width - self.backViewSize, height: 300)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                VStack {
                    ZStack {
                        Color.red
                        Text("Drag me")
                    }
                }.frame(width: reader.size.width - 50, height: 300)
                    .cornerRadius(20)
                    .shadow(radius: 20)
                    .gesture(DragGesture().onChanged({ (value) in
                        self.size = value.translation
                        self.backViewSize = 50
                    })
                        .onEnded({ (value) in
                            self.size = .zero
                            self.backViewSize = 80
                            self.color = .random
                        })
                )
                    .offset(self.size)
            }
        }
        .animation(.spring())
        .navigationBarTitle("Example 7")
    }
}

extension UIColor {
    static var random: UIColor {
        return UIColor(red: .random(in: 0...1),
                       green: .random(in: 0...1),
                       blue: .random(in: 0...1),
                       alpha: 1.0)
    }
}

struct Example7_Previews: PreviewProvider {
    static var previews: some View {
        Example7()
    }
}
