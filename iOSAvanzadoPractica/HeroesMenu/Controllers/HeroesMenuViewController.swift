//
//  HeroesMenuViewController.swift
//  iOSAvanzadoPractica
//
//  Created by Rodrigo Latorre on 12/10/22.
//

import UIKit

class HeroesMenuViewController: UITableViewController {

    var viewModel = HeroesMenuViewModel()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dragon Ball"
        
        tableView?.register(
          UINib(nibName: "TableViewCell", bundle: nil),
          forCellReuseIdentifier: "cellIdentifier"
        )
        
        viewModel.viewDidLoad()
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.characters.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as? TableViewCell else {
            let cell = UITableViewCell()
            cell.textLabel?.text = "no content"
            return cell
        }
        cell.set(model: viewModel.characters[indexPath.row])
        
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let nextVC: UIViewController = MapViewController()
//        navigationController?.pushViewController(nextVC, animated: true)
        performSegue(withIdentifier: "showmap", sender: nil)
    }

}
