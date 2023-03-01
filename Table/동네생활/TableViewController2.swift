//
//  TableViewController2.swift
//  Table
//
//  Created by 김예린 on 2022/07/28.
//

import UIKit

var personID = ["감자", "옥수수", "고구마", "도토리", "토마토", "양파"]
var content = ["구매 가능할까요?", "도착했어요!", "아직 거래 가능한 상품인가요?", "혹시 구매 취소하시나요~", "배터리 성능 보여주세요", "네 알겠습니다."]

class TableViewController2: UITableViewController {
    
    @IBOutlet var chattingView: UITableView!
    
    let titleLabel = UILabel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        titleLabel.textColor = UIColor.black
        titleLabel.text = "채팅"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
        
        chattingView.separatorStyle = .singleLine
        chattingView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }

    // MARK: - Table view data source
    
    override func viewWillAppear(_ animated: Bool) {
        chattingView.reloadData() // 추가된 내용을 목록으로 불러들임
    }
    
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return personID.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "chatCell", for: indexPath) as! CustomTableViewCell2

        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        
        cell.personImg.image = UIImage(named: "loopy.png")
        cell.lbpersonName?.text = personID[(indexPath as NSIndexPath).row]
        cell.lbcontent?.text = content[(indexPath as NSIndexPath).row]
        
        return cell
    }

    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            // Delete the row from the data source
            personID.remove(at: (indexPath as NSIndexPath).row)
            content.remove(at: (indexPath as NSIndexPath).row)
            tableView.deleteRows(at: [indexPath], with: .fade)
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
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
