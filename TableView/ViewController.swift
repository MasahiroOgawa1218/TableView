//
//  ViewController.swift
//  TableView
//
//  Created by 小川真広 on 2017/06/09.
//  Copyright © 2017年 myname. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    
    let records = [["name" : " 博多ラーメン","description": "主に福岡県福岡市で作られる、豚骨スープとストレートの細麺をベースにした日本のラーメン。"],
                   ["name" : " 札幌ラーメン","description": "北海道札幌市発祥のラーメン一般を指す通称である。"],
                   ["name" : " 喜多方ラーメン","description": "福島県喜多方市発祥のご当地ラーメン（ご当地グルメ）である。"],
                   ["name" : " 熊本ラーメン","description": "熊本県熊本市を中心に作られるラーメン。"],
                   ["name" : " 台湾ラーメン","description": "主に中京圏の中華料理店・台湾料理店にて供されるラーメンの一種である。"]]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.]
        
        tableView.dataSource = self
        tableView.delegate = self
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

    // MARK: - UITableViewDataSource
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return records.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
         let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CustomTableViewCell
        
        let record = records[indexPath.row]
        cell.label.text = record["name"]
        
        return cell
    }
    
    // MARK: - UITableViewDelegate
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        guard let vc = storyboard?.instantiateViewController(withIdentifier: "detailViewController") as?
            DetailViewController else {
                return
        }
         let record = records[indexPath.row]
        vc.desc = record["description"]
        navigationController?.pushViewController(vc, animated: true)
    }
    
    
}
