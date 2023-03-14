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
        tableView.delegate = self
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
        
//        cell.textLabel?.text = isFiltered ? filteredUsers[indexPath.row]
//                                            : users[indexPath.row]
//
       if isFiltered  {
           cell.labelTable1?.text = filteredUsers[indexPath.row].nameOne
           cell.labelTable2?.text = filteredUsers[indexPath.row].nameTwo
           cell.imageViewtable?.image = UIImage(named: filteredUsers[indexPath.row].imageOne)
           cell.layer.cornerRadius = 10
           cell.layer.borderWidth = 1
           cell.layer.borderColor = UIColor.red.cgColor
           
        }
        else
        {
            cell.labelTable1?.text = users[indexPath.row].nameOne
            cell.labelTable2?.text = users[indexPath.row].nameTwo
            cell.imageViewtable?.image = UIImage(named: users[indexPath.row].imageOne)
            cell.layer.cornerRadius = 10
            cell.layer.borderWidth = 1
            cell.layer.borderColor = UIColor.white.cgColor
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        100
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
       
       let thirthVC = ThirthViewController()
        self.navigationController?.pushViewController(thirthVC, animated: true)
        
//        let viewController = StartViewController() //your start view
//        let navigation = UINavigationController(rootViewController: viewController)
//        let tabItem1 = UITabBarItem(title: "First VC",
//                                    image: UIImage(systemName: "magnifyingglass"),
//                                    selectedImage: UIImage(systemName: "magnifyingglass"))
//
//
//        let secondVC = SecondViewController()
//        let tabbar = UITabBarController()
//        let tabItem2 = UITabBarItem(title: "Second VC",
//                                    image: UIImage(systemName: "book"),
//                                    selectedImage: UIImage(systemName: "book"))
//
//        secondVC.tabBarItem = tabItem2
//        tabbar.viewControllers = [navigation, secondVC]
        
        
        if isFiltered  {
            thirthVC.name = "\(filteredUsers[indexPath.row].nameOne)"
            thirthVC.imageName = filteredUsers[indexPath.row].imageOne
        } else
        {
            thirthVC.name = "\(users[indexPath.row].nameOne)"
            thirthVC.imageName = users[indexPath.row].imageOne
        }
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
            filteredUsers = users.filter { $0.nameOne.lowercased().contains(searchText.lowercased()) }
          //  filteredUsers = users.filter { $0.imageOne }
            
        }
           tableView.reloadData()
        
    }
}


