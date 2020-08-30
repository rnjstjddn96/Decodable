//
//  ViewController.swift
//  NetworkPractice
//
//  Created by 권성우 on 2020/08/05.
//  Copyright © 2020 권성우. All rights reserved.
//

import UIKit
import SnapKit

class ViewController: UITableViewController{
    var idArr = Array<Int>()
    var nameArr = [String]()
    
    struct WebsiteDescription : Decodable{
        let name : String
        let description : String
        let courses : [Course]
    }
    
    struct Course : Decodable{
        let id : Int?
        let name : String?
        let link : String?
        let imageUrl : String?
        
        //                swift 2/3/ObjC
        //        init(json: [String : Any]) {
        //            id = json["id"] as? Int ?? 1
        //            name = json["name"] as? String ?? ""
        //            link = json["link"] as? String ?? ""
        //            imageUrl = json["imageUrl"] as? String ?? ""
        //        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell")
        navigationItem.title = "JSON"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationItem.rightBarButtonItem = UIBarButtonItem(title: "VC2", style: .plain, target: self, action: #selector(moveForward))
        
        loadData()
    }
    
    
    func loadData(){
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        guard let url = URL(string: jsonUrlString) else { return }
        
        
        let task = URLSession.shared.dataTask(with: url) { (data, respone, err) in
            if err != nil {
                print("\(err!.localizedDescription)")
                return
            }
            guard let data = data else { return }
            //            let dataString = String(data: data, encoding: .utf8)
            //            print(dataString)
            do {
                //                swift 2/3/ObjC
                //                guard let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String : Any]
                //                    else {return}
                ////                print(json)
                //                let course = Course(json: json)
                //                print(course.name)
                let courses = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    for i in courses{
                        if let id = i.id{
                            self.idArr.append(id)
                        }
                    }
                    for i in courses{
                        if let name = i.name{
                            self.nameArr.append(name)
                        }
                    }
                    self.tableView.reloadData()
                }
            }catch let jsonErr {
                print(jsonErr)
            }
            
        }
        
                task.resume()
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.idArr.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        cell.textLabel?.text = "\(self.nameArr[indexPath.row])"
        return cell
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let dvc = DetailViewController()
        dvc.param = self.nameArr[indexPath.row]
        present(dvc, animated: true, completion: nil)
    }
    
    @objc func moveForward(){
        let navController  = UINavigationController(rootViewController: ViewController2())
        navController.modalPresentationStyle = .fullScreen
        present(navController, animated: true, completion: nil)
    }
    
    
}

