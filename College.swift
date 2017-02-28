//
//  College.swift
//  College Profile Builder (Part A)
//
//  Created by Lesslie Garcia on 2/9/17.
//  Copyright © 2017 Lesslie Garcia. All rights reserved.
//

import UIKit
import RealmSwift

class College: Object {
    dynamic var collegeName = String()
    dynamic var location = String()
    dynamic var enrollment = Int()
    dynamic var image = Data()
    dynamic var website = String()
    
    
    // parameters -- what is passed into the function //
    convenience init(collegeName: String,location: String, enrollment: Int, image: Data, website: String) {
        self.init()
        self.collegeName = collegeName
        self.location = location
        self.enrollment = enrollment
        self.website = website
        self.image = image
    }
}
