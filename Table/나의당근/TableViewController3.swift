//
//  TableViewController3.swift
//  Table
//
//  Created by 김예린 on 2022/07/29.
//

import UIKit

var sections = ["나의 활동", "우리 동네", "사장님 메뉴", "기타"]
var myAction = ["내 동네 설정", "동네 인증하기", "키워드 알림", "모아보기", "당근가계부", "관심 카테고리 설정"]
var ourVillage = ["동네생활 글/댓글", "동네홍보 글", "동네 가게 후기", "저장한 장소", "내 단골 가게", "받은 쿠폰함"]
var headMenu = ["비즈프로필 만들기", "광고"]
var others = ["친구초대", "공지사항", "자주 묻는 질문", "앱 설정"]

class TableViewController3: UIViewController, UITableViewDelegate {
    
    @IBOutlet weak var listView: UITableView!
    //@IBOutlet weak var profileView: UIView!
    
    let titleLabel = UILabel()

    override func viewDidLoad() { 
        super.viewDidLoad()

        listView.delegate = self
        listView.dataSource = self
        
        //var header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 280))
        //let header = profileView
        //listView.tableHeaderView = profileView
        
        titleLabel.textColor = UIColor.black
        titleLabel.text = "나의 당근"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)
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

extension TableViewController3: UITableViewDataSource {
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50.0
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return sections.count
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        return sections[section]
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section == 0 {
            return myAction.count
        } else if section == 1 {
            return ourVillage.count
        } else if section == 2 {
            return headMenu.count
        } else if section == 3 {
            return others.count
        } else {
            return 0
        }
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomTableViewCell3
        
        if indexPath.section == 0 {
            cell.lbList?.text = "\(myAction[indexPath.row])"
        } else if indexPath.section == 1 {
            cell.lbList?.text = "\(ourVillage[indexPath.row])"
        } else if indexPath.section == 2 {
            cell.lbList?.text = "\(headMenu[indexPath.row])"
        } else if indexPath.section == 3 {
            cell.lbList?.text = "\(others[indexPath.row])"
        } else {
            return UITableViewCell()
        }
        
        return cell
    }
    
}
