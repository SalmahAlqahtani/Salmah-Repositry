

import UIKit

class ViewController: UIViewController {
     
    override func viewDidLoad() {
        super.viewDidLoad()

        //Silver Challenge
        MyColor()
      
        
    }
    
    func MyColor(){
        
    let layer = CAGradientLayer()
   
    layer.frame = self.view.bounds
    layer.colors = [UIColor.red.cgColor,
                   UIColor.yellow.cgColor,
                   UIColor.green.cgColor,
                   UIColor.blue.cgColor]
        view.layer.addSublayer(layer)
        layer.frame.size = view.frame.size
        view.layer.insertSublayer(layer, at: 0)
    }
}




