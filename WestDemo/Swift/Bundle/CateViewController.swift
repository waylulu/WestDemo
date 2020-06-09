//
//  CateViewController.swift
//  WestDemo
//
//  Created by seven on 2020/6/9.
//  Copyright © 2020 west. All rights reserved.
//

import UIKit
class CateViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.white;
        let btn = UIButton.init(frame: CGRect(x: 0, y: 100, width: Width, height: 50));
        btn.setTitle("点击震动反馈", for: .normal);
        btn.setTitleColor(UIColor.red, for: UIControl.State.normal);
        btn.addTarget(self, action: #selector(self.click), for: .touchUpInside);
        
        self.view.addSubview(btn);
    }
    
    @objc func click() {
        print("click");
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
