//
//  TableViewController.swift
//  Table
//
//  Created by 김예린 on 2022/04/29.
//

import UIKit

// 앱 시작 시 기본적으로 나타낼 목록
var items = ["갤럭시탭 s7+ 팝니다", "아이폰 8 실버", "아이폰 11 프로 64 하자X", "애플 매직키보드2 영문자판", "아이패드 에어4"]
var position = ["마포구 아현동", "은평구 역촌동", "마포구 대흥동", "연남동", "상수동", "RC동"]
var itemPrice = ["600,000원", "110,000원", "450,000원", "90,000원", "550,000"]
var itemImage = ["갤탭.png", "8실버.png", "11프로.png", "키보드.png", "아이패드.png", "애플워치.png"]

class TableViewController: UITableViewController {

    @IBOutlet var tvListView: UITableView!
    
    let titleLabel = UILabel()

    override func viewDidLoad() {
        super.viewDidLoad()

        titleLabel.textColor = UIColor.black
        titleLabel.text = "상수동"
        titleLabel.font = UIFont.systemFont(ofSize: 20, weight: .bold)
        self.navigationItem.leftBarButtonItem = UIBarButtonItem.init(customView: titleLabel)

        tvListView.separatorStyle = .singleLine
        tvListView.separatorInset = UIEdgeInsets(top: 0, left: 15, bottom: 0, right: 15)
    }
    
    // 뷰가 노출될 떄마다 리스트의 데이터를 다시 불러옴
    override func viewWillAppear(_ animated: Bool) {
        tvListView.reloadData() // 추가된 내용을 목록으로 불러들임
    }

    // MARK: - Table view data source
    // 테이블 안의 섹션 개수를 1로 설정함
    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }
    
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 150
    }

    // 섹션당 열의 개수를 전달
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return items.count
    }

    // items와 itemsImageFile의 값을 셀에 대입함
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell = tableView.dequeueReusableCell(withIdentifier: "myCell", for: indexPath) as! CustomTableViewCell
        
        let backgroundView = UIView()
        backgroundView.backgroundColor = UIColor.clear
        cell.selectedBackgroundView = backgroundView

        cell.productImage.image = UIImage(named: itemImage[(indexPath as NSIndexPath).row])
        cell.productName?.text = items[(indexPath as NSIndexPath).row]
        cell.uploadedPosition?.text = position[(indexPath as NSIndexPath).row]
        cell.price?.text = itemPrice[(indexPath as NSIndexPath).row]
        
        cell.selectionStyle = .none
        
        return cell
    }
    
    // MARK: - Navigation

    // 새그웨이를 이용하여 디테일 뷰로 전환하기
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
        if segue.identifier == "sgDetail" {
            let cell = sender as! UITableViewCell
            let indexPath = self.tvListView.indexPath(for: cell)
            let detailView = segue.destination as! DetailViewController
            
            detailView.receiveImage(UIImage(named: itemImage[((indexPath! as NSIndexPath).row)])!)
            detailView.receiveItem(items[((indexPath! as NSIndexPath).row)])
            detailView.receivePosition(position[((indexPath! as NSIndexPath).row)])
            detailView.receivePrice(itemPrice[((indexPath! as NSIndexPath).row)])
            
        }
    }

}
