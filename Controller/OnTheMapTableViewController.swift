//
//  OnTheMapTableViewController.swift
//  OnTheMap
//
//  Created by Darin Williams on 4/22/19.
//  Copyright © 2019 dwilliams. All rights reserved.
//

import UIKit

class OnTheMapTableViewController: UITableViewController {
    
    var studentInformation: [StudentLocations] = [StudentLocations]()

    @IBOutlet var studentsPinTableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        populateTable()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    // MARK: - Table view data source
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //MARK deque
        let tableCell = tableView.dequeueReusableCell(withIdentifier: "studentsInformation", for: indexPath)
        
    tableCell.textLabel?.text =  self.studentInformation[indexPath.row].studenFullName
    tableCell.detailTextLabel?.text = self.studentInformation[indexPath.row].studentUrl
    tableCell.imageView?.image = UIImage(named: "icon_pin")
        
        return tableCell
    }
 

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return studentInformation.count
    }
    
    @IBAction func logOutButton(_ sender: Any) {
        
        OnTheMapRestClient.logout {
            DispatchQueue.main.async {
                self.dismiss(animated: true, completion: nil)
            }
        }
    }
    
    @objc func populateTable(){
         ParseClient.getSortedStudentList(completion: handleStudentResponse(studentLocations:error:))
    }
    
    func handleStudentResponse(studentLocations:[StudentLocations]?, error:Error?) {
        
        //check pre condtions
        guard let studentLocations = studentLocations else {
            //MARK CALL ERROR FUNCTION
            return
        }
        studentInformation = studentLocations
        DispatchQueue.main.async {
            // reload table
            self.studentsPinTableView.reloadData()
        }
    }
    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)

        // Configure the cell...

        return cell
    }
    */

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
