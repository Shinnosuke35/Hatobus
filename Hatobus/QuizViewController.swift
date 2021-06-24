//
//  QuizViewController.swift
//  Hatobus
//
//  Created by 手塚晋之介 on 2021/05/29.
//

import UIKit

class QuizViewController: UIViewController {
    @IBOutlet weak var quizNumberLabel: UILabel!
    @IBOutlet weak var quizText: UITextView!
    @IBOutlet weak var answerButton1: UIButton!
    @IBOutlet weak var answerButton2: UIButton!
    @IBOutlet weak var answerButton3: UIButton!
    @IBOutlet weak var answerButton4: UIButton!
    @IBOutlet weak var JudgeView: UIImageView!
    
    //csvファイルを格納する配列
    var csvArray: [String] = []
    //quizDataの1行ずつ格納する配列
    var quizArray: [String] = []
    //quiz番号のカウント変数を定義
    var quizCount = 0
    //正解数のカウント変数
    var correctCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        csvArray = loadCSV(filename: "Quiz")
        
        //csvArrayのquizCount行目を,区切りで格納
        quizArray = csvArray[quizCount].components(separatedBy: ",")
        
        quizNumberLabel.text = "第\(quizCount + 1)問"
        //問題文の代入
        quizText.text = quizArray[0]
        answerButton1.setTitle(quizArray[2], for: .normal)
        answerButton2.setTitle(quizArray[3], for: .normal)
        answerButton3.setTitle(quizArray[4], for: .normal)
        answerButton4.setTitle(quizArray[5], for: .normal)

        // 背景色を設定
        self.view.backgroundColor = UIColor(displayP3Red: 1.0,green: 1.0, blue: 0.90, alpha: 1.0)
        
        // Do any additional setup after loading the view.
    }
    
    //segueを用いてQuizScoreViewControllerにcorrectに正解数を取得
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let scoreNext = segue.destination as! QuizScoreViewController
        scoreNext.correct = correctCount
    }
    
    
    //押したボタンのtagがquizArray[1](正解番号)と比較した時の動作
    @IBAction func btnAction(sender: UIButton){
        if sender.tag == Int(quizArray[1]){
            print("正解")
            //正解数をカウント
            correctCount += 1
            //○の画像を代入して表示
            JudgeView.image = UIImage(named: "correct")
        } else{
            print("不正解")
            JudgeView.image = UIImage(named: "incorrect")
        }
        print("スコア:\(correctCount)")
        //○✖️が表示されたら0.5秒後に実行する処理
        JudgeView.isHidden = false
        DispatchQueue.main.asyncAfter(deadline: .now() + 0.5) {
            self.JudgeView.isHidden = true
            self.nextQuiz()
        }
    }

    //次のquizへ変わるObject
    func nextQuiz(){
        quizCount += 1
        //次に移動する問題が無いとき、スコア画面に移動する動作
        if quizCount < csvArray.count {
            //csvArrayのquizCount行目を,区切りで格納
            quizArray = csvArray[quizCount].components(separatedBy: ",")
            quizNumberLabel.text = "第\(quizCount + 1)問"
            //問題文の代入
            quizText.text = quizArray[0]
            answerButton1.setTitle(quizArray[2], for: .normal)
            answerButton2.setTitle(quizArray[3], for: .normal)
            answerButton3.setTitle(quizArray[4], for: .normal)
            answerButton4.setTitle(quizArray[5], for: .normal)
        } else{
            performSegue(withIdentifier: "toScoreNext", sender: nil)
        }
    
    }
    
    
    //CSVファイルを読み取るObject
    func loadCSV(filename: String) -> [String] {
        guard let csvBundle = Bundle.main.path(forResource: filename, ofType: "csv") else{return csvArray}
        do{
            let csvData = try String(contentsOfFile: csvBundle, encoding: String.Encoding.utf8)
            //\rで読み込み、\n行ごとに
            let linechange = csvData.replacingOccurrences(of: "\r", with: "\n")
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
