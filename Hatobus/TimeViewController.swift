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
    
    //配列の定義var prefectures : [String] = []
    var prefectures : [String] = []
    
    //csvファイルを格納する配列
    var csvArray = [String]()
    //timeDataの1行ずつ格納する配列 var timeArray = [String]()
    var timeArray = [String]()
    //時間の行数のカウント変数を定義
    var timeCount = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        switch argString {
        case "高坂":
            //csvのファイルを読み込む
            csvArray = loadCSV(filename:"StartTakasaka")
            //ループ文で一つずつ見ていく
            while timeCount < 631 {
                print(timeCount,timeArray.count,csvArray.count)
                //csvArrayのtimeCount行目を,区切りで格納
                timeArray = csvArray[timeCount].components(separatedBy:",")
                //選択した時刻とcsvの時刻の一致した時の処理
                if argString3  == timeArray[1]{
                    prefectures = [timeArray[2],timeArray[3],timeArray[4]]
                    break
             }
            timeCount += 1
            }
            prefectures = ["該当する条件でのバスはありません" ]
            timeCount = 0
            break
            
        case "北坂戸":
            //csvのファイルを読み込む
            csvArray = loadCSV(filename:"StartKitasakado")
            //csvArrayのtimeCount行目を,区切りで格納
            timeArray = csvArray[timeCount+1].components(separatedBy:",")
                //選択した時刻とcsvの時刻の一致した時の処理
                if argString3  == timeArray[1]{
                    prefectures = [timeArray[2],timeArray[3],timeArray[4]]
                    break
             }
            
        case "熊谷":
            //csvのファイルを読み込む
            csvArray = loadCSV(filename:"StartKumagaya")
            //ループ文で一つずつ見ていく
            while timeCount < 631 {
                //csvArrayのtimeCount行目を,区切りで格納
                timeArray = csvArray[timeCount].components(separatedBy:",")
                //選択した時刻とcsvの時刻の一致した時の処理
                if argString3  == timeArray[1]{
                    prefectures = [timeArray[2],timeArray[3],timeArray[4]]
                    break
             }
            timeCount += 1
            }
            prefectures = ["該当する条件でのバスはありません" ]
            timeCount = 0
            break
            
        default:
            prefectures = ["該当する条件でのバスはありません" ]
        }
        
        // 背景色を設定
        self.view.backgroundColor = UIColor(displayP3Red: 0.90,green: 0.90, blue: 0.80, alpha: 1.0)
    }
    

    //CSVファイルを読み取るObject
    func loadCSV(filename: String) -> [String] {
        guard let csvBundle = Bundle.main.path(forResource: filename, ofType: "csv") else{return csvArray}
        do{
            let csvData = try String(contentsOfFile: csvBundle, encoding: String.Encoding.utf8)
            //\rで読み込み、\n行ごとに
            let linechange = csvData.replacingOccurrences(of:"\r", with:"\n")
            csvArray = linechange.components(separatedBy: "\n")
            csvArray.removeLast()
        }catch{
            print("エラー")
        }
        return csvArray
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
