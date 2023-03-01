//
//  DetailViewController.swift
//  Table
//
//  Created by 김예린 on 2022/04/29.
//

import UIKit

class DetailViewController: UIViewController {
    
    var receiveImage: UIImage?
    var receiveItem = ""
    var receivePosition = ""
    var receivePrice = ""

    @IBOutlet weak var imageItem: UIImageView!
    @IBOutlet var lblItem: UILabel!
    @IBOutlet weak var lblPosition: UILabel!
    @IBOutlet weak var lblPrice: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        imageItem.image = receiveImage
        lblItem.text = receiveItem
        lblPosition.text = receivePosition
        lblPrice.text = receivePrice
    }
    
    // Main View에서 변수를 받아오기 위한 함수
    func receiveImage(_ item: UIImage) {
        receiveImage = item
    }
    
    func receiveItem(_ item: String) {
        receiveItem = item
    }
    
    func receivePosition(_ item: String) {
        receivePosition = item
    }
    
    func receivePrice(_ item: String) {
        receivePrice = item
    }

}
