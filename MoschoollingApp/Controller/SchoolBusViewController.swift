//
//  SchoolBusViewController.swift
//  MoschoollingApp
//
//  Created by Mohammed Aslam on 07/12/17.
//  Copyright © 2017 Moschoolling. All rights reserved.
//

import UIKit

class SchoolBusViewController: BaseViewController,UITableViewDelegate,UITableViewDataSource {
    @IBOutlet weak var vehicleLocationTableview: UITableView!
    var items: [DriverData] = []
    let ref = Database.database().reference(withPath: "vehicleLocation").child("1066").child("61").child("Location")
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        vehicleLocationTableview.delegate = self
        vehicleLocationTableview.dataSource = self
        
        // 1
        ref.observe(.value, with: { snapshot in
            // 2
            var newItems: [DriverData] = []
            
            // 3
            for item in snapshot.children {
                // 4
                let groceryItem = DriverData(snapshot: item as! DataSnapshot)
                newItems.append(groceryItem)
                print(groceryItem)
                print("GGgroceryItem")
                
            }
            
            // 5
            self.items = newItems
            self.vehicleLocationTableview .reloadData()
        })

        // Do any additional setup after loading the view.
    }
    // MARK: UITableView Delegate methods
    
     func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return items.count
    }
    
     func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "VehicleLocationTableViewCell", for: indexPath) as! VehicleLocationTableViewCell
        let groceryItem = items[indexPath.row]
        
        cell.latituteLabel?.text = String(groceryItem.currentlatitude)
        cell.LongituteLabel?.text = String(groceryItem.currentlongitude)
        cell.timestampLabel?.text = String(describing: NSDate(timeIntervalSince1970: groceryItem.locationTimestamp/1000))
        cell.addressLabel?.text = groceryItem.currentAddress
       // toggleCellCheckbox(cell, isCompleted: groceryItem.completed)
        
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 110.0;//Choose your custom row height
    }
     func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        return true
    }
     func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCellEditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            let groceryItem = items[indexPath.row]
            groceryItem.ref?.removeValue()
        }
        //    if editingStyle == .delete {
        //      items.remove(at: indexPath.row)
        //      tableView.reloadData()
        //    }
    }
    
    
    func toggleCellCheckbox(_ cell: UITableViewCell, isCompleted: Bool) {
        if !isCompleted {
            cell.accessoryType = .none
            cell.textLabel?.textColor = UIColor.black
            cell.detailTextLabel?.textColor = UIColor.black
        } else {
            cell.accessoryType = .checkmark
            cell.textLabel?.textColor = UIColor.gray
            cell.detailTextLabel?.textColor = UIColor.gray
        }
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
