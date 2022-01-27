//
//  ViewController.swift
//  ImageView
//
//  Created by 배창범 on 2022/01/26.
//

import UIKit

class ViewController: UIViewController {
    var isZoom: Bool = false
    // ?는 옵셔널 이라는 개념으로 초기 값이 주어지지 않는다는 의미
    var imgOn: UIImage?
    var imgOff: UIImage?

    @IBOutlet var imgView: UIImageView!
    @IBOutlet var btnResize: UIButton!
    
    // 부모 클래스인 UIViewerController 클래스에 선언되어 있으며,
    // 뷰가 불려진 후 실행하고자 하는 기능이 필요할때
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        // 이미지 파일명을 입력하여 변수에 할당한다.
        imgOn = UIImage(named: "lamp_on.png")
        imgOff = UIImage(named: "lamp_off.png")
        
        // 스토리보드에 추가한 이미지뷰에 'imgOn'이미지를 지정
        imgView.image = imgOn
    }


    @IBAction func btnResizeImage(_ sender: UIButton)
    {
        let scale: CGFloat = 2.0
        var newWidth: CGFloat, newHeight: CGFloat
        
        if(isZoom)
        {
            newWidth = imgView.frame.width/scale
            newHeight = imgView.frame.height/scale
            btnResize.setTitle("확대", for: .normal)
        }
        else
        {
            newWidth = imgView.frame.width*scale
            newHeight = imgView.frame.height*scale
            btnResize.setTitle("축소", for: .normal)
        }
        
        // CGSize 메서드를 이용하여 이미지 뷰의 프레임 크기 변경
        imgView.frame.size = CGSize(width: newWidth, height: newHeight)
        isZoom = !isZoom
    }
    
    @IBAction func switchImageOnOff(_ sender: UISwitch)
    {
        if sender.isOn
        {
            imgView.image = imgOn
        }
        else
        {
            imgView.image = imgOff
        }
    }
}

