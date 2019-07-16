//
//  SearchReposViewController.swift
//  GitHubExplorer
//
//  Created by mhmohamed on 7/11/19.
//  Copyright © 2019 mark. All rights reserved.
//

import UIKit

class SearchReposViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var searchfield: UITextField!
    var searchReposViewModel : SearchReposViewModel?
    override func viewDidLoad() {
        super.viewDidLoad()
        tableView.register(UINib(nibName: String(describing: RepoTableViewCell.self), bundle: nil), forCellReuseIdentifier: "RepoTableViewCell")
        tableView.register(UINib(nibName: String(describing: LoadingTableViewCell.self), bundle: nil), forCellReuseIdentifier: "LoadingTableViewCell")
        tableView.estimatedRowHeight = 100
        searchReposViewModel = SearchReposViewModel(delegate: self)
        searchfield.delegate = self
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
