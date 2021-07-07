//
//  ViewController.swift
//  Test1
//
//  Created by Pushpank Kumar on 01/03/21.
//  Copyright © 2021 Pushpank Kumar. All rights reserved.
//

import UIKit

class DashboardViewController: UIViewController {
    
    let viewModel = DashbordViewModel()
    @IBOutlet weak var activityIndicatorView: UIActivityIndicatorView!
    @IBOutlet weak var tableView: UITableView! {
        didSet {
            tableView.register(cellType: UserTableViewCell.self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        print("Hi")
        activityIndicatorView.startAnimating()
        tableView.alpha = 0.0
        loadData()
    }
}

//MARK: Private Methods
extension DashboardViewController {
    
    /// get data from the web service
    private func loadData() {
        viewModel.getUsers {[weak self] (isSuccess, error) in
            guard let self = self else { return }
            DispatchQueue.main.async {
                self.activityIndicatorView.stopAnimating()
                if isSuccess {
                    self.tableView.reloadData()
                    self.tableView.alpha = 1.0
                } else {
                    debugPrint("error", error ?? "")
                    // we can show an alert here...
                }
            }
        }
    }
}

//MARK: UITableViewDataSource
extension DashboardViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.viewModel.getNumberOfCells(section)
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return self.viewModel.getNumberOfSections()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(cellType: UserTableViewCell.self)
        cell.configCell(withUser: viewModel.userListViewModel[indexPath.row])
        cell.favoriteButtonCallback = { [weak self]  in
            self?.viewModel.userListViewModel[indexPath.row].isFavorite.toggle()
            cell.setFavoriteIcon(isFavorite: self?.viewModel.userListViewModel[indexPath.row].isFavorite ?? false)
        }
        return cell
    }
}

//MARK:  UITableViewDelegate
extension DashboardViewController: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let controller = DetailsViewController.instantiate(fromAppStoryboard: .Main)
        controller.detailsViewModel.userViewModel =  viewModel.userListViewModel[indexPath.row]
        navigationController?.pushViewController(controller, animated: true)
        // we can also use RXSwift here for two way binding
        controller.detailsViewModel.favoriteDateUpdateCallback = { [weak self] isFavorite in
            guard let self = self else { return }
            self.viewModel.userListViewModel[indexPath.row].isFavorite = isFavorite
            self.tableView.reloadData()
        }
    }
}
