//
//  ViewController.swift
//  ExampleTimeLapse
//
//  Created by aguilarpgc on 1/17/19.
//  Copyright © 2019 Paul Aguilar. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    // MARK: - Outlets -
    
    @IBOutlet weak var tableView: UITableView!
    
    // MARK: - Properties -
    
    // MARK: - Life cycle -
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        tableView.reloadData()
    }
    
    // MARK: - IBActions -
    
    @IBAction func actionReload(_ sender: Any) {
        
        Datasource.shared.reload()
        
        tableView.reloadSections(IndexSet(integer: 0), with: .automatic)
    }
    
    // MARK: - Methods -
    
}

extension ViewController: UITableViewDataSource, UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return Datasource.shared.items.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        var cell = tableView.dequeueReusableCell(withIdentifier: "cell")
        
        if cell == nil {
            
            cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        }
        
        let item = Datasource.shared.items[indexPath.row]
        
        cell?.selectionStyle = .none
        
        cell?.textLabel?.text = item.desc
        cell?.detailTextLabel?.text = item.date.elapsedTime()
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        
        return 50.0
    }
}
