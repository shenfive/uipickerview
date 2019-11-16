//
//  ViewController.swift
//  uipickerview
//
//  Created by 申潤五 on 2019/11/16.
//  Copyright © 2019 申潤五. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource{


    @IBOutlet weak var pickerView: UIPickerView!
    var astrological = ["請選擇你的星座","白羊宮","金牛宮","雙子宮","巨蟹宮","獅子宮","處女宮","天秤宮","天蠍宮","射手宮","摩羯宮","水瓶宮","雙魚宮"]
    var bloudType = ["請選擇你的血型","A","B","O","AB"]

    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
 
    }

    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 2
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        switch component {
        case 0:
            return astrological.count
        case 1:
            return bloudType.count
        default:
            return 0
        }
    }
    
    
    
}

