//
//  ViewController.swift
//  Hatobus
//
//  Created by 手塚晋之介 on 2021/05/17.
//

import UIKit

class ViewController: UIViewController ,UIPickerViewDelegate,UIPickerViewDataSource , UITextFieldDelegate{
    //numberOfComponentsはpickerViewに表示する列の数
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    //numberOfRowsInComponentはpickerViewに表示するデータの数
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 5
    }
    
    //titleForRowはpickerViewに設定するデータを登録するためのメソッド
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        if pickerView == upperPickerView{
            return data[row]
        }else{
            return data[row]
        }
    }
    //didSelectRow は pickerView の各種データを選択したときに呼ばれるメソッド
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        if pickerView == upperPickerView{
            startTextField.text = data[row]
        }else{
            finishTextField.text = data[row]
        }
    }

    
    @IBOutlet weak var startTextField: UITextField!
    @IBOutlet weak var finishTextField: UITextField!
    @IBOutlet weak var timeTextField: UITextField!
    @IBAction func serchButton(_ sender: Any) {
    }
    
    //datapicker上のツールバーの定義
    var toolBar:UIToolbar!
    
    var upperPickerView = UIPickerView()
    var lowerPickerView = UIPickerView()
       let data = ["---", "電機大学", "高坂", "北坂戸", "熊谷"]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //コーディング
        startTextField.placeholder = "出発地の選択"
        finishTextField.placeholder = "終着地の選択"
        timeTextField.placeholder = "日と時刻の選択"
        
        
        upperPickerView.dataSource = self
        lowerPickerView.dataSource = self
        //createPickerVieを呼び出し
        createPickerView()
        
        //時刻を設定する
        timeTextField.delegate = self
        //setupToolbar()の呼び出し
        setupToolbar()
        
        // 背景色を設定
        self.view.backgroundColor = UIColor(displayP3Red: 1.0,green: 1.0, blue: 0.90, alpha: 1.0)
    }


    // createPickerView機能の定義
    func createPickerView() {
        //upperPickerView
        upperPickerView.delegate = self
        startTextField.inputView = upperPickerView
        // toolbar
        let upperToolbar = UIToolbar()
        upperToolbar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
        let upperDoneButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ViewController.donePickerS))
        upperToolbar.setItems([upperDoneButtonItem], animated: true)
        startTextField.inputAccessoryView = upperToolbar
        
        //lowerPickerView
        lowerPickerView.delegate = self
        finishTextField.inputView = lowerPickerView
        // toolbar
        let lowerToolbar = UIToolbar()
        lowerToolbar.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 44)
        let lowerDoneButtonItem = UIBarButtonItem(barButtonSystemItem: .done, target: self, action: #selector(ViewController.donePickerS))
        lowerToolbar.setItems([lowerDoneButtonItem], animated: true)
        finishTextField.inputAccessoryView = lowerToolbar
        }
    
    @objc func donePickerS() {
        startTextField.endEditing(true)
        finishTextField.endEditing(true)
    }
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        startTextField.endEditing(true)
        finishTextField.endEditing(true)
        }
    
    
    //ここからtextfieldにdatepickerを追加する関数//
    func setupToolbar() {
        //datepicker上のtoolbarのdoneボタン
        toolBar = UIToolbar()
        toolBar.sizeToFit()
        let toolBarBtn = UIBarButtonItem(title: "DONE", style: .plain, target: self, action: #selector(doneBtn))
        toolBar.items = [toolBarBtn]
        timeTextField.inputAccessoryView = toolBar
    }

    func textFieldDidBeginEditing(_ textField: UITextField) {
        let datePickerView:UIDatePicker = UIDatePicker()
        //wheelsを指定することでpickerの表示が最新のiOSの表示ではなくしている。
        if #available(iOS 13.4, *) {
            datePickerView.preferredDatePickerStyle = .wheels
        }
        datePickerView.datePickerMode = UIDatePicker.Mode.time //dateAndTimeにすることで日付と時刻のdatepicker
        textField.inputView = datePickerView
        datePickerView.addTarget(self, action: #selector(datePickerValueChanged(sender:)), for: UIControl.Event.valueChanged)
    }

    //datepickerが選択されたらtextfieldに表示
    @objc func datePickerValueChanged(sender:UIDatePicker) {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat  = "H:mm";  //MM/dd H:mmとすることで表示も変わる
        timeTextField.text = dateFormatter.string(from: sender.date)
    }

    //toolbarのdoneボタン
    @objc func doneBtn(){
        timeTextField.resignFirstResponder()
    }
    
    
    //セグエ実行前処理(次ページにデータを渡す)
    override func prepare(for segue:UIStoryboardSegue, sender: Any?) {
        //Segueの識別子確認
        if segue.identifier == "toNext" {
            //遷移先HyoziViewCntrollerの取得
            let nextView = segue.destination as! TimeViewController
            //値の設定
            nextView.argString = startTextField.text!
            nextView.argString2 = finishTextField.text!
            nextView.argString3 = timeTextField.text!
        }
    }
    
    
}

