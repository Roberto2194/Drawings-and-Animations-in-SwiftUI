//
//  Example8.swift
//  Drawings and Animations in SwiftUI
//
//  Created by Roberto Liccardo on 31/03/2020.
//  Copyright © 2020 Roberto Liccardo. All rights reserved.
//

import SwiftUI

struct Example8: View {
    @State private var moveIt = false
    
    var body: some View {
        let animation = Animation.default
        
        return VStack {
            LabelView(offset: moveIt ? 120 : -120, pct: moveIt ? 1 : 0, backgroundColor: moveIt ? .red : .pink, opacityValue: 1)
                .animation(animation)
            
            LabelView(offset: moveIt ? 120 : -120, pct: moveIt ? 1 : 0, backgroundColor: moveIt ? .orange : .purple, opacityValue: 1)
                .animation(animation.delay(0.2))
            
            LabelView(offset: moveIt ? 120 : -120, pct: moveIt ? 1 : 0, backgroundColor: moveIt ? .yellow : .blue, opacityValue: 1)
                .animation(animation.delay(0.4))
            
            LabelView(offset: moveIt ? 120 : -120, pct: moveIt ? 1 : 0, backgroundColor: moveIt ? .green : .green, opacityValue: 1)
                .animation(animation.delay(0.6))
            
            LabelView(offset: moveIt ? 120 : -120, pct: moveIt ? 1 : 0, backgroundColor: moveIt ? .blue : .yellow, opacityValue: 1)
                .animation(animation.delay(0.8))
            
            LabelView(offset: moveIt ? 120 : -120, pct: moveIt ? 1 : 0, backgroundColor: moveIt ? .purple : .orange, opacityValue: 1)
                .animation(animation.delay(1.0))
            
            LabelView(offset: moveIt ? 120 : -120, pct: moveIt ? 1 : 0, backgroundColor: moveIt ? .pink : .red, opacityValue: 1)
                .animation(animation.delay(1.2))
            
            Button(action: { self.moveIt.toggle() }) { Text("Animate") }.padding(.top, 50)
        }
        .onTapGesture { self.moveIt.toggle() }
        .navigationBarTitle("Example 8")
    }
}

struct LabelView: View {
    var offset: CGFloat
    var pct: CGFloat
    let backgroundColor: Color
    var opacityValue: Double
    
    var body: some View {
        RoundedRectangle(cornerRadius: 40)
            .foregroundColor(backgroundColor)
            .opacity(opacityValue)
            .modifier(SkewedOffset(offset: offset, pct: pct, goingRight: offset > 0))
    }
}

struct SkewedOffset: GeometryEffect {
    var offset: CGFloat
    var pct: CGFloat
    let goingRight: Bool
    
    init(offset: CGFloat, pct: CGFloat, goingRight: Bool) {
        self.offset = offset
        self.pct = pct
        self.goingRight = goingRight
    }
    
    var animatableData: AnimatablePair<CGFloat, CGFloat> {
        get { return AnimatablePair<CGFloat, CGFloat>(offset, pct) }
        set {
            offset = newValue.first
            pct = newValue.second
        }
    }
    
    func effectValue(size: CGSize) -> ProjectionTransform {
        var skew: CGFloat
        
        if pct < 0.2 {
            skew = (pct * 5) * 0.5 * (goingRight ? -1 : 1)
        } else if pct > 0.8 {
            skew = ((1 - pct) * 5) * 0.5 * (goingRight ? -1 : 1)
        } else {
            skew = 0.5 * (goingRight ? -1 : 1)
        }
        
        return ProjectionTransform(CGAffineTransform(a: 1, b: 0, c: skew, d: 1, tx: offset, ty: 0))
    }
}

struct Example8_Previews: PreviewProvider {
    static var previews: some View {
        Example8()
    }
}
