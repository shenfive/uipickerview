//
//  ViewController.swift
//  uipickerview
//
//  Created by 申潤五 on 2019/11/16.
//  Copyright © 2019 申潤五. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate{


    @IBOutlet weak var pickerView: UIPickerView!
    var astrological = ["請選擇你的星座","白羊宮","金牛宮","雙子宮","巨蟹宮","獅子宮","處女宮","天秤宮","天蠍宮","射手宮","摩羯宮","水瓶宮","雙魚宮"]
    var bloudType = ["請選擇你的血型","A","B","O","AB"]

    var selectedAst:String? = nil
    var selectedBloud:String? = nil
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.dataSource = self
        pickerView.delegate = self
 
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        print("will appear")
        pickerView.selectRow(0, inComponent: 0, animated: false)
        pickerView.selectRow(0, inComponent: 1, animated: false)
        selectedAst = nil
        selectedBloud = nil
    }

    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        let nextVC = segue.destination as! SPViewController
        nextVC.ast = selectedAst ?? ""
        nextVC.bld = selectedBloud ?? ""
    }
    
    
    
    //MARK: PickerView DataSource & Delegate
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
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        switch component {
        case 0:
            return astrological[row]
        case 1:
            return bloudType[row]
        default:
            return nil
        }
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        
        switch component {
        case 0:
            if row == 0{
                selectedAst = nil
            }else{
                selectedAst =  astrological[row]
            }
            
        case 1:
            if row == 0 {
                selectedBloud = nil
            }else{
                selectedBloud = bloudType[row]
            }
        default:
            break
        }
        if selectedAst != nil && selectedBloud != nil{
            performSegue(withIdentifier: "goPage2", sender: nil)
        }
        
        
        
        
    }
    
    @IBAction func resetAction(_ sender: Any) {
        pickerView.selectRow(0, inComponent: 0, animated: true)
        pickerView.selectRow(0, inComponent: 1, animated: true)
        selectedAst = nil
        selectedBloud = nil
    }
    
}

