//
//  ViewController1.swift
//  NetworkPractice
//
//  Created by 권성우 on 2020/08/07.
//  Copyright © 2020 권성우. All rights reserved.
//

import UIKit
import SnapKit

class ViewController1: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        navigationItem.leftBarButtonItem = UIBarButtonItem(title: "Back", style: .plain, target: self, action: #selector(moveback))
//        view.addSubview(container)
//        setUpUi()
    }
    
    var container : UIView{
        let view = UIView()
        view.backgroundColor = UIColor.lightGray
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }
    
    func setUpUi(){
        container.snp.makeConstraints { (m) in
            m.center.equalTo(self.view)
            m.height.equalTo(100)
            m.width.equalTo(100)
        }
    }
    
    @objc func moveback(){
        dismiss(animated: true, completion: nil)
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
