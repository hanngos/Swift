//
//  GeoViewController.swift
//  Lab3
//
//  Created by Student on 26/11/2020.
//  Copyright © 2020 pl.polsl.tm. All rights reserved.
//

import UIKit
import CoreLocation

class GeoViewController: UIViewController, CLLocationManagerDelegate {

    let locationManager = CLLocationManager()
    var location: CLLocation?
    
    let geocoder = CLGeocoder()
    var placemark: CLPlacemark?
    var performingReverseGeocoding = false
    var lastGeocodingError: Error?
    
    
    @IBOutlet weak var dLabel: UILabel!
    @IBOutlet weak var sLabel: UILabel!
    @IBOutlet weak var aLabel: UITextView!
    
    @IBOutlet weak var aButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        aButton.isEnabled = false
    }
    
    func locationName(from placemark: CLPlacemark) -> String {
     return
     "\(placemark.subThoroughfare ?? " ") \(placemark.thoroughfare ?? " ") \n" + "\(placemark.locality ?? " ") \(placemark.administrativeArea ?? " ")" + " \(placemark.postalCode ?? " ")"
     }
    
    @IBAction func getLocation(_ sender: UIButton) {
        let authStatus = CLLocationManager.authorizationStatus()
        if authStatus == .notDetermined {
            locationManager.requestWhenInUseAuthorization()
            return
        }
        if authStatus == .denied || authStatus == .restricted {
            showLocationServicesDeniedAlert()
            return
        }
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters
        locationManager.startUpdatingLocation()
        aButton.isEnabled = true
    }
    
    func showLocationServicesDeniedAlert(){
        let alert = UIAlertController(title: "Location Services Disabled", message: "Please enable location services for this app in Settings.", preferredStyle: .alert)
        
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alert.addAction(okAction)
        present(alert, animated: true, completion: nil)
        
    }
    
    
    @IBAction func getAddress(_ sender: UIButton) {
        if !performingReverseGeocoding {
            print("Wykonuje geokodowanie")
            performingReverseGeocoding = true
            geocoder.reverseGeocodeLocation(location!, completionHandler: {placemarks, error in print("***Znalazłem miejsce: \(placemarks), error: \(error)")
                if error == nil, let p = placemarks, !p.isEmpty{
                    self.placemark = p.last!
                    self.aLabel.text = self.locationName(from: self.placemark!)
                    self.performingReverseGeocoding = false
                }else{
                    self.placemark = nil
                }
            })
        }
    }
    
    func locationManager(_manager: CLLocationManager, didFailWithError error: Error){
        print("didFailWithError \(error)")
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]){
        let newLocation = locations.last!
        print("didUpdateLocations \(newLocation)")
        location = newLocation
        if let location = location{
            sLabel.text = String(format: "%.8f", location.coordinate.latitude)
            dLabel.text = String(format: "%.8f", location.coordinate.longitude)}
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
