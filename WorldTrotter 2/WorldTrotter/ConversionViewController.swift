

import UIKit

class ConversionViewController: UIViewController {
     
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        view.backgroundColor = colorBackground()
        
    print("ConversionViewController loaded its view ")

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





