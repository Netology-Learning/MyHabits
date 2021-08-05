//
//  HabitViewController.swift
//  MyHabits
//
//  Created by Mikhail Belokhvostov on 04.08.2021.
//

import UIKit

class HabitViewController: UIViewController {


    @IBOutlet weak var colorSampleView: UIView!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
// поле выбора цвета:
    @IBAction func pickColor(_ sender: Any) {
        let pickColor = UIColorPickerViewController()
        pickColor.selectedColor = colorSampleView.backgroundColor ?? UIColor.orange
        pickColor.supportsAlpha = false
        pickColor.delegate = self
        self.present(pickColor, animated: true, completion: nil)
    }
    var colorNewHabit: Any {
        return pickColor
    }
    
// текстовое поле названия привычки:
    @IBOutlet weak var textField: UITextField!
    var nameNewHabit: String {
        return textField.text ?? ""
    }
    
// поле выбора времени привычки:
    @IBOutlet weak var dateField: UIDatePicker!
    var dateNewHabit: Date {
        return dateField.date
    }

// нажатие кнопки "Создать"
    @IBAction func newHabit(_ sender: Any) {
        print("проверка кнопки Создать")
        let newHabit = Habit(name: nameNewHabit, date: dateNewHabit, color: .black)
//        let newHabit = Habit(name: nameNewHabit, date: dateNewHabit, color: colorNewHabit as! UIColor)
        let store = HabitsStore.shared
            store.habits.append(newHabit)
    }
    
    @IBAction func save(_ sender: Any) {
    }
    
    
    
}


extension HabitViewController: UIColorPickerViewControllerDelegate {
    func colorPickerViewControllerDidSelectColor(_ viewController: UIColorPickerViewController) {
        colorSampleView.backgroundColor = viewController.selectedColor
    }
    func colorPickerViewControllerDidFinish(_ viewController: UIColorPickerViewController) {
    }
}
