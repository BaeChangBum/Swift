//
//  ViewController.swift
//  Date Picker
//
//  Created by 배창범 on 2022/02/06.
//

import UIKit

class ViewController: UIViewController {
    
    let timerSelector: Selector = #selector(ViewController.updateTime)
    let interval = 1.0
    var count = 0

    @IBOutlet var lblCurrentTime: UILabel!
    @IBOutlet var lblPickerTime: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        Timer.scheduledTimer(timeInterval: interval, target: self, selector: timerSelector, userInfo: nil, repeats: true)
    }


    @IBAction func changeDatePickr(_ sender: UIDatePicker) {
        let datePickerView = sender
        
        let formatter = DateFormatter()
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblPickerTime.text = "선택시간 : " + formatter.string(from: datePickerView.date)
    }
    
    @objc func updateTime()
    {
//        lblCurrentTime.text = String(count)
//        count = count + 1
        
        // 현재의 시간을 NSDate 함수를 사용하여 가져온다
        let date = NSDate()
        // 날짜를 출력하기 위해 DateFormatter 클래스의 상수 선언
        let formatter = DateFormatter()
        // 속성 설정
        formatter.dateFormat = "yyyy-MM-dd HH:mm EEE"
        lblCurrentTime.text = "현재시간 : " + formatter.string(from: date as Date)
    }
}

