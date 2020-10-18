

import UIKit

class ConversionViewController: UIViewController , UITextFieldDelegate {
    
    @IBOutlet var celsiusLable : UILabel!
    @IBOutlet var textField : UITextField!
    
    
    var fehranhaiteVlue : Measurement<UnitTemperature>? {
        didSet{
            updateCelsiuseLable()
        }
    }
    
    
    let numberFormatter : NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .decimal
        nf.maximumFractionDigits = 0
        nf.maximumFractionDigits = 1
        return nf
    }()
    
    
    var celsiusValue :Measurement<UnitTemperature>?{
        if let fehranhaiteVlue = fehranhaiteVlue {
            
            return fehranhaiteVlue.converted(to: .celsius)
            
        }else {
            return nil
        }
    }
    
//    var celsiusValue : Measurement<UnitTemperature>?{
//        if let fehranhaiteVlue =
//    }
//
    override func viewDidLoad() {
        super.viewDidLoad()
    view.backgroundColor = colorBackground()
    print("ConversionViewController loaded its view ")
        updateCelsiuseLable()

    }
    
    
    func textField(_ textField : UITextField , shouldChangeCharactersIn range: NSRange , replacementString string : String )->Bool {
      
//        let exsitingTextHasDecimalSeprator = textField.text?.range(of: ".")
//        let replacmentTextHasDecimalSeprator = textField.text?.range(of: ".")
        let currentLocal = Locale.current
        let decimalSeprator = currentLocal.decimalSeparator ?? "."
        let exsistingTextHasDecimalSeprator = textField.text?.range(of: decimalSeprator)
        let replacementTextHasDecimalSeprator = string.range(of: decimalSeprator)
        
        
        if exsistingTextHasDecimalSeprator != nil , replacementTextHasDecimalSeprator != nil{
                return false
            } else {
                //Bronze Challenge
                // If char is number or . then return true

                if CharacterSet.decimalDigits.isSuperset(of: CharacterSet(charactersIn: string)) || (string.range(of: ".") != nil) {
                return true
                }
                else {
                    return false
                }
                
            }
        
        }
    
    
    
    func updateCelsiuseLable(){
        if let celsiusValue = celsiusValue {
            celsiusLable.text = numberFormatter.string(from: NSNumber(value: celsiusValue.value))
        }else{
            celsiusLable.text = "???"
        }
    }
    
    @IBAction func fehrenhaiteFieldEditingChanged(_ textField : UITextField){
        
        if let text = textField.text , let number = numberFormatter.number(from: text) {
            fehranhaiteVlue = Measurement(value: number.doubleValue, unit: .fahrenheit)
        }else {
            fehranhaiteVlue = nil
        }
        
    }
    
    
    @IBAction func DissmissKeyBoard(_ sender : UITapGestureRecognizer){
        
        textField.resignFirstResponder()
        
    }
    
    
    

    func colorBackground() -> UIColor {

         // TODO: set a random color
        let colors = [
            UIColor(red: 233/255, green: 203/255, blue: 198/255, alpha: 1),
            UIColor(red: 38/255, green: 188/255, blue: 192/255, alpha: 1),
            UIColor(red: 253/255, green: 221/255, blue: 164/255, alpha: 1),
            UIColor(red: 235/255, green: 154/255, blue: 171/255, alpha: 1),
            UIColor(red: 87/255, green: 141/255, blue: 155/255, alpha: 1)
        ]
        
        return colors[Int.random(in: 0...4)]

     }

}



