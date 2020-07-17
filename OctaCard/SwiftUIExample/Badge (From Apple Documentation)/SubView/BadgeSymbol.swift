//
//  BadgeSymbol.swift
//  OctaCard
//
//  Created by octavianus on 01/07/20.
//  Copyright © 2020 com.octavianus. All rights reserved.
//

import SwiftUI

struct BadgeSymbol: View {
    static let symbolColor = Color(red: 79.0 / 255, green: 79.0 / 255, blue: 191.0 / 255)
    var body: some View {
        GeometryReader{ geometry in
            Path { path in
                let width = min(geometry.size.width,geometry.size.height)
                let height = width * 0.75
                let middle = width / 2
                
                let spacing = width * 0.04
                let topWidth = 0.2 * width
                let topHeight = 0.4 * height
                let middleBottomY = topHeight * 0.6 + spacing
                
                
                path.addLines([
                    CGPoint(x: middle, y: spacing),
                    CGPoint(x: middle + topWidth, y: topHeight),
                    CGPoint(x: middle, y: middleBottomY),
                    CGPoint(x: middle - topWidth, y: topHeight)
                ])
                
                path.move(to: CGPoint(x: middle, y: middleBottomY + spacing))
                
                path.addLines([
                    CGPoint(x: middle, y: middleBottomY + spacing),
                    CGPoint(x: middle + topWidth, y: topHeight + spacing),
                    CGPoint(x: width, y: height),
                    CGPoint(x: 0, y: height),
                    CGPoint(x: middle - topWidth, y: topHeight + spacing )
                ])
            }.fill(BadgeSymbol.symbolColor)
        }
    }
}

struct BadgeSymbol_Previews: PreviewProvider {
    static var previews: some View {
        BadgeSymbol().previewLayout(.sizeThatFits)
    }
}
