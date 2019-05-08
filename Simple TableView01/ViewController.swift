//
//  ViewController.swift
//  Simple TableView01
//
//  Created by D7703_07 on 2019. 5. 8..
//  Copyright © 2019년 1234. All rights reserved.
//

import UIKit

class ViewController: UIViewController,UITableViewDataSource,UITableViewDelegate {

    @IBOutlet weak var myTableView: UITableView!
    var animals = ["Cat","Horse","Pig","Whale","Dog","Bird"]
    var year = ["3","5","2","6","8","2"]
    override func viewDidLoad() {
        super.viewDidLoad()
        // Delegate 객체와 ViewController의 연결
        myTableView.dataSource = self
        myTableView.delegate = self
        
    }
    //UITableViewDataSource Delegate 메소드
    public func tableView(_ tableView: UITableView, numberOfRowsInSection
        section: Int) -> Int{
        return animals.count
    }
    
    public func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell{
        //cell 을 생성, 메모리 풀(cell identifier)을 검사해서 있으면 가져와서 재활용하고,
        //없으면 새로생성,다음 재활용을 위해  메모리 풀에 저장
        let myCell = myTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
        let myRow = indexPath.row
        let mySection = indexPath.section
        myCell.textLabel?.text = animals[myRow]
        //myCell.detailTextLabel?.text = year[myRow]
        myCell.detailTextLabel?.text = "Section = \(mySection)Row=\(myRow)"
        //cell에 이미지 넣기
        myCell.imageView?.image = UIImage(named: animals[myRow])
        
        return myCell
    }
    public func numberOfSections(in tableView: UITableView) -> Int{
    return 1
    }
    public func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String?{
        if section == 0{
            return "section header\(section)"
        }else {
            return "section header\(section)"
        }
    }
    public func tableView(_ tableView: UITableView, titleForFooterInSection section: Int) -> String?{
        if section == 0{
            return "section footer\(section)"
        }else {
            return "section footer\(section)"
        }
    }
    //UITableViewDelegate 메소드 연결
    public func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat{
        return 100.0
    }
}

