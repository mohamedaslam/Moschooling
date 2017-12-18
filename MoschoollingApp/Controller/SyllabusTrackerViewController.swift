//
//  SyllabusTrackerViewController.swift
//  MoschoollingApp
//
//  Created by Mohammed Aslam on 07/12/17.
//  Copyright © 2017 Moschoolling. All rights reserved.
//

import UIKit

class SyllabusTrackerViewController: BaseViewController, UITableViewDelegate, UITableViewDataSource {
    private let myArray: NSArray = ["First","Second","Third"]

    @IBOutlet weak var syllabustrackertableview: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        addSlideMenuButton()
        
        syllabustrackertableview.dataSource = self
        syllabustrackertableview.delegate = self
        // Do any additional setup after loading the view.
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Num: \(indexPath.row)")
        print("Value: \(myArray[indexPath.row])")
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return myArray.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "SyllabusTrackerTableViewCell", for: indexPath) as! SyllabusTrackerTableViewCell

       // cell.textLabel!.text = "\(myArray[indexPath.row])"
        return cell
    }
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat
    {
        return 194.0;//Choose your custom row height
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

