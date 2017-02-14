//
//  College.swift
//  College Profile Builder (Part A)
//
//  Created by Lesslie Garcia on 2/9/17.
//  Copyright © 2017 Lesslie Garcia. All rights reserved.
//

import UIKit

class college: NSObject {
    var collegeName = String()
    var location = String()
    var enrollment = Int()
    var image = Data()
    
    
    // parameters -- what is passed into the function //
    convenience init(collegeName: String,location: String, enrollment: String, image: Data) {
        self.init()
        self.collegeName = collegeName
        self.location = location
        self.enrollment = enrollment
        self.image = image
   
    }
    

}
