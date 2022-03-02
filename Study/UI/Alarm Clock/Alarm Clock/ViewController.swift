//
//  ViewController.swift
//  Alarm Clock
//
//  Created by 배창범 on 2022/03/02.
//

import UIKit

class ViewController: UIViewController {

    let timerSelector: Selector = #selector(ViewController.updateTime)
    
    let interval = 1.0
    @IBOutlet var lbCurrentTime: UILabel!
    @IBOutlet var lbPickerTime: UILabel!
    var currentTime: String = ""
    var alarmTime: String = ""
    var alarmFlag = false
    var count:Int = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timerSelector, userInfo: nil, repeats: true)
    }
    
    
    @IBAction func changeDatePicker(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lbPickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
        
        formatter.dateFormat = "hh:mm aaa"
        alarmTime = formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime()
    {
        // 현재의 시간을 NSDate 함수를 사용하여 가져온다
        let date = NSDate()
        // 날짜를 출력하기 위해 DateFormatter 클래스의 상수 선언
        let formatter = DateFormatter()
        // 속성 설정
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lbCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
            
        formatter.dateFormat = "hh:mm aaa"
        currentTime = formatter.string(from: date as Date)
            
        if((currentTime == alarmTime) && !alarmFlag){
            let alarmAlert = UIAlertController(title: "알림", message: "설정된 시간입니다 !!!", preferredStyle: UIAlertController.Style.alert)
            let alarmAction = UIAlertAction(title: "네,알겠습니다.", style: UIAlertAction.Style.default, handler:
                                                        {ACTION in self.alarmFlag = true
                        })
            alarmAlert.addAction(alarmAction)
            present(alarmAlert, animated: true, completion: nil)
        }
        
        if count >= 60 {
            count = 0
            let alarmAlertCount = UIAlertController(title: "알림", message: "설정된 시간이 지났습니다. !!!", preferredStyle: UIAlertController.Style.alert)
            let alarmOff = UIAlertAction(title: "알람을 끄겠습니다.", style: UIAlertAction.Style.default, handler:
                                                        {ACTION in self.alarmFlag = false
                        })
            let alarmOn = UIAlertAction(title: "알람을 유지하겠습니다.", style: UIAlertAction.Style.default, handler:
                                                        {ACTION in self.alarmFlag = true
                        })
            alarmAlertCount.addAction(alarmOn)
            alarmAlertCount.addAction(alarmOff)
            present(alarmAlertCount, animated: true, completion: nil)
        }
        
        if alarmFlag {
            count = count + 1
            print("Count : \(count)")
        }
    }
}

