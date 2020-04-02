//
//  Example2.swift
//  Drawings and Animations in SwiftUI
//
//  Created by Roberto Liccardo on 31/03/2020.
//  Copyright © 2020 Roberto Liccardo. All rights reserved.
//

import SwiftUI

struct Example2: View {
    var body: some View {
        IceCream(heightRadiusRatio: 2)
            .stroke(lineWidth: 10)
            .fill(LinearGradient(gradient: Gradient(colors: [.red,.yellow]), startPoint: .bottom, endPoint: .top))
            .frame(height: 500)
            .navigationBarTitle("Example 2")
    }
}

struct IceCream: Shape {
    let heightRadiusRatio: CGFloat
    func path(in rect: CGRect) -> Path {
        var path = Path()
        let radius = rect.height / (1 + heightRadiusRatio)
        let bottom = CGPoint(x: rect.width / 2, y: rect.height)
        let left = CGPoint(x: bottom.x - radius, y: radius)
        let right = CGPoint(x: bottom.x + radius, y: radius)
        path.move(to: bottom)
        path.addLine(to: left)
        path.addLine(to: right)
        path.addArc(center: CGPoint(x: bottom.x, y: radius), radius: radius, startAngle: .degrees(180), endAngle: .degrees(360), clockwise: false)
        path.move(to: right)
        path.addLine(to: bottom)
        return path
    }
}


struct Example2_Previews: PreviewProvider {
    static var previews: some View {
        Example2()
    }
}
