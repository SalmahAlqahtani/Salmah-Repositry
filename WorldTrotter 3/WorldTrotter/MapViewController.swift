//
//  MapViewController.swift
//  WorldTrotter
//
//  Created by Salmah  on 27/02/1442 AH.
//

import UIKit
import MapKit

class MapViewController: UIViewController {
    
    var mapview : MKMapView!
    
    
    override func loadView() {
        mapview = MKMapView()
        view = mapview
        
        let segmentedControl = UISegmentedControl(items: ["Standered" , "Hybrid", "Satellite"])
        segmentedControl.backgroundColor = UIColor.systemBackground
        segmentedControl.selectedSegmentIndex = 0
        segmentedControl.addTarget(self, action:#selector(mapTypeChanged(_:)), for: .valueChanged)
        segmentedControl.translatesAutoresizingMaskIntoConstraints = false
        view.addSubview(segmentedControl)
        
 
        
        
        let topConstraint = segmentedControl.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor , constant: 8)
//        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: view.leadingAnchor)
//        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        
        topConstraint.isActive = true
       
        
        let margins = view.layoutMarginsGuide
        let leadingConstraint = segmentedControl.leadingAnchor.constraint(equalTo: margins.leadingAnchor)
        let trailingConstraint = segmentedControl.trailingAnchor.constraint(equalTo: margins.trailingAnchor)
        

        leadingConstraint.isActive = true
        trailingConstraint.isActive = true
        
    }
    
    
    
    
    
    @objc func mapTypeChanged(_ segControl : UISegmentedControl){
            switch segControl.selectedSegmentIndex{
            case 0 :
                mapview.mapType = .standard
            case 1 :
                mapview.mapType = .hybrid
            case 2 :
                mapview.mapType = .satellite
            default :
                break

            }
            
        }
    
    
    
    override func viewDidLoad() {
        let label = UILabel(frame: CGRect(x: 0, y: 0, width: 200, height: 21))
        label.center = CGPoint(x: 160, y: 285)
        label.textAlignment = .center
        label.text = "Points of Interest"
        self.view.addSubview(label)
        let mySwitch = UISwitch(frame: CGRect(x: 30, y: 30, width: 200, height: 20))
        mySwitch.addTarget(self, action:#selector(SwitchFunction(_:)), for: .valueChanged)
        mySwitch.isOn = true
        self.view.addSubview(mySwitch)

        
    }
    
    
    
    @objc func SwitchFunction(_ mySwitch : UISwitch){
     if mySwitch.isOn {
//            mapview.showsPointsOfInterest = true
         mapview.pointOfInterestFilter = .includingAll
         print("the switch is on")
         
     }else {
//            mapview.showsPointsOfInterest = false
         mapview.pointOfInterestFilter = .excludingAll

         
         print("the switch is off")


     }
     }
    

}
