//
//  ViewController.swift
//  BobaPal
//
//  Created by Sarah Holecko on 8/8/21.
//

import SwiftUI
import UIKit
import Foundation

public class Singleton {
    var sizeSelected: Double = 1.0
    var sugarSelected: Int = 0
    var drinkCalories = 0
    var calCount = 0
    
    // Topping selection
    var addTapioca: Bool = false
    var addWhitePearl: Bool = false
    var addPudding: Bool = false
    var addMilkFoam: Bool = false
    var addCocoJelly: Bool = false
    var addRedBean: Bool = false
    var addAiYu: Bool = false
    var addHerbJelly: Bool = false
    var addAloe: Bool = false

    static let shared = Singleton()
    private init() {
        
    }
}

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
   
    
    // Connected UI Elements
    @IBOutlet weak var picker: UIPickerView!
    @IBOutlet weak var size: UISegmentedControl!
    @IBOutlet weak var sugar: UILabel!
    @IBOutlet weak var calories: UILabel!
    @IBOutlet weak var tapioca: UIButton!
    @IBOutlet weak var whitePearl: UIButton!
    @IBOutlet weak var pudding: UIButton!
    @IBOutlet weak var milkFoam: UIButton!
    @IBOutlet weak var cocoJelly: UIButton!
    @IBOutlet weak var redBean: UIButton!
    @IBOutlet weak var aiYu: UIButton!
    @IBOutlet weak var herbJelly: UIButton!
    @IBOutlet weak var aloe: UIButton!
    @IBOutlet weak var sugarStepper: UIStepper!
    
    
    // Variable values connected to UI Elements
    var pickerData: [String] = [String]()
    var sugarData: [String] = [String]()


    // Calculation Data
    
    var drinkCals = [90, 90, 90, 90, 150, 290, 265, 265, 265, 265, 270, 290, 150, 290, 170, 90, 215, 290, 250, 135, 290, 200, 200, 200, 170, 100, 90, 80, 250, 290, 150, 140, 150, 120, 120, 120, 130, 235, 190, 280, 215]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        //Connect data
        self.picker.delegate = self
        self.picker.dataSource = self
        calories.text = "0 cals"
        sugar.text = "70%"

        //Bubble tea options
        pickerData = ["Green Tea", "Black Tea", "Oolong Tea", "Earl Grey Tea", "Wintermelon Tea", "Dirty Brown Sugar Milk Tea", "Green Milk Tea", "Black Milk Tea", "Oolong Milk Tea", "Earl Grey Milk Tea", "Caramel Milk Tea", "Brown Sugar Milk Tea", "Winter Melon Milk Tea", "Strawberry Milk Tea", "Passionfruit Yogurt Slush", "Lychee Slush", "Mango Milk Slush", "Strawberry Milk Slush", "Taro Milk Slush", "Matcha Milk Slush", "Caramel Chocolate Slush", "Strawberry Green Tea", "Mango Green Tea", "Passionfruit Green Tea", "Lemon Green Tea", "Hibiscus Green Tea", "Honey Green Tea", "Lychee Oolong Tea", "Taro Milk Tea", "Caramel Chocolate Milk Tea", "Mango Yogurt Drink", "Lemon Yogurt Drink", "Strawberry Yogurt Drink", "Green Tea Latte", "Black Tea Latte", "Oolong Tea Latte", "Early Grey Tea Latte", "Chai Tea Latte","Matcha Tea Latte", "Thai Tea Latte", "Coffee Milk Tea"]
        
            
        let button  = UIButton(type: .system)

        self.view.addSubview(button as UIView)

        //Sugar Level Options
        sugarData = ["70%", "100%", "0%", "30%"]
        
        sugarStepper.wraps = true
        sugarStepper.autorepeat = true
        sugarStepper.minimumValue = 0
        sugarStepper.maximumValue = 3
        sugarStepper.value = 0

    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    /*METHODS FOR DRINK PICKER START HERE*/
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
    return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickerData.count
    }
    
    
    // The data to return fopr the row and component (column) that's being passed in
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return pickerData[row]
    }
    
    // Capture the picker view selection, returns index of option selected
    
    func pickerView1(pickerView: UIPickerView, didSelectRow row: Int) -> Int {
        // This method is triggered whenever the user makes a change to the picker selection.
        // The parameter named row represents what was selected.
        return row
    }
    
    /*METHODS FOR DRINK PICKER END HERE*/
    
    // Calculation and update function
    func updateCalorieView() {
        
        var sugarCalories: Int = 0
        
        if Singleton.shared.sugarSelected == 0 {
            sugarCalories = 0
        } else if Singleton.shared.sugarSelected == 1 {
            sugarCalories = 30
        } else if Singleton.shared.sugarSelected == 2 {
            sugarCalories = -60
        } else if Singleton.shared.sugarSelected == 3 {
            sugarCalories = -30
        }
        
        let liquidCalories: Int = Int( (Double(Singleton.shared.drinkCalories) + Double(sugarCalories)) * Singleton.shared.sizeSelected)
        
        //topping calorie add ons
        var tapiocaCals: Int = 0
        if Singleton.shared.addTapioca {
            tapiocaCals = 148
        } else {
            tapiocaCals = 0
        }
        
        var whitePearlCals: Int = 0
        if Singleton.shared.addWhitePearl {
            whitePearlCals = 26
        } else {
            whitePearlCals = 0
        }

        var puddingCals: Int = 0
        if Singleton.shared.addPudding {
            puddingCals = 23
        } else {
            puddingCals = 0
        }
        
        var milkFoamCals: Int = 0
        if Singleton.shared.addMilkFoam {
            milkFoamCals = 130
        } else {
            milkFoamCals = 0
        }
        
        var cocoJellyCals: Int = 0
        if Singleton.shared.addCocoJelly {
            cocoJellyCals = 130
        } else {
            cocoJellyCals = 0
        }
        
        var redBeanCals: Int = 0
        if Singleton.shared.addRedBean {
            redBeanCals = 130
        } else {
            redBeanCals = 0
        }
        
        var aiYuCals: Int = 0
        if Singleton.shared.addAiYu {
            aiYuCals = 11
        } else {
            aiYuCals = 0
        }
        
        var herbJellyCals: Int = 0
        if Singleton.shared.addHerbJelly {
            herbJellyCals = 16
        } else {
            herbJellyCals = 0
        }
        
        var aloeCals: Int = 0
        if Singleton.shared.addAloe {
            aloeCals = 16
        } else {
            aloeCals = 0
        }
        
        let toppingsTotal = tapiocaCals + whitePearlCals + puddingCals + milkFoamCals + cocoJellyCals + redBeanCals + aiYuCals + herbJellyCals + aloeCals
        
        let totalCalories = liquidCalories + toppingsTotal
        
        calories.text = "\(totalCalories) cals"
    }

    // Drink selection
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        
        Singleton.shared.drinkCalories = drinkCals[row]
        updateCalorieView()
    }
    
    //Switch sizes
    @IBAction func sizeStatus(_ sender: UISegmentedControl) {
        if size.selectedSegmentIndex == 1 {
            Singleton.shared.sizeSelected = 1.3
            updateCalorieView()
        } else if size.selectedSegmentIndex == 0 {
            Singleton.shared.sizeSelected = 1.0
            updateCalorieView()
        }
    }
    
    
    /*button.backgroundColor = .clear
    button.layer.cornerRadius = 5
    button.layer.borderWidth = 1
    button.layer.borderColor = UIColor.black.cgColor*/
    
    //TOPPINGS SELECTION
    
    @IBAction func tapiocaStatus (_ sender: AnyObject) {
        guard let button = sender as? UIButton else { return }
        
        if button.isSelected == false {
            button.backgroundColor = UIColor.white
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.tintColor.cgColor
            button.setTitleColor(UIColor.blue, for: .normal)
            button.isSelected = true
            Singleton.shared.addTapioca = true
            updateCalorieView()
        } else {
            button.backgroundColor = UIColor.white
            button.setTitleColor(UIColor.blue, for: .normal)
            button.layer.borderWidth = 0
            button.isSelected = false
            Singleton.shared.addTapioca = false
            updateCalorieView()
        }
    }

    @IBAction func whitePearlStatus (_ sender: AnyObject) {
        guard let button = sender as? UIButton else { return }
        
        if button.isSelected == false {
            button.backgroundColor = UIColor.white
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.tintColor.cgColor
            button.setTitleColor(UIColor.blue, for: .normal)
            button.isSelected = true
            Singleton.shared.addWhitePearl = true
            updateCalorieView()
        } else {
            button.backgroundColor = UIColor.white
            button.setTitleColor(UIColor.blue, for: .normal)
            button.layer.borderWidth = 0
            button.isSelected = false
            Singleton.shared.addWhitePearl = false
            updateCalorieView()
        }
    }
    
    @IBAction func puddingStatus (_ sender: AnyObject) {
        guard let button = sender as? UIButton else { return }
        
        if button.isSelected == false {
            button.backgroundColor = UIColor.white
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.tintColor.cgColor
            button.setTitleColor(UIColor.blue, for: .normal)
            button.isSelected = true
            Singleton.shared.addPudding = true
            updateCalorieView()
        } else {
            button.backgroundColor = UIColor.white
            button.setTitleColor(UIColor.blue, for: .normal)
            button.layer.borderWidth = 0
            button.isSelected = false
            Singleton.shared.addPudding = false
            updateCalorieView()
        }
    }
    
    @IBAction func milkFoamStatus (_ sender: AnyObject) {
        guard let button = sender as? UIButton else { return }
        
        if button.isSelected == false {
            button.backgroundColor = UIColor.white
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.tintColor.cgColor
            button.setTitleColor(UIColor.blue, for: .normal)
            button.isSelected = true
            Singleton.shared.addMilkFoam = true
            updateCalorieView()
        } else {
            button.backgroundColor = UIColor.white
            button.setTitleColor(UIColor.blue, for: .normal)
            button.layer.borderWidth = 0
            button.isSelected = false
            Singleton.shared.addMilkFoam = false
            updateCalorieView()
        }
    }
    
    @IBAction func cocoJellyStatus (_ sender: AnyObject) {
        guard let button = sender as? UIButton else { return }
        
        if button.isSelected == false {
            button.backgroundColor = UIColor.white
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.tintColor.cgColor
            button.setTitleColor(UIColor.blue, for: .normal)
            button.isSelected = true
            Singleton.shared.addCocoJelly = true
            updateCalorieView()
        } else {
            button.backgroundColor = UIColor.white
            button.setTitleColor(UIColor.blue, for: .normal)
            button.layer.borderWidth = 0
            button.isSelected = false
            Singleton.shared.addCocoJelly = false
            updateCalorieView()
        }
    }
    
    @IBAction func redBeanStatus (_ sender: AnyObject) {
        guard let button = sender as? UIButton else { return }
        
        if button.isSelected == false {
            button.backgroundColor = UIColor.white
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.tintColor.cgColor
            button.setTitleColor(UIColor.blue, for: .normal)
            button.isSelected = true
            Singleton.shared.addRedBean = true
            updateCalorieView()
        } else {
            button.backgroundColor = UIColor.white
            button.setTitleColor(UIColor.blue, for: .normal)
            button.layer.borderWidth = 0
            button.isSelected = false
            Singleton.shared.addRedBean = false
            updateCalorieView()
        }
    }
    
    @IBAction func aiYuStatus (_ sender: AnyObject) {
        guard let button = sender as? UIButton else { return }
        
        if button.isSelected == false {
            button.backgroundColor = UIColor.white
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.tintColor.cgColor
            button.setTitleColor(UIColor.blue, for: .normal)
            button.isSelected = true
            Singleton.shared.addAiYu = true
            updateCalorieView()
        } else {
            button.backgroundColor = UIColor.white
            button.setTitleColor(UIColor.blue, for: .normal)
            button.layer.borderWidth = 0
            button.isSelected = false
            Singleton.shared.addAiYu = false
            updateCalorieView()
        }
    }
    
    @IBAction func herbJellyStatus (_ sender: AnyObject) {
        guard let button = sender as? UIButton else { return }
        
        if button.isSelected == false {
            button.backgroundColor = UIColor.white
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.tintColor.cgColor
            button.setTitleColor(UIColor.blue, for: .normal)
            button.isSelected = true
            Singleton.shared.addHerbJelly = true
            updateCalorieView()
        } else {
            button.backgroundColor = UIColor.white
            button.setTitleColor(UIColor.blue, for: .normal)
            button.layer.borderWidth = 0
            button.isSelected = false
            Singleton.shared.addHerbJelly = false
            updateCalorieView()
        }
    }
    
    @IBAction func aloeStatus (_ sender: AnyObject) {
        guard let button = sender as? UIButton else { return }
        
        if button.isSelected == false {
            button.backgroundColor = UIColor.white
            button.layer.cornerRadius = 5
            button.layer.borderWidth = 2
            button.layer.borderColor = UIColor.tintColor.cgColor
            button.setTitleColor(UIColor.blue, for: .normal)
            button.isSelected = true
            Singleton.shared.addAloe = true
            updateCalorieView()
        } else {
            button.backgroundColor = UIColor.white
            button.setTitleColor(UIColor.blue, for: .normal)
            button.layer.borderWidth = 0
            button.isSelected = false
            Singleton.shared.addAloe = false
            updateCalorieView()
        }
    }

    @IBAction func stepperValueChanged(_ sender: UIStepper) {
        sugar.text = sugarData[Int(sender.value)]
        Singleton.shared.sugarSelected = Int(sender.value)
        updateCalorieView()
    }

}

