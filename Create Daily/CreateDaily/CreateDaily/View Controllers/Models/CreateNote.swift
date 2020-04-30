//
//  CreateNote.swift
//  CreateDaily
//
//  Created by Nonye on 4/28/20.
//  Copyright © 2020 Nonye Ezekwo. All rights reserved.
//

import Foundation

struct Notes: Encodable, Decodable {
    var noteTitle: String
    var noteDescription: String?
}
