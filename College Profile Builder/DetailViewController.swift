//
//  DetailViewController.swift
//  College Profile Builder
//
//  Created by WGonzalez on 1/21/16.
//  Copyright © 2016 Quantum Apple. All rights reserved.
//

import UIKit

class DetailViewController: UIViewController
{

    @IBOutlet weak var myImageView: UIImageView!
    @IBOutlet weak var collegeName: UITextField!
    @IBOutlet weak var collegeLocation: UITextField!
    @IBOutlet weak var numbeOfStudents: UITextField!
    
    var college : College!
    
    override func viewDidLoad()
    {
        super.viewDidLoad()
        collegeName.text = college.name
        collegeLocation.text = college.location
        numbeOfStudents.text = String(college.numberOfStudents)
        myImageView.image = college.image
    }

    @IBAction func saveButtonTapped(sender: AnyObject)
    {
        college.name = collegeName.text!
        college.location = collegeLocation.text!
        college.numberOfStudents = Int(numbeOfStudents.text!)!
    }
    
    

   
}
