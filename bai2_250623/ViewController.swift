//
//  ViewController.swift
//  bai2_250623
//
//  Created by Nguyễn Quang Anh on 24/6/25.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var firstName: UITextField!
    
    @IBOutlet weak var lastName: UITextField!
    
    @IBOutlet weak var gender: UISegmentedControl!
    
    @IBOutlet weak var age: UITextField!
    
    @IBOutlet weak var height: UITextField!
    
    @IBOutlet weak var weight: UITextField!
    

    @IBOutlet weak var resultView: UIStackView!
    
    @IBOutlet weak var resultFullName: UILabel!
    
    @IBOutlet weak var resultGender: UILabel!
    
    @IBOutlet weak var resultHeight: UILabel!
    @IBOutlet weak var resultWeight: UILabel!
    
    @IBOutlet weak var resultAge: UILabel!
    
    @IBOutlet weak var resultBmi: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        resultView.isHidden = true
        resultView.alpha = 4
        
        // Reset label kết quả
        resultFullName.text = ""
        resultGender.text = ""
        resultHeight.text = ""
        resultWeight.text = ""
        resultAge.text = ""
        resultBmi.text = ""
    }

    @IBAction func completeButton(_ sender: Any) {
        
        // Validate tuổi
        guard let ageText = age.text, let ageValue = Int(ageText), (1...100).contains(ageValue) else {
            showAlert(message: "Tuổi phải từ 1 đến 100.")
            return
        }
        
        // Validate cân nặng
        guard let weightText = weight.text, let weightValue = Int(weightText), (16...200).contains(weightValue) else {
            showAlert(message: "Cân nặng phải từ 16 đến 200 kg.")
            return
        }
        
        // Validate chiều cao
        guard let heightText = height.text, let heightValue = Int(heightText), (50...230).contains(heightValue) else {
            showAlert(message: "Chiều cao phải từ 50 đến 230 cm.")
            return
        }
        
        // Lấy giới tính
        let selectedGender = gender.titleForSegment(at: gender.selectedSegmentIndex) ?? "Không xác định"
        
        resultFullName.text = "Họ và tên: \(lastName.text ?? "") \(firstName.text ?? "")"
        resultGender.text = "Giới tính: \(selectedGender)"
        resultHeight.text = "Chiều cao: \(heightValue) cm"
        resultWeight.text = "Cân nặng: \(weightValue) kg"
        resultAge.text = "Tuổi: \(ageValue) tuổi"
        let bmiValue = calculateBmi(height: heightValue, weight: weightValue)
        resultBmi.text = "BMI: \(bmiValue)"
    }
    
    func calculateBmi(height: Int, weight: Int) -> Double {
        let heightInMeters = Double(height) / 100.0
        let bmi = Double(weight) / (heightInMeters * heightInMeters)
        return round(bmi * 10) / 10.0 // Làm tròn 1 chữ số thập phân
    }
    
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Dữ liệu không hợp lệ", message: message, preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "OK", style: .default))
        present(alert, animated: true)
    }
    
}

