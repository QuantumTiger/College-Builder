//
//  ViewController.swift
//  College Profile Builder
//
//  Created by WGonzalez on 1/20/16.
//  Copyright © 2016 Quantum Apple. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate
{
    @IBOutlet weak var myTableView: UITableView!
    @IBOutlet weak var editButton: UIBarButtonItem!
    
    var college : [College] = []

    override func viewDidLoad()
    {
        super.viewDidLoad()
        myTableView.dataSource = self
        myTableView.delegate = self
        editButton.tag = 0
        college.append(College(Name: "Harvard University", Location: "Cambridge, MA 02138", NumberOfStudents: 21000, Image: UIImage(named: "Harvard")!))
        college.append(College(Name: "University of Chicago", Location: "5801 S Ellis Ave, Chicago, IL 60637", NumberOfStudents: 14467, Image: UIImage(named: "Chicago")!))
        college.append(College(Name: "ITT Tech", Location: "1289 City Center Dr, Carmel, IN 46032", NumberOfStudents: 57000, Image: UIImage(named: "ITT")!))
    }
    
    @IBAction func editButtonTapped(sender: UIBarButtonItem)
    {
        if editButton.tag == 0
        {
            myTableView.editing = true
            editButton.tag = 1
        }
        else
        {
            myTableView.editing = false
            editButton.tag = 0
        }
    }
    
    @IBAction func addButtonTapped(sender: UIBarButtonItem)
    {
        let myAlert = UIAlertController(title: "Add College", message: nil, preferredStyle: .Alert)
        myAlert.addTextFieldWithConfigurationHandler { (nameTextfield) -> Void in
            nameTextfield.placeholder = "Add College Name"
        }
        myAlert.addTextFieldWithConfigurationHandler { (nameAilasfield) -> Void in
            nameAilasfield.placeholder = "Add Location Name"
        }
        myAlert.addTextFieldWithConfigurationHandler { (nameAilasfield) -> Void in
            nameAilasfield.placeholder = "Add Number of Students"
        }
        let cancelAction = UIAlertAction(title: "Cancel", style: UIAlertActionStyle.Cancel, handler: nil)
        myAlert.addAction(cancelAction)
        
        let addAction = UIAlertAction(title: "Add", style: .Default) { (addAction) -> Void in
            let collegeTF = myAlert.textFields![0] as UITextField
            let locationTF = myAlert.textFields![1] as UITextField
            let numberTF = myAlert.textFields![2] as UITextField
            self.college.append(College(Name: collegeTF.text!, Location: locationTF.text!, NumberOfStudents : Int(numberTF.text!)!))
            self.myTableView.reloadData()
        }
        myAlert.addAction(addAction)
        //Presents alert view
        self.presentViewController(myAlert, animated: true, completion: nil)
    }
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell
    {
        let myCell = myTableView.dequeueReusableCellWithIdentifier("myCell", forIndexPath: indexPath)
        myCell.textLabel!.text = college[indexPath.row].name
        myCell.detailTextLabel!.text = college[indexPath.row].location
        return myCell
    }

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int
    {
        return college.count
    }
    
    func tableView(tableView: UITableView, commitEditingStyle editingStyle: UITableViewCellEditingStyle, forRowAtIndexPath indexPath: NSIndexPath) {
        if editingStyle == .Delete
        {
            college.removeAtIndex(indexPath.row)
            myTableView.reloadData()
        }
    }
    
    func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool
    {
        return true
    }
    
    func tableView(tableView: UITableView, moveRowAtIndexPath sourceIndexPath: NSIndexPath, toIndexPath destinationIndexPath: NSIndexPath)
    {
        let Collegebuilder = college[sourceIndexPath.row]
        college.removeAtIndex(sourceIndexPath.row)
        college.insert(Collegebuilder, atIndex: destinationIndexPath.row)
        
    }
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?)
    {
        let detailView = segue.destinationViewController as! DetailViewController
        let selectedRow = myTableView.indexPathForSelectedRow?.row
        detailView.college = college[selectedRow!]
    }

}