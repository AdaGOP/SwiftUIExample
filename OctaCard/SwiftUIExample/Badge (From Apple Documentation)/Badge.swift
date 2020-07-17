//
//  Badge.swift
//  OctaCard
//
//  Created by octavianus on 01/07/20.
//  Copyright © 2020 com.octavianus. All rights reserved.
//

import SwiftUI


struct Badge: View{
    static let rotationCount = 8
    
    var badgeSymbols: some View {
        ForEach(0..<Badge.rotationCount){ i in
            RotatedBadgeSymbol(
                angle: .degrees(Double(i) / Double(Badge.rotationCount)) * 360.0
            )
        }.opacity(0.5)
    }
    
    var body: some View{
        ZStack{
            BadgeBackground()
            GeometryReader{ geo in
                self.badgeSymbols
                    .scaleEffect(1.0 / 4.0, anchor: .top)
                    .position(x: geo.size.width / 2.0, y: 3/4 *  geo.size.height)
            }
        }.scaledToFit()
    }
    
}

struct BadgePreview: PreviewProvider{
    static var previews: some View{
        Badge()
    }
}
