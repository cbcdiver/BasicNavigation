//
//  ViewController.swift
//  BasicNavigation
//
//  Created by Chris Chadillon on 2019-01-12.
//  Copyright © 2019 Chris Chadillon. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    let theColors = ["Red", "Green", "Blue" , "White", "Black"]
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return theColors.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let theCell = tableView.dequeueReusableCell(withIdentifier: "MainCell", for: indexPath)
        theCell.textLabel?.text = theColors[indexPath.row]
        return theCell
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        title = "The Colors"
        navigationController?.navigationBar.prefersLargeTitles = true
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "colorSegue" {
            if let nextVC = segue.destination as? ColorViewController {
                nextVC.title = theColors[tableView.indexPathForSelectedRow!.row]
                nextVC.view.backgroundColor = getUIColorFromStringColor(theStringColor: theColors[tableView.indexPathForSelectedRow!.row])
            }
        }
    }
    
    func getUIColorFromStringColor(theStringColor: String) -> UIColor {
        switch (theStringColor) {
        case "Red" : return .red
        case "Blue" : return .blue
        case "Green" : return .green
        case "Black" : return .black
        case "White" : return .white
        default : return .white
        }
    }
}

