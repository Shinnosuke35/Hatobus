//
//  TimeViewController.swift
//  Hatobus
//
//  Created by 手塚晋之介 on 2021/05/17.
//

import UIKit

class TimeViewController: UIViewController ,UITableViewDelegate ,UITableViewDataSource{
    //TableViewに表示したいセルの数の定義するメソッド
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.prefectures.count;
    }
    //セルを生成して返却するメソッド
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        // セルを作成。 デフォルトのスタイルを選択。
        let cell = UITableViewCell(style: .default, reuseIdentifier: "cell")
        
        // セルにテキストを設定。
        cell.textLabel?.text = self.prefectures[indexPath.row]
        return cell
    }
    
    
    //ViewcontllorからSegueで引き継いだデータ（文字列）
    var argString = ""
    var argString2 = ""
    var argString3 = ""
    
    //配列の定義
    var prefectures : [String] = []
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        switch argString {
        case "高坂":
            if argString2 == "電機大学" {
                if argString3 == "16:00" {
                    prefectures = ["16:10発","16:18発","16:30発" ]
                }
            }
        default:
            prefectures = ["該当する条件でのバスはありません" ]
        }
        
        // 背景色を設定
        self.view.backgroundColor = UIColor(displayP3Red: 1.0,green: 1.0, blue: 0.90, alpha: 1.0)
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
