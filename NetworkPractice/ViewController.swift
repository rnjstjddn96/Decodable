//
//  ViewController.swift
//  NetworkPractice
//
//  Created by 권성우 on 2020/08/05.
//  Copyright © 2020 권성우. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
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
        
        let jsonUrlString = "https://api.letsbuildthatapp.com/jsondecodable/courses_missing_fields"
        guard let url = URL(string: jsonUrlString) else { return }
        
        URLSession.shared.dataTask(with: url) { (data, respone, err) in
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
                print(courses[2].name!)
                
                
            }catch let jsonErr {
                print(jsonErr)
            }
        }.resume()
    }
    
    
}

