//
//  College.swift
//  College Profile Builder
//
//  Created by WGonzalez on 1/21/16.
//  Copyright © 2016 Quantum Apple. All rights reserved.
//

import UIKit

class College: NSObject
{
    var name = ""
    var location = ""
    var numberOfStudents = 0
    var image = UIImage(named: "default")
    
    init(Name : String, Location : String, NumberOfStudents : Int, Image : UIImage)
    {
        super.init()
        name = Name
        location = Location
        numberOfStudents = NumberOfStudents
        image = Image
    }

    init(Name:String, Location : String, NumberOfStudents : Int)
    {
        super.init()
        name = Name
        location = Location
        numberOfStudents = NumberOfStudents
    }
}
