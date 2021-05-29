//
//  QuizScoreViewController.swift
//  Hatobus
//
//  Created by 手塚晋之介 on 2021/05/29.
//

import UIKit

class QuizScoreViewController: UIViewController {

    @IBOutlet weak var ScoreLabel: UILabel!
    
    //正解数を受け取る変数の定義
    var correct = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        ScoreLabel.text = "\(correct)問正解です"

        // 背景色を設定
        self.view.backgroundColor = UIColor(displayP3Red: 1.0,green: 1.0, blue: 0.90, alpha: 1.0)
        
        // Do any additional setup after loading the view.
    }
    
    //QuizStartViewに戻るObject
    @IBAction func toTopButton(_ sender: Any) {
        self.presentingViewController?.presentingViewController?.dismiss(animated: true)
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
