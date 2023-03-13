//
//  StartViewController.swift
//  DZ#8_3MES
//
//  Created by Nurlan Seitov on 12/3/23.
//

import UIKit
import Foundation
import SnapKit


class StartViewController: UIViewController {

    private let cellID = "cell"
    
    private let searchBar = UISearchBar()
    private let tableView = UITableView()
     
     private var users: [User] = []
     private var filteredUsers: [User] = []
     
     private var isFiltered: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()

        confire()
        initUIC()
        iniData()
        
    }

    private func confire() {
        view.backgroundColor = .white
        navigationItem.titleView = searchBar
        searchBar.placeholder = "Search"
        tableView.dataSource = self
        searchBar.delegate = self
        tableView.register(UINib(nibName: "TableViewCell", bundle: nil), forCellReuseIdentifier: cellID)
    }
    private func initUIC(){
        view.addSubview(tableView)

        tableView.snp.makeConstraints { make in
            make.leading.trailing.top.bottom.equalToSuperview().inset(0)

        }

    }
    private func iniData() {
        users.append(User(nameOne: "@jenna ortega", nameTwo: "@jenna ortega", imageOne: "jenna-ortega"))
        users.append(User(nameOne: "@kristian beil", nameTwo: "@kristian beil", imageOne: "kristian-beil"))
        users.append(User(nameOne: "@nataly", nameTwo: "@nataly", imageOne: "dev"))
        users.append(User(nameOne: "@robert de niro", nameTwo: "@robert de niro", imageOne: "robert-de-niro"))
        users.append(User(nameOne: "@jason statham", nameTwo: "@jason statham", imageOne: "jason-statham"))
        users.append(User(nameOne: "@penelopa", nameTwo: "@penelopa", imageOne: "penelopa"))
        users.append(User(nameOne: "@justin timberleyk", nameTwo: "@justin timberleyk", imageOne: "images2"))
        users.append(User(nameOne: "@anjelina joli", nameTwo: "@anjelina joli", imageOne: "anjelina-joli"))
        
        
    }
}

extension StartViewController: UITableViewDataSource, UITableViewDelegate {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        isFiltered ? filteredUsers.count : users.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        //let cell = UITableViewCell(style: .value1, reuseIdentifier: "cell")
        let cell = tableView.dequeueReusableCell(withIdentifier: cellID) as! TableViewCell
        
        cell.initUI(name1: users[indexPath.row].nameOne, name2: users[indexPath.row].nameTwo, image: users[indexPath.row].imageOne)
        
        cell.imageViewtable.layer.cornerRadius = 35
        cell.imageViewtable.layer.borderWidth = 1
        cell.imageViewtable.layer.borderColor = UIColor.gray.cgColor
        
        cell.imageViewtable.clipsToBounds = true
        
        cell.labelTable2.textColor = .gray
        
       // cell.textLabel?.text = students[indexPath.row]
//        cell.textLabel?.text = isFiltered ? filteredUsers[indexPath.row]
//                                            : users[indexPath.row]
//
        cell.labelTable1?.text = isFiltered ? filteredUsers[indexPath.row].nameOne
        :  users[indexPath.row].nameOne
        //    users[indexPath.row].imageOne 
        
        return cell
    }
    
}

extension StartViewController: UISearchBarDelegate {
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        
        if searchText.isEmpty {
            isFiltered = false
        } else {
            isFiltered = true
            
            // filteredStudents = students.filter { $0.contains(searchText)
          //  filteredUsers = users.filter { $0.lowercased().contains(searchText.lowercased())
            filteredUsers = users.filter { $0.nameOne.lowercased().contains(searchText.lowercased())
                
            }
            
        }
           tableView.reloadData()
        // print("searchText: \(searchText)")
    }
}


