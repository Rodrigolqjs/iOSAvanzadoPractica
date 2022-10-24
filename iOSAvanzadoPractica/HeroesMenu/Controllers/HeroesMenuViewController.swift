//
//  HeroesMenuViewController.swift
//  iOSAvanzadoPractica
//
//  Created by Rodrigo Latorre on 12/10/22.
//

import UIKit


class HeroesMenuViewController: UITableViewController {

    var viewModel = HeroesMenuViewModel()
    //Completar con heroes de CoreData
    //let heroes: [Hero]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dragon Ball"
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
//        return heroes.count
        return 0
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath)
        // Configure the cell...

//        cell.set(model: heroes[indexPath.row])
        
        return cell
    }

}
