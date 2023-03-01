//
//  AddViewController.swift
//  Table
//
//  Created by 김예린 on 2022/04/29.
//

import UIKit

class AddViewController: UIViewController, SendDataDelegate {

    //var selectedCategory = "카테고리 선택"
    
    func sendData(name: String) {
        btCategory.setTitle(name, for: .normal)
        //selectedCategory = name
    }

    @IBOutlet var tvTitle: UITextView!
    @IBOutlet var btCategory: UIButton!
    @IBOutlet var tvPrice: UITextView!
    @IBOutlet var tvContent: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    override func viewWillAppear(_ animated: Bool) {
        // btCategory.titleLabel?.text = selectedCategory
        // reloadData
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let destination = segue.destination as? CategoryTableViewController {
            destination.delegate = self
        }
    }
    
    // 새 목록 추가하기
    @IBAction func btnAddItem(_ sender: UIButton) {
        items.append(tvTitle.text!)
        itemPrice.append(tvPrice.text!)

        //itemImage.append(fileName)
        
        tvTitle.text = ""
        tvPrice.text = ""
        tvContent.text = ""
        
        _ = navigationController?.popViewController(animated: true)
    }
    
}
