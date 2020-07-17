//
//  Mentor.swift
//  OctaCard
//
//  Created by octavianus on 08/07/20.
//  Copyright © 2020 com.octavianus. All rights reserved.
//

import Foundation


struct MentorsRecords: Codable{
    var records: [MentorRecord]
}


struct MentorRecord: Codable, Identifiable{
    var id: String
    var fields: Mentor
    var createdTime: String
}

struct Mentor: Codable{
    var name: String
    var imageName: String
    var domain: String
}
