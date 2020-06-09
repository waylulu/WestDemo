//
//  FeedbackGeneratorTableViewController.swift
//  WestDemo
//
//  Created by seven on 2020/6/9.
//  Copyright © 2020 west. All rights reserved.
//

import UIKit
import AudioToolbox

class FeedbackGeneratorTableViewController: UITableViewController {
    var dataArr = [["light","medium","heavy"],["success","warning","error"],["selectionChanged"],["AudioServicesPlaySystemSound"]];
    override func viewDidLoad() {
        super.viewDidLoad()

        self.title = "震动反馈";
        self.tableView.register(UITableViewCell.self, forCellReuseIdentifier: "reuseIdentifier")
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return dataArr.count
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
     
        return dataArr[section].count
    }

    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "reuseIdentifier", for: indexPath)
        cell.textLabel?.text = dataArr[indexPath.section][indexPath.row];
        return cell
    }
    
    override func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let label = UILabel.init(frame: CGRect.init(x: 0, y: 0, width: Width, height: 30));
        label.backgroundColor = UIColor.gray;
        switch section {
        case 0:
            label.text = "FeedbackGenerator";
            break;
        case 1:
            label.text = "UINotificationFeedbackGenerator";
            break;
        case 2:
            label.text = "UISelectionFeedbackGenerator";
            break;
        case 3:
            label.text = "AudioServicesPlaySystemSound";
            break;
        default:
            break;
        }
        
        return label;
    }
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true);
        self.feedbackGeneratorindexPath(indexPath: indexPath)
    }
    
    
    func feedbackGeneratorindexPath( indexPath:IndexPath){
        
        switch indexPath.section {
        case 0:
            if indexPath.row == 0 {
                let gen = UIImpactFeedbackGenerator.init(style: .light);
                gen.prepare();//反馈延迟最小化
                gen.impactOccurred()//触发效果
            }else if indexPath.row == 1{
                let gen = UIImpactFeedbackGenerator.init(style: .medium);
                gen.prepare();//反馈延迟最小化
                gen.impactOccurred()//触发效果
            }else{
                let gen = UIImpactFeedbackGenerator.init(style: .heavy);
                gen.prepare();//反馈延迟最小化
                gen.impactOccurred()//触发效果
            }
            /**
             @available(iOS 13.0, *)
             case soft = 3

             @available(iOS 13.0, *)
             case rigid = 4
             */
            break;
        case 1:
            let gen = UINotificationFeedbackGenerator.init()
            if indexPath.row == 0 {
                gen.notificationOccurred(.success);
            }else if indexPath.row == 1{
                gen.notificationOccurred(.warning);
            }else{
                gen.notificationOccurred(.error);
            }
            break;
        case 2:
            //        选择时
            let gen = UISelectionFeedbackGenerator.init();
            gen.selectionChanged();
        case 3:
              //message提醒震动太大
            AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
        default:
            break;
        }
        /*
                 let gen = UIImpactFeedbackGenerator.init(style: .light);//light震动效果的强弱
                 gen.prepare();//反馈延迟最小化
                 gen.impactOccurred()//触发效果
         //
                 //处理某类试件反馈
         //        let gen = UINotificationFeedbackGenerator.init()
         //        gen.notificationOccurred(.warning);//效果
                 
         //        选择时
         //        let gen = UISelectionFeedbackGenerator.init();
         //        gen.selectionChanged();
                 
                 
                 //message提醒震动太大
         //        AudioServicesPlaySystemSound(kSystemSoundID_Vibrate);
         
         */

    }
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    /*
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    */

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
