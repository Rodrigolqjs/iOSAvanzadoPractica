//
//  HeroesMenuViewController.swift
//  iOSAvanzadoPractica
//
//  Created by Rodrigo Latorre on 12/10/22.
//

import UIKit

class HeroesMenuViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    
    var viewModel = HeroesMenuViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Dragon Ball"
        
        tableView?.register(
          UINib(nibName: "TableViewCell", bundle: nil),
          forCellReuseIdentifier: "cellIdentifier"
        )
        viewModel.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
    }

    
}

extension HeroesMenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return viewModel.characters.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cellIdentifier", for: indexPath) as? TableViewCell else {
            let cell = UITableViewCell()
            cell.textLabel?.text = "no content"
            return cell
        }
        cell.set(model: viewModel.characters[indexPath.row])
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let nextVC = MapViewController()
        nextVC.characterID = viewModel.characters[indexPath.row].id
        navigationController?.pushViewController(nextVC, animated: true)
        
//        performSegue(withIdentifier: "showmap", sender: nil)
    }

}
