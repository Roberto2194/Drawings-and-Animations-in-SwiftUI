//
//  Example3.swift
//  Drawings and Animations in SwiftUI
//
//  Created by Roberto Liccardo on 31/03/2020.
//  Copyright © 2020 Roberto Liccardo. All rights reserved.
//

import SwiftUI

struct Example3: View {
    var body: some View {
        //draw a circluar path
        ZStack {
            Circle() //rotate copies along this path
                .stroke()
                .frame(width: 75, height: 75)
                .opacity(0) //hide circular path
            
            roundRect()
                .foregroundColor(.blue) //first petal
            roundRect()
                .foregroundColor(.green)
                .rotationEffect(.degrees(-90))
            roundRect()
                .foregroundColor(.pink)
                .rotationEffect(.degrees(90))
            roundRect()
                .foregroundColor(.orange)
                .rotationEffect(.degrees(180))
            roundRect()
                .foregroundColor(#colorLiteral(red: 0.4666666687, green: 0.7647058964, blue: 0.2666666806, alpha: 1))
                .rotationEffect(.degrees(-45))
            roundRect()
                .foregroundColor(.purple)
                .rotationEffect(.degrees(45))
            roundRect()
                .foregroundColor(.yellow)
                .rotationEffect(.degrees(-135))
            roundRect()
                .foregroundColor(.red)
                .rotationEffect(.degrees(135))
            
            }.navigationBarTitle("Example 3").scaleEffect(2.8)
    }
}

struct roundRect: View {
    var body: some View {
        Capsule() //create petals
            .offset(y: 38) //specific horizontal and vertical distance, makes it move along the circular path
            .frame(width: 50, height: 70) //method to specify a fixed size for a view's width, height, both
            .opacity(0.6)
    }
}

extension Color: _ExpressibleByColorLiteral {
    public init(_colorLiteralRed red: Float, green: Float, blue: Float, alpha: Float) {
        self = Color(.sRGB, red: Double(red), green: Double(green), blue: Double(blue), opacity: Double(alpha))
    }
}

struct Example3_Previews: PreviewProvider {
    static var previews: some View {
        Example3()
    }
}
