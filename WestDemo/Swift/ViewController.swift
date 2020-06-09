//
//  ViewController.swift
//  WestDemo
//
//  Created by seven on 2020/5/14.
//  Copyright © 2020 west. All rights reserved.
//

import UIKit
let Width = UIScreen.main.bounds.width;
let Height = UIScreen.main.bounds.height;

class ViewController: UIViewController {
    var tableView = UITableView()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.configUI()
    }

    func configUI() {
        self.title = "Test";
        self.tableView = UITableView.init(frame: self.view.bounds, style: .plain);
        self.view.addSubview(self.tableView);
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "cell");
        self.tableView.delegate = self;
        self.tableView.dataSource = self ;
    }
    

}

// MARK:tableViewDelegate
extension ViewController :UITableViewDelegate,UITableViewDataSource{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 10 ;
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath);
        
        switch indexPath.row {
        case 0:
            cell.textLabel?.text = "震动反馈";
            break;
        case 1:
            cell.textLabel?.text = "按钮震动效果";
        default:
            break;
        }
        
        
        return cell;
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        switch indexPath.row {
        case 0:
            self.navigationController?.pushViewController(FeedbackGeneratorTableViewController(), animated:true);
            
        case 1:
            self.navigationController?.pushViewController(CateViewController(), animated: true);
        default:
            break;
        }
    }
    
}
