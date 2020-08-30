//
//  ViewController2.swift
//  NetworkPractice
//
//  Created by 권성우 on 2020/08/08.
//  Copyright © 2020 권성우. All rights reserved.
//

import UIKit
import SnapKit

struct Course : Decodable{
    var id : Int
    var name : String
    var link : String
    var imageUrl : String
    var number_of_lessons : Int
}

class ViewController2: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = UIColor.white
        
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(moveBack))
        // Do any additional setup after loading the view.
        
        view.addSubview(button)
        view.addSubview(label)
        setUpUi()
        
    }

    @objc func moveBack(){
        dismiss(animated: true, completion: nil)
    }
    
    let button : UIButton = {
        let btn = UIButton(type: .system)
        btn.setTitle("Get json", for: .normal)
        btn.setTitleColor(UIColor.black, for: UIControl.State())
        btn.backgroundColor = UIColor(red: 80, green: 101, blue: 161, alpha: 1)
        btn.translatesAutoresizingMaskIntoConstraints = false
        btn.addTarget(self, action: #selector(callCurrentTime), for: .touchUpInside)
        return btn
    }()
    
    let label : UILabel = {
        let lbl = UILabel()
        lbl.text = "label"
        return lbl
    }()
    
    func setUpUi(){
        button.snp.makeConstraints { (m) in
            m.centerX.equalToSuperview()
            m.top.equalTo(view).offset(80)
            m.height.greaterThanOrEqualTo(button)
            m.width.greaterThanOrEqualTo(button)
        }
        label.snp.makeConstraints { (m) in
            m.centerX.equalTo(view)
            m.top.equalTo(button).offset(30)
            m.height.greaterThanOrEqualTo(label)
            m.width.greaterThanOrEqualTo(label)
        }
    }
    
    @objc func callCurrentTime(){
        let urlString = "https://api.letsbuildthatapp.com/jsondecodable/courses"
        
        guard let url = URL(string : urlString) else {return}
        
        URLSession.shared.dataTask(with: url) { (data, response, err) in
            guard let data = data else { return }
            do{
                let course = try JSONDecoder().decode([Course].self, from: data)
                DispatchQueue.main.async {
                    self.label.text = course[0].name
                }
            }catch let jsonError{
                print("error : \(jsonError)")
            }
        }.resume()

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
