//
//  CategoryTableViewController.swift
//  Table
//
//  Created by 김예린 on 2022/07/30.
//

import UIKit

protocol SendDataDelegate: AnyObject {
    func sendData(name: String)
}

var category = ["디지털기기", "생활가전", "가구/인테리어", "유아동", "유아도서", "생활/가공식품", "스포츠/레저", "여성잡화", "여성의류", "남성패션/잡화", "게임/취미", "뷰티/미용", "반려동품용품", "도서/티켓/음반", "식물", "기타 중고물품", "삽니다"]

class CategoryTableViewController: UITableViewController {

    weak var delegate: SendDataDelegate?
    
    @IBOutlet var categoryList: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }

    @IBAction func categoryChange(_ sender: UIButton) {
        self.delegate?.sendData(name: (sender.titleLabel?.text)!)
        
        //guard let vc = self.presentingViewController as? AddViewController else { return }
        //vc.selectedCategory = (sender.titleLabel?.text)!
        //self.presentingViewController?.dismiss(animated: true)
        
        _ = navigationController?.popViewController(animated: true)
    }
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return category.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell = tableView.dequeueReusableCell(withIdentifier: "CCell", for: indexPath) as! CategoryTableViewCell

        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView

        cell.categorySelect?.titleLabel?.text = category[(indexPath as NSIndexPath).row]
        
        return cell
    }

}
