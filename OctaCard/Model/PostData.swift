//
//  PostData.swift
//  OctaCard
//
//  Created by octavianus on 19/06/20.
//  Copyright © 2020 com.octavianus. All rights reserved.
//

import Foundation

struct Results: Decodable{
    let hits: [Post]
}

struct Post: Decodable,Identifiable{
    var id: String { objectID }
    let objectID: String
    let url: String?
    let title: String
    let points: Int
}
