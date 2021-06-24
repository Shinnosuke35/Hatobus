//
//  TimeImageController.swift
//  Hatobus
//
//  Created by 手塚晋之介 on 2021/06/14.
//

import UIKit

class TimeImageController: UIViewController {
    
    // 画像インスタンス用
    let imageSample = UIImageView()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        // スクリーンサイズの取得
        let screenW:CGFloat = view.frame.size.width
        let screenH:CGFloat = view.frame.size.height
                
        // 画像を読み込んで、準備しておいたimageSampleに設定
        imageSample.image = UIImage(named: "DriveTime")
        // 画像のフレームを設定
        imageSample.frame = CGRect(x:0, y:0, width:400, height:550)
                
        // 画像を中央に設定
        imageSample.center = CGPoint(x:screenW/2, y:screenH/2)
                
        // 設定した画像をスクリーンに表示する
        self.view.addSubview(imageSample)
        
        self.view.backgroundColor = UIColor(displayP3Red: 0.90,green: 0.90, blue: 0.80, alpha: 1.0)
    }

        
    override func didReceiveMemoryWarning() {
                super.didReceiveMemoryWarning()

        // Do any additional setup after loading the view.
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
