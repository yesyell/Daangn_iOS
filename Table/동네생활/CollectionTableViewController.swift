//
//  CollectionTableViewController.swift
//  Table
//
//  Created by 김예린 on 2022/07/29.
//

import UIKit

var categoryName = ["동네질문", "동네맛집", "동네소식", "취미생활", "분실/실종센터", "동네사건사고", "해주세요", "일상", "동네사진전"]
var question = ["Q. 헬스장 추천해주세요!", "Q. 마라탕 맛집 있나요?", "Q. 오늘 스크린 골프 같이 하실 분..?","Q. 양재천에서 조깅 하실 분~","Q. 24시 약국 있을까요?","Q. 이 지갑 주우신 분 있나요 ㅠㅠ","Q. 테니스 같이 쳐요~"]

class CollectionTableViewController: UIViewController, UITableViewDelegate, UITableViewDataSource, UICollectionViewDelegate, UICollectionViewDataSource {

    @IBOutlet weak var listView: UITableView!
    @IBOutlet weak var clistView: UICollectionView!
    
    let titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        listView.delegate = self
        listView.dataSource = self
        
        
        
        listView.tableHeaderView = clistView

        titleLabel.textColor = UIColor.black
        titleLabel.text = "RC동"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)

        listView.separatorStyle = .singleLine
        listView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    // MARK: - Table view data source
    
    override func viewWillAppear(_ animated: Bool) {
        listView.reloadData() // 추가된 내용을 목록으로 불러들임
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return question.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "QCell", for: indexPath) as! CustomTableViewCell4

        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        
        cell.lbCategory?.text = categoryName[(indexPath as NSIndexPath).row]
        cell.lbQuestion?.text = question[(indexPath as NSIndexPath).row]
        
        return cell
    }
    
    // MARK: - Collection view data source
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return categoryName.count
    }

    func numberOfSections(in collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "CCell", for: indexPath) as! CustomCollectionViewCell

        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView
        
        cell.clbCategory?.text = categoryName[(indexPath as NSIndexPath).row]
        
        return cell
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
