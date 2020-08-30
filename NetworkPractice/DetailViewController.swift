//
//  DetailViewController.swift
//  NetworkPractice
//
//  Created by 권성우 on 2020/08/10.
//  Copyright © 2020 권성우. All rights reserved.
//

import UIKit
import SnapKit

class DetailViewController: UIViewController {
    var param = String()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.backgroundColor = .white
        // Do any additional setup after loading the view.
        view.addSubview(label)
        setLabel(text: param)
    }
    
    let label : UILabel = {
        let lbl = UILabel()
        lbl.translatesAutoresizingMaskIntoConstraints = false
        lbl.text = "111111"
        lbl.font = .systemFont(ofSize: 25)
       return lbl
    }()
    
    func setLabel(text : String){
        label.snp.makeConstraints { (m) in
            m.center.equalToSuperview()
            m.height.equalTo(label)
            m.width.equalTo(label)
        }
        label.text = text
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
