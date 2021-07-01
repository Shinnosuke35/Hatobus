//
//  TimeViewController.swift
//  Hatobus
//
//  Created by 手塚晋之介 on 2021/05/17.
//

import UIKit

class TimeViewController: UIViewController {
    
    //ViewcontllorからSegueで引き継いだデータ（文字列）
    var argString = ""
    var argString2 = ""
    var argString3 = ""
    var argString4 = ""
    
    //Labelテキスト
    @IBOutlet weak var Reigai: UILabel!
    @IBOutlet weak var Time01: UILabel!
    @IBOutlet weak var Time02: UILabel!
    @IBOutlet weak var Time03: UILabel!
    @IBOutlet weak var Time11: UILabel!
    @IBOutlet weak var Time22: UILabel!
    @IBOutlet weak var Time33: UILabel!
    
    //csvファイルを格納する配列
    var csvArray = [String]()
    //timeDataの1行ずつ格納する配列 var timeArray = [String]()
    var timeArray = [String]()
    //時間の行数のカウント変数を定義
    var timeCount = 0
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //　期間を判別
        if argString4 == "土曜日" {
            switch argString {
            case "高坂":
                //csvのファイルを読み込む
                csvArray = loadCSV(filename:"DoyoStartTakasaka")
                //ループ文で一つずつ見ていく
                while timeCount < 1441 {
                    print(timeCount,timeArray.count,csvArray.count)
                    //csvArrayのtimeCount行目を,区切りで格納
                    timeArray = csvArray[timeCount].components(separatedBy:",")
                    //選択した時刻とcsvの時刻の一致した時の処理
                    if argString3  == timeArray[0] {
                        
                        Time01.text = timeArray[1]
                        Time02.text = timeArray[2]
                        Time03.text = timeArray[3]
                        
                        if Time01.text != "本日の運行は終了しました。"{
                            timeCount = 0
                            while timeCount < 1441 {
                                timeArray = csvArray[timeCount].components(separatedBy:",")
                                if timeArray[0]  == Time01.text {
                                    timeCount += 15
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    Time11.text = timeArray[0]
                                    break
                                }
                                timeCount += 1
                            }
                            if Time02.text != "これ以降の運行時刻はありません。"{
                                timeCount = 0
                                while timeCount < 1441 {
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    if timeArray[0]  == Time02.text {
                                        timeCount += 15
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        Time22.text = timeArray[0]
                                        break
                                    }
                                    timeCount += 1
                                }
                                if Time03.text !=  "これ以降の運行時刻はありません。" {
                                    timeCount = 0
                                    while timeCount < 1441 {
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        if timeArray[0]  == Time03.text {
                                            timeCount += 15
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            Time33.text = timeArray[0]
                                            break
                                        }
                                        timeCount += 1
                                    }
                                }
                            }
                        }
                        break
                    }
                timeCount += 1
                }
                break
                //prefectures = ["該当する条件でのバスはありません" ]
                //timeCount = 0
                
            
            case "北坂戸":
                //csvのファイルを読み込む
                csvArray = loadCSV(filename:"DoyoStartKitasakado")
                //ループ文で一つずつ見ていく
                while timeCount < 1441 {
                    print(timeCount,timeArray.count,csvArray.count)
                    //csvArrayのtimeCount行目を,区切りで格納
                    timeArray = csvArray[timeCount].components(separatedBy:",")
                    //選択した時刻とcsvの時刻の一致した時の処理
                    if argString3  == timeArray[0] {
                        
                        Time01.text = timeArray[1]
                        Time02.text = timeArray[2]
                        Time03.text = timeArray[3]
                        
                        if Time01.text != "本日の運行は終了しました。"{
                            timeCount = 0
                            while timeCount < 1441 {
                                timeArray = csvArray[timeCount].components(separatedBy:",")
                                if timeArray[0]  == Time01.text {
                                    timeCount += 25
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    Time11.text = timeArray[0]
                                    break
                                }
                                timeCount += 1
                            }
                            if Time02.text != "これ以降の運行時刻はありません。"{
                                timeCount = 0
                                while timeCount < 1441 {
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    if timeArray[0]  == Time02.text {
                                        timeCount += 25
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        Time22.text = timeArray[0]
                                        break
                                    }
                                    timeCount += 1
                                }
                                if Time03.text !=  "これ以降の運行時刻はありません。" {
                                    timeCount = 0
                                    while timeCount < 1441 {
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        if timeArray[0]  == Time03.text {
                                            timeCount += 25
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            Time33.text = timeArray[0]
                                            break
                                        }
                                        timeCount += 1
                                    }
                                }
                            }
                        }
                        break
                    }
                timeCount += 1
                }
                break
                
                
            case "熊谷":
                //csvのファイルを読み込む
                csvArray = loadCSV(filename:"DoyoStartKumagaya")
                //ループ文で一つずつ見ていく
                while timeCount < 1441 {
                    print(timeCount,timeArray.count,csvArray.count)
                    //csvArrayのtimeCount行目を,区切りで格納
                    timeArray = csvArray[timeCount].components(separatedBy:",")
                    //選択した時刻とcsvの時刻の一致した時の処理
                    if argString3  == timeArray[0] {
                        
                        Time01.text = timeArray[1]
                        Time02.text = timeArray[2]
                        Time03.text = timeArray[3]
                        
                        if Time01.text != "本日の運行は終了しました。"{
                            timeCount = 0
                            while timeCount < 1441 {
                                timeArray = csvArray[timeCount].components(separatedBy:",")
                                if timeArray[0]  == Time01.text {
                                    timeCount += 45
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    Time11.text = timeArray[0]
                                    break
                                }
                                timeCount += 1
                            }
                            if Time02.text != "これ以降の運行時刻はありません。"{
                                timeCount = 0
                                while timeCount < 1441 {
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    if timeArray[0]  == Time02.text {
                                        timeCount += 45
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        Time22.text = timeArray[0]
                                        break
                                    }
                                    timeCount += 1
                                }
                                if Time03.text !=  "これ以降の運行時刻はありません。" {
                                    timeCount = 0
                                    while timeCount < 1441 {
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        if timeArray[0]  == Time03.text {
                                            timeCount += 45
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            Time33.text = timeArray[0]
                                            break
                                        }
                                        timeCount += 1
                                    }
                                }
                            }
                        }
                        break
                    }
                timeCount += 1
                }
                break
            
                
            case "電機大学":
                if argString2 == "高坂" {
                    //csvのファイルを読み込む
                    csvArray = loadCSV(filename:"DoyoStartDenTaka")
                    //ループ文で一つずつ見ていく
                    while timeCount < 1441 {
                        print(timeCount,timeArray.count,csvArray.count)
                        //csvArrayのtimeCount行目を,区切りで格納
                        timeArray = csvArray[timeCount].components(separatedBy:",")
                        //選択した時刻とcsvの時刻の一致した時の処理
                        if argString3  == timeArray[0] {
                            
                            Time01.text = timeArray[1]
                            Time02.text = timeArray[2]
                            Time03.text = timeArray[3]
                            
                            if Time01.text != "本日の運行は終了しました。"{
                                timeCount = 0
                                while timeCount < 1441 {
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    if timeArray[0]  == Time01.text {
                                        timeCount += 15
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        Time11.text = timeArray[0]
                                        break
                                    }
                                    timeCount += 1
                                }
                                if Time02.text != "これ以降の運行時刻はありません。"{
                                    timeCount = 0
                                    while timeCount < 1441 {
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        if timeArray[0]  == Time02.text {
                                            timeCount += 15
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            Time22.text = timeArray[0]
                                            break
                                        }
                                        timeCount += 1
                                    }
                                    if Time03.text !=  "これ以降の運行時刻はありません。" {
                                        timeCount = 0
                                        while timeCount < 1441 {
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            if timeArray[0]  == Time03.text {
                                                timeCount += 15
                                                timeArray = csvArray[timeCount].components(separatedBy:",")
                                                Time33.text = timeArray[0]
                                                break
                                            }
                                            timeCount += 1
                                        }
                                    }
                                }
                            }
                            break
                        }
                    timeCount += 1
                    }
                    break
                } else if argString2 == "北坂戸" {
                    //csvのファイルを読み込む
                    csvArray = loadCSV(filename:"DoyoStartDenKita")
                    //ループ文で一つずつ見ていく
                    while timeCount < 1441 {
                        print(timeCount,timeArray.count,csvArray.count)
                        //csvArrayのtimeCount行目を,区切りで格納
                        timeArray = csvArray[timeCount].components(separatedBy:",")
                        //選択した時刻とcsvの時刻の一致した時の処理
                        if argString3  == timeArray[0] {
                            
                            Time01.text = timeArray[1]
                            Time02.text = timeArray[2]
                            Time03.text = timeArray[3]
                            
                            if Time01.text != "本日の運行は終了しました。"{
                                timeCount = 0
                                while timeCount < 1441 {
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    if timeArray[0]  == Time01.text {
                                        timeCount += 25
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        Time11.text = timeArray[0]
                                        break
                                    }
                                    timeCount += 1
                                }
                                if Time02.text != "これ以降の運行時刻はありません。"{
                                    timeCount = 0
                                    while timeCount < 1441 {
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        if timeArray[0]  == Time02.text {
                                            timeCount += 25
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            Time22.text = timeArray[0]
                                            break
                                        }
                                        timeCount += 1
                                    }
                                    if Time03.text !=  "これ以降の運行時刻はありません。" {
                                        timeCount = 0
                                        while timeCount < 1441 {
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            if timeArray[0]  == Time03.text {
                                                timeCount += 25
                                                timeArray = csvArray[timeCount].components(separatedBy:",")
                                                Time33.text = timeArray[0]
                                                break
                                            }
                                            timeCount += 1
                                        }
                                    }
                                }
                            }
                            break
                        }
                    timeCount += 1
                    }
                    break
                } else if argString2 == "熊谷" {
                    //csvのファイルを読み込む
                    csvArray = loadCSV(filename:"DoyoStartDenKuma")
                    //ループ文で一つずつ見ていく
                    while timeCount < 1441 {
                        print(timeCount,timeArray.count,csvArray.count)
                        //csvArrayのtimeCount行目を,区切りで格納
                        timeArray = csvArray[timeCount].components(separatedBy:",")
                        //選択した時刻とcsvの時刻の一致した時の処理
                        if argString3  == timeArray[0] {
                            
                            Time01.text = timeArray[1]
                            Time02.text = timeArray[2]
                            Time03.text = timeArray[3]
                            
                            if Time01.text != "本日の運行は終了しました。"{
                                timeCount = 0
                                while timeCount < 1441 {
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    if timeArray[0]  == Time01.text {
                                        timeCount += 45
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        Time11.text = timeArray[0]
                                        break
                                    }
                                    timeCount += 1
                                }
                                if Time02.text != "これ以降の運行時刻はありません。"{
                                    timeCount = 0
                                    while timeCount < 1441 {
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        if timeArray[0]  == Time02.text {
                                            timeCount += 45
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            Time22.text = timeArray[0]
                                            break
                                        }
                                        timeCount += 1
                                    }
                                    if Time03.text !=  "これ以降の運行時刻はありません。" {
                                        timeCount = 0
                                        while timeCount < 1441 {
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            if timeArray[0]  == Time03.text {
                                                timeCount += 45
                                                timeArray = csvArray[timeCount].components(separatedBy:",")
                                                Time33.text = timeArray[0]
                                                break
                                            }
                                            timeCount += 1
                                        }
                                    }
                                }
                            }
                            break
                        }
                    timeCount += 1
                    }
                    break
                } else {
                    Reigai.text = "指定した条件が不適切です。"
                    break
                }
            
            default:
                Reigai.text = "該当する条件でのバスはありません"
            }
            
            } else if argString4 == "休業期間中" {
            switch argString {
            case "高坂":
                //csvのファイルを読み込む
                csvArray = loadCSV(filename:"KyugyoStartTakasaka")
                //ループ文で一つずつ見ていく
                while timeCount < 1441 {
                    print(timeCount,timeArray.count,csvArray.count)
                    //csvArrayのtimeCount行目を,区切りで格納
                    timeArray = csvArray[timeCount].components(separatedBy:",")
                    //選択した時刻とcsvの時刻の一致した時の処理
                    if argString3  == timeArray[0] {
                        
                        Time01.text = timeArray[1]
                        Time02.text = timeArray[2]
                        Time03.text = timeArray[3]
                        
                        if Time01.text != "本日の運行は終了しました。"{
                            timeCount = 0
                            while timeCount < 1441 {
                                timeArray = csvArray[timeCount].components(separatedBy:",")
                                if timeArray[0]  == Time01.text {
                                    timeCount += 15
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    Time11.text = timeArray[0]
                                    break
                                }
                                timeCount += 1
                            }
                            if Time02.text != "これ以降の運行時刻はありません。"{
                                timeCount = 0
                                while timeCount < 1441 {
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    if timeArray[0]  == Time02.text {
                                        timeCount += 15
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        Time22.text = timeArray[0]
                                        break
                                    }
                                    timeCount += 1
                                }
                                if Time03.text !=  "これ以降の運行時刻はありません。" {
                                    timeCount = 0
                                    while timeCount < 1441 {
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        if timeArray[0]  == Time03.text {
                                            timeCount += 15
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            Time33.text = timeArray[0]
                                            break
                                        }
                                        timeCount += 1
                                    }
                                }
                            }
                        }
                        break
                    }
                timeCount += 1
                }
                break
                //prefectures = ["該当する条件でのバスはありません" ]
                //timeCount = 0
                
            
            case "北坂戸":
                //csvのファイルを読み込む
                csvArray = loadCSV(filename:"KyugyoStartKitasakado")
                //ループ文で一つずつ見ていく
                while timeCount < 1441 {
                    print(timeCount,timeArray.count,csvArray.count)
                    //csvArrayのtimeCount行目を,区切りで格納
                    timeArray = csvArray[timeCount].components(separatedBy:",")
                    //選択した時刻とcsvの時刻の一致した時の処理
                    if argString3  == timeArray[0] {
                        
                        Time01.text = timeArray[1]
                        Time02.text = timeArray[2]
                        Time03.text = timeArray[3]
                        
                        if Time01.text != "本日の運行は終了しました。"{
                            timeCount = 0
                            while timeCount < 1441 {
                                timeArray = csvArray[timeCount].components(separatedBy:",")
                                if timeArray[0]  == Time01.text {
                                    timeCount += 25
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    Time11.text = timeArray[0]
                                    break
                                }
                                timeCount += 1
                            }
                            if Time02.text != "これ以降の運行時刻はありません。"{
                                timeCount = 0
                                while timeCount < 1441 {
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    if timeArray[0]  == Time02.text {
                                        timeCount += 25
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        Time22.text = timeArray[0]
                                        break
                                    }
                                    timeCount += 1
                                }
                                if Time03.text !=  "これ以降の運行時刻はありません。" {
                                    timeCount = 0
                                    while timeCount < 1441 {
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        if timeArray[0]  == Time03.text {
                                            timeCount += 25
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            Time33.text = timeArray[0]
                                            break
                                        }
                                        timeCount += 1
                                    }
                                }
                            }
                        }
                        break
                    }
                timeCount += 1
                }
                break
                
                
            case "熊谷":
                //csvのファイルを読み込む
                csvArray = loadCSV(filename:"KyugyoStartKumagaya")
                //ループ文で一つずつ見ていく
                while timeCount < 1441 {
                    print(timeCount,timeArray.count,csvArray.count)
                    //csvArrayのtimeCount行目を,区切りで格納
                    timeArray = csvArray[timeCount].components(separatedBy:",")
                    //選択した時刻とcsvの時刻の一致した時の処理
                    if argString3  == timeArray[0] {
                        
                        Time01.text = timeArray[1]
                        Time02.text = timeArray[2]
                        Time03.text = timeArray[3]
                        
                        if Time01.text != "本日の運行は終了しました。"{
                            timeCount = 0
                            while timeCount < 1441 {
                                timeArray = csvArray[timeCount].components(separatedBy:",")
                                if timeArray[0]  == Time01.text {
                                    timeCount += 45
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    Time11.text = timeArray[0]
                                    break
                                }
                                timeCount += 1
                            }
                            if Time02.text != "これ以降の運行時刻はありません。"{
                                timeCount = 0
                                while timeCount < 1441 {
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    if timeArray[0]  == Time02.text {
                                        timeCount += 45
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        Time22.text = timeArray[0]
                                        break
                                    }
                                    timeCount += 1
                                }
                                if Time03.text !=  "これ以降の運行時刻はありません。" {
                                    timeCount = 0
                                    while timeCount < 1441 {
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        if timeArray[0]  == Time03.text {
                                            timeCount += 45
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            Time33.text = timeArray[0]
                                            break
                                        }
                                        timeCount += 1
                                    }
                                }
                            }
                        }
                        break
                    }
                timeCount += 1
                }
                break
            
                
            case "電機大学":
                if argString2 == "高坂" {
                    //csvのファイルを読み込む
                    csvArray = loadCSV(filename:"KyugyoStartDenTaka")
                    //ループ文で一つずつ見ていく
                    while timeCount < 1441 {
                        print(timeCount,timeArray.count,csvArray.count)
                        //csvArrayのtimeCount行目を,区切りで格納
                        timeArray = csvArray[timeCount].components(separatedBy:",")
                        //選択した時刻とcsvの時刻の一致した時の処理
                        if argString3  == timeArray[0] {
                            
                            Time01.text = timeArray[1]
                            Time02.text = timeArray[2]
                            Time03.text = timeArray[3]
                            
                            if Time01.text != "本日の運行は終了しました。"{
                                timeCount = 0
                                while timeCount < 1441 {
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    if timeArray[0]  == Time01.text {
                                        timeCount += 15
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        Time11.text = timeArray[0]
                                        break
                                    }
                                    timeCount += 1
                                }
                                if Time02.text != "これ以降の運行時刻はありません。"{
                                    timeCount = 0
                                    while timeCount < 1441 {
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        if timeArray[0]  == Time02.text {
                                            timeCount += 15
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            Time22.text = timeArray[0]
                                            break
                                        }
                                        timeCount += 1
                                    }
                                    if Time03.text !=  "これ以降の運行時刻はありません。" {
                                        timeCount = 0
                                        while timeCount < 1441 {
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            if timeArray[0]  == Time03.text {
                                                timeCount += 15
                                                timeArray = csvArray[timeCount].components(separatedBy:",")
                                                Time33.text = timeArray[0]
                                                break
                                            }
                                            timeCount += 1
                                        }
                                    }
                                }
                            }
                            break
                        }
                    timeCount += 1
                    }
                    break
                } else if argString2 == "北坂戸" {
                    //csvのファイルを読み込む
                    csvArray = loadCSV(filename:"KyugyoStartDenKita")
                    //ループ文で一つずつ見ていく
                    while timeCount < 1441 {
                        print(timeCount,timeArray.count,csvArray.count)
                        //csvArrayのtimeCount行目を,区切りで格納
                        timeArray = csvArray[timeCount].components(separatedBy:",")
                        //選択した時刻とcsvの時刻の一致した時の処理
                        if argString3  == timeArray[0] {
                            
                            Time01.text = timeArray[1]
                            Time02.text = timeArray[2]
                            Time03.text = timeArray[3]
                            
                            if Time01.text != "本日の運行は終了しました。"{
                                timeCount = 0
                                while timeCount < 1441 {
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    if timeArray[0]  == Time01.text {
                                        timeCount += 25
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        Time11.text = timeArray[0]
                                        break
                                    }
                                    timeCount += 1
                                }
                                if Time02.text != "これ以降の運行時刻はありません。"{
                                    timeCount = 0
                                    while timeCount < 1441 {
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        if timeArray[0]  == Time02.text {
                                            timeCount += 25
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            Time22.text = timeArray[0]
                                            break
                                        }
                                        timeCount += 1
                                    }
                                    if Time03.text !=  "これ以降の運行時刻はありません。" {
                                        timeCount = 0
                                        while timeCount < 1441 {
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            if timeArray[0]  == Time03.text {
                                                timeCount += 25
                                                timeArray = csvArray[timeCount].components(separatedBy:",")
                                                Time33.text = timeArray[0]
                                                break
                                            }
                                            timeCount += 1
                                        }
                                    }
                                }
                            }
                            break
                        }
                    timeCount += 1
                    }
                    break
                } else if argString2 == "熊谷" {
                    //csvのファイルを読み込む
                    csvArray = loadCSV(filename:"KyugyoStartDenKuma")
                    //ループ文で一つずつ見ていく
                    while timeCount < 1441 {
                        print(timeCount,timeArray.count,csvArray.count)
                        //csvArrayのtimeCount行目を,区切りで格納
                        timeArray = csvArray[timeCount].components(separatedBy:",")
                        //選択した時刻とcsvの時刻の一致した時の処理
                        if argString3  == timeArray[0] {
                            
                            Time01.text = timeArray[1]
                            Time02.text = timeArray[2]
                            Time03.text = timeArray[3]
                            
                            if Time01.text != "本日の運行は終了しました。"{
                                timeCount = 0
                                while timeCount < 1441 {
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    if timeArray[0]  == Time01.text {
                                        timeCount += 45
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        Time11.text = timeArray[0]
                                        break
                                    }
                                    timeCount += 1
                                }
                                if Time02.text != "これ以降の運行時刻はありません。"{
                                    timeCount = 0
                                    while timeCount < 1441 {
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        if timeArray[0]  == Time02.text {
                                            timeCount += 45
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            Time22.text = timeArray[0]
                                            break
                                        }
                                        timeCount += 1
                                    }
                                    if Time03.text !=  "これ以降の運行時刻はありません。" {
                                        timeCount = 0
                                        while timeCount < 1441 {
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            if timeArray[0]  == Time03.text {
                                                timeCount += 45
                                                timeArray = csvArray[timeCount].components(separatedBy:",")
                                                Time33.text = timeArray[0]
                                                break
                                            }
                                            timeCount += 1
                                        }
                                    }
                                }
                            }
                            break
                        }
                    timeCount += 1
                    }
                    break
                } else {
                    Reigai.text = "指定した条件が不適切です。"
                    break
                }
                
            default:
                Reigai.text = "該当する条件でのバスはありません"
            }
            
        } else {
            switch argString {
            case "高坂":
                //csvのファイルを読み込む
                csvArray = loadCSV(filename:"StartTakasaka")
                //ループ文で一つずつ見ていく
                while timeCount < 1441 {
                    print(timeCount,timeArray.count,csvArray.count)
                    //csvArrayのtimeCount行目を,区切りで格納
                    timeArray = csvArray[timeCount].components(separatedBy:",")
                    //選択した時刻とcsvの時刻の一致した時の処理
                    if argString3  == timeArray[0] {
                        
                        Time01.text = timeArray[1]
                        Time02.text = timeArray[2]
                        Time03.text = timeArray[3]
                        
                        if Time01.text != "本日の運行は終了しました。"{
                            timeCount = 0
                            while timeCount < 1441 {
                                timeArray = csvArray[timeCount].components(separatedBy:",")
                                if timeArray[0]  == Time01.text {
                                    timeCount += 15
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    Time11.text = timeArray[0]
                                    break
                                }
                                timeCount += 1
                            }
                            if Time02.text != "これ以降の運行時刻はありません。"{
                                timeCount = 0
                                while timeCount < 1441 {
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    if timeArray[0]  == Time02.text {
                                        timeCount += 15
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        Time22.text = timeArray[0]
                                        break
                                    }
                                    timeCount += 1
                                }
                                if Time03.text !=  "これ以降の運行時刻はありません。" {
                                    timeCount = 0
                                    while timeCount < 1441 {
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        if timeArray[0]  == Time03.text {
                                            timeCount += 15
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            Time33.text = timeArray[0]
                                            break
                                        }
                                        timeCount += 1
                                    }
                                }
                            }
                        }
                        break
                    }
                timeCount += 1
                }
                break
                //prefectures = ["該当する条件でのバスはありません" ]
                //timeCount = 0
                
            
            case "北坂戸":
                //csvのファイルを読み込む
                csvArray = loadCSV(filename:"StartKitasakado")
                //ループ文で一つずつ見ていく
                while timeCount < 1441 {
                    print(timeCount,timeArray.count,csvArray.count)
                    //csvArrayのtimeCount行目を,区切りで格納
                    timeArray = csvArray[timeCount].components(separatedBy:",")
                    //選択した時刻とcsvの時刻の一致した時の処理
                    if argString3  == timeArray[0] {
                        
                        Time01.text = timeArray[1]
                        Time02.text = timeArray[2]
                        Time03.text = timeArray[3]
                        
                        if Time01.text != "本日の運行は終了しました。"{
                            timeCount = 0
                            while timeCount < 1441 {
                                timeArray = csvArray[timeCount].components(separatedBy:",")
                                if timeArray[0]  == Time01.text {
                                    timeCount += 25
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    Time11.text = timeArray[0]
                                    break
                                }
                                timeCount += 1
                            }
                            if Time02.text != "これ以降の運行時刻はありません。"{
                                timeCount = 0
                                while timeCount < 1441 {
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    if timeArray[0]  == Time02.text {
                                        timeCount += 25
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        Time22.text = timeArray[0]
                                        break
                                    }
                                    timeCount += 1
                                }
                                if Time03.text !=  "これ以降の運行時刻はありません。" {
                                    timeCount = 0
                                    while timeCount < 1441 {
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        if timeArray[0]  == Time03.text {
                                            timeCount += 25
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            Time33.text = timeArray[0]
                                            break
                                        }
                                        timeCount += 1
                                    }
                                }
                            }
                        }
                        break
                    }
                timeCount += 1
                }
                break
                
                
            case "熊谷":
                //csvのファイルを読み込む
                csvArray = loadCSV(filename:"StartKumagaya")
                //ループ文で一つずつ見ていく
                while timeCount < 1441 {
                    print(timeCount,timeArray.count,csvArray.count)
                    //csvArrayのtimeCount行目を,区切りで格納
                    timeArray = csvArray[timeCount].components(separatedBy:",")
                    //選択した時刻とcsvの時刻の一致した時の処理
                    if argString3  == timeArray[0] {
                        
                        Time01.text = timeArray[1]
                        Time02.text = timeArray[2]
                        Time03.text = timeArray[3]
                        
                        if Time01.text != "本日の運行は終了しました。"{
                            timeCount = 0
                            while timeCount < 1441 {
                                timeArray = csvArray[timeCount].components(separatedBy:",")
                                if timeArray[0]  == Time01.text {
                                    timeCount += 45
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    Time11.text = timeArray[0]
                                    break
                                }
                                timeCount += 1
                            }
                            if Time02.text != "これ以降の運行時刻はありません。"{
                                timeCount = 0
                                while timeCount < 1441 {
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    if timeArray[0]  == Time02.text {
                                        timeCount += 45
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        Time22.text = timeArray[0]
                                        break
                                    }
                                    timeCount += 1
                                }
                                if Time03.text !=  "これ以降の運行時刻はありません。" {
                                    timeCount = 0
                                    while timeCount < 1441 {
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        if timeArray[0]  == Time03.text {
                                            timeCount += 45
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            Time33.text = timeArray[0]
                                            break
                                        }
                                        timeCount += 1
                                    }
                                }
                            }
                        }
                        break
                    }
                timeCount += 1
                }
                break
            
                
            case "電機大学":
                if argString2 == "高坂" {
                    //csvのファイルを読み込む
                    csvArray = loadCSV(filename:"StartDenTaka")
                    //ループ文で一つずつ見ていく
                    while timeCount < 1441 {
                        print(timeCount,timeArray.count,csvArray.count)
                        //csvArrayのtimeCount行目を,区切りで格納
                        timeArray = csvArray[timeCount].components(separatedBy:",")
                        //選択した時刻とcsvの時刻の一致した時の処理
                        if argString3  == timeArray[0] {
                            
                            Time01.text = timeArray[1]
                            Time02.text = timeArray[2]
                            Time03.text = timeArray[3]
                            
                            if Time01.text != "本日の運行は終了しました。"{
                                timeCount = 0
                                while timeCount < 1441 {
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    if timeArray[0]  == Time01.text {
                                        timeCount += 15
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        Time11.text = timeArray[0]
                                        break
                                    }
                                    timeCount += 1
                                }
                                if Time02.text != "これ以降の運行時刻はありません。"{
                                    timeCount = 0
                                    while timeCount < 1441 {
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        if timeArray[0]  == Time02.text {
                                            timeCount += 15
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            Time22.text = timeArray[0]
                                            break
                                        }
                                        timeCount += 1
                                    }
                                    if Time03.text !=  "これ以降の運行時刻はありません。" {
                                        timeCount = 0
                                        while timeCount < 1441 {
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            if timeArray[0]  == Time03.text {
                                                timeCount += 15
                                                timeArray = csvArray[timeCount].components(separatedBy:",")
                                                Time33.text = timeArray[0]
                                                break
                                            }
                                            timeCount += 1
                                        }
                                    }
                                }
                            }
                            break
                        }
                    timeCount += 1
                    }
                    break
                } else if argString2 == "北坂戸" {
                    //csvのファイルを読み込む
                    csvArray = loadCSV(filename:"StartDenKita")
                    //ループ文で一つずつ見ていく
                    while timeCount < 1441 {
                        print(timeCount,timeArray.count,csvArray.count)
                        //csvArrayのtimeCount行目を,区切りで格納
                        timeArray = csvArray[timeCount].components(separatedBy:",")
                        //選択した時刻とcsvの時刻の一致した時の処理
                        if argString3  == timeArray[0] {
                            
                            Time01.text = timeArray[1]
                            Time02.text = timeArray[2]
                            Time03.text = timeArray[3]
                            
                            if Time01.text != "本日の運行は終了しました。"{
                                timeCount = 0
                                while timeCount < 1441 {
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    if timeArray[0]  == Time01.text {
                                        timeCount += 25
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        Time11.text = timeArray[0]
                                        break
                                    }
                                    timeCount += 1
                                }
                                if Time02.text != "これ以降の運行時刻はありません。"{
                                    timeCount = 0
                                    while timeCount < 1441 {
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        if timeArray[0]  == Time02.text {
                                            timeCount += 25
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            Time22.text = timeArray[0]
                                            break
                                        }
                                        timeCount += 1
                                    }
                                    if Time03.text !=  "これ以降の運行時刻はありません。" {
                                        timeCount = 0
                                        while timeCount < 1441 {
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            if timeArray[0]  == Time03.text {
                                                timeCount += 25
                                                timeArray = csvArray[timeCount].components(separatedBy:",")
                                                Time33.text = timeArray[0]
                                                break
                                            }
                                            timeCount += 1
                                        }
                                    }
                                }
                            }
                            break
                        }
                    timeCount += 1
                    }
                    break
                } else if argString2 == "熊谷" {
                    //csvのファイルを読み込む
                    csvArray = loadCSV(filename:"StartDenKuma")
                    //ループ文で一つずつ見ていく
                    while timeCount < 1441 {
                        print(timeCount,timeArray.count,csvArray.count)
                        //csvArrayのtimeCount行目を,区切りで格納
                        timeArray = csvArray[timeCount].components(separatedBy:",")
                        //選択した時刻とcsvの時刻の一致した時の処理
                        if argString3  == timeArray[0] {
                            
                            Time01.text = timeArray[1]
                            Time02.text = timeArray[2]
                            Time03.text = timeArray[3]
                            
                            if Time01.text != "本日の運行は終了しました。"{
                                timeCount = 0
                                while timeCount < 1441 {
                                    timeArray = csvArray[timeCount].components(separatedBy:",")
                                    if timeArray[0]  == Time01.text {
                                        timeCount += 45
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        Time11.text = timeArray[0]
                                        break
                                    }
                                    timeCount += 1
                                }
                                if Time02.text != "これ以降の運行時刻はありません。"{
                                    timeCount = 0
                                    while timeCount < 1441 {
                                        timeArray = csvArray[timeCount].components(separatedBy:",")
                                        if timeArray[0]  == Time02.text {
                                            timeCount += 45
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            Time22.text = timeArray[0]
                                            break
                                        }
                                        timeCount += 1
                                    }
                                    if Time03.text !=  "これ以降の運行時刻はありません。" {
                                        timeCount = 0
                                        while timeCount < 1441 {
                                            timeArray = csvArray[timeCount].components(separatedBy:",")
                                            if timeArray[0]  == Time03.text {
                                                timeCount += 45
                                                timeArray = csvArray[timeCount].components(separatedBy:",")
                                                Time33.text = timeArray[0]
                                                break
                                            }
                                            timeCount += 1
                                        }
                                    }
                                }
                            }
                            break
                        }
                    timeCount += 1
                    }
                    break
                } else {
                    Reigai.text = "指定した条件が不適切です。"
                    break
                }
                
            default:
                Reigai.text = "該当する条件でのバスはありません"
            }
            
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
