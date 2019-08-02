//
//  LibAddressViewController.swift
//  MountSinai
//
//  Created by Praveen on 16/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit
import MessageUI
import MapKit
import CoreLocation

class LibAddressViewController: BaseViewController, MFMailComposeViewControllerDelegate, MKMapViewDelegate, CLLocationManagerDelegate {
    
    var libraryName: String!
    var libraryLocation: String!
    var phoneNumber: String!
    var email: String!
    var libraryTimming: String!
    var libraryURL: String?
    var primaryContactFullAddress: String?
    var libraryNewTime: String?
    var latitudeData = Double()
    var longitudeData = Double()
    
    
    @IBOutlet weak var libraryNewTimeLabel: UILabel!
    
    @IBOutlet weak var libraryUrlButton: UIButton!
    
    @IBOutlet weak var libraryURLLabel: UILabel!
    
    @IBOutlet weak var emailButton: UIButton!
    
    @IBOutlet weak var scrollView: UIScrollView!
    
    @IBOutlet weak var containerView: UIView!
    @IBOutlet weak var libraryImage: UIImageView!
    
    @IBOutlet weak var libraryNameLabel: UILabel!
    @IBOutlet weak var libraryLocationLabel: UILabel!
    
    @IBOutlet weak var phoneNumberLabel: UILabel!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var libraryTimmingLabel: UILabel!
    
    @IBOutlet weak var libraryMapView: MKMapView!
    
    var locationManager:CLLocationManager!
    
    @IBOutlet weak var libLocationButton: UIButton!
    
    @IBOutlet weak var phoneNumberButton: UIButton!

    
    override func viewDidLoad() {
        super.viewDidLoad()
        setNavigationBar()
        self.libraryNameLabel.text = libraryName
        self.libraryLocationLabel.text = libraryLocation
    self.primaryContactFullAddress  = libraryLocationLabel.text
//        self.primaryContactFullAddress = "Bhavbhuti Marg, Kamla Market, Ajmeri Gate, New Delhi, Delhi 110006"
//        self.phoneNumberLabel.text = phoneNumber
//        self.emailLabel.text = email
        self.libraryTimmingLabel.text = libraryTimming
        self.libraryNewTimeLabel.text = libraryNewTime
//        self.libraryURLLabel.text = libraryURL
        self.libraryMapView.delegate =  self;
        
//        let location = CLLocationCoordinate2D(latitude: 40.7696,longitude: -73.9867)
        let location = CLLocationCoordinate2D(latitude: latitudeData,longitude: longitudeData)
        let span = MKCoordinateSpan(latitudeDelta: 0.07, longitudeDelta: 0.07)
        let region = MKCoordinateRegion(center: location, span: span)
        libraryMapView.setRegion(region, animated: true)
        
        let newYork = CityLocation(title: "New York", coordinate: CLLocationCoordinate2D(latitude: 40.7128, longitude:74.0060))
        
        libraryMapView.delegate = self
        
        let annotation = MKPointAnnotation()
        annotation.coordinate = CLLocationCoordinate2D(latitude: latitudeData , longitude: longitudeData )
        libraryMapView.addAnnotation(annotation)
        
//        let locations = [
//            ["title": "Levy Library",  "subtitle" :  "New York, 10029", "latitude": 40.7898, "longitude": -73.9529],
//            ["title": "Mount Sinai Beth Israel",  "subtitle" :"New York, 10003",    "latitude": 40.7341, "longitude": -73.9826],
//            ["title": "Mount Sinai St. Luke's IC", "subtitle" :"New York, 10025",     "latitude": 40.8002, "longitude": -73.9605],
//            ["title": "Mount Sinai West Library", "subtitle" :"New York, 10019",     "latitude": 40.7696, "longitude": -73.9867]
//        ]
//
//        for location in locations {
//            let annotation = MKPointAnnotation()
//
//            annotation.title = location["title"] as? String
//            annotation.subtitle = location["subtitle"] as? String
//            annotation.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! Double, longitude: location["longitude"] as! Double)
//            libraryMapView.addAnnotation(annotation)
//        }


    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        // Create and Add MapView to our main view
//        createMapView()
        libraryMapView.mapType = MKMapType.standard
        libraryMapView.isZoomEnabled = true
        libraryMapView.isScrollEnabled = true
        
        // Or, if needed, we can position map in the center of the view
        libraryMapView.center = view.center
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
//        determineCurrentLocation()
    }
    func createMapView()
    {
        libraryMapView = MKMapView()
        
        let leftMargin:CGFloat = 10
        let topMargin:CGFloat = 60
        let mapWidth:CGFloat = view.frame.size.width-20
        let mapHeight:CGFloat = 300
        
//        libraryMapView.frame = CGRectMake(leftMargin, topMargin, mapWidth, mapHeight)
           libraryMapView.frame   = CGRect(x: leftMargin, y: topMargin, width: mapWidth, height: mapHeight)
        
        libraryMapView.mapType = MKMapType.standard
        libraryMapView.isZoomEnabled = true
        libraryMapView.isScrollEnabled = true
        
        // Or, if needed, we can position map in the center of the view
        libraryMapView.center = view.center
        
        view.addSubview(libraryMapView)
    }
    
    func determineCurrentLocation()
    {
        locationManager = CLLocationManager()
        locationManager.delegate = self
        locationManager.desiredAccuracy = kCLLocationAccuracyBest
        locationManager.requestAlwaysAuthorization()
        
        if CLLocationManager.locationServicesEnabled() {
            //locationManager.startUpdatingHeading()
            locationManager.startUpdatingLocation()
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        guard !(annotation is MKUserLocation) else {
            return nil
        }
        
        let annotationIdentifier = "Identifier"
        var annotationView: MKAnnotationView?
        if let dequeuedAnnotationView = mapView.dequeueReusableAnnotationView(withIdentifier: annotationIdentifier) {
            annotationView = dequeuedAnnotationView
            annotationView?.annotation = annotation
        }
        else {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: annotationIdentifier)
            annotationView?.rightCalloutAccessoryView = UIButton(type: .custom)
        }
        
        if let annotationView = annotationView {
            
            annotationView.canShowCallout = false
            annotationView.image = UIImage(named: "BlackPin")
            
        }
        
        return annotationView
    }
    
    func locationManager(_ manager: CLLocationManager, didUpdateLocations locations: [CLLocation]) {
        let userLocation:CLLocation = locations[0] as CLLocation
        
        // Call stopUpdatingLocation() to stop listening for location updates,
        // other wise this function will be called every time when user location changes.
        //manager.stopUpdatingLocation()
        
        let center = CLLocationCoordinate2D(latitude: userLocation.coordinate.latitude, longitude: userLocation.coordinate.longitude)
        let region = MKCoordinateRegion(center: center, span: MKCoordinateSpan(latitudeDelta: 0.01, longitudeDelta: 0.01))
        
        libraryMapView.setRegion(region, animated: true)
        
        // Drop a pin at user's Current Location
        let myAnnotation: MKPointAnnotation = MKPointAnnotation()
        myAnnotation.coordinate = CLLocationCoordinate2DMake(userLocation.coordinate.latitude, userLocation.coordinate.longitude);
        myAnnotation.title = "Current location"
        libraryMapView.addAnnotation(myAnnotation)
    }
    
    func locationManager(manager: CLLocationManager, didFailWithError error: NSError)
    {
        print("Error \(error)")
    }
    
    
    
    
    
    @IBAction func actionLibraryURLButton(_ sender: UIButton) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ShowBookInWebViewController") as! ShowBookInWebViewController
        vc.showHeader = true
        vc.urlString = libraryURL ?? ""
        self.navigationController?.pushViewController(vc , animated: true)
    }
    
    @IBAction func actionLibLocationButton(_ sender: UIButton) {
        let testURL: NSURL = NSURL(string: "comgooglemaps-x-callback://")!
        if UIApplication.shared.canOpenURL(testURL as URL) {
            if let address = primaryContactFullAddress?.addingPercentEncoding(withAllowedCharacters: .urlHostAllowed) {
                let directionsRequest: String = "comgooglemaps-x-callback://" + "?daddr=\(address)" + "&x-success=sourceapp://?resume=true&x-source=AirApp"
                let directionsURL: NSURL = NSURL(string: directionsRequest)!
                let application:UIApplication = UIApplication.shared
                if (application.canOpenURL(directionsURL as URL)) {
                    application.open(directionsURL as URL, options: [:], completionHandler: nil)
                }
            }
        } else {
            NSLog("Can't use comgooglemaps-x-callback:// on this device.")
        }
        
        
    }
    
    @IBAction func actionPhoneNumberButton(_ sender: UIButton) {
        callNumber(phoneNumber: phoneNumber!)
    }
    
    @IBAction func actionEmailButton(_ sender: UIButton) {

        sendEmail()

    
    }
    
    
    
    // MARK:- Phone Nuber calling
    private func callNumber(phoneNumber:String) {
        
        if let phoneCallURL = URL(string: "tel://\(phoneNumber)") {
            
            let application:UIApplication = UIApplication.shared
            if (application.canOpenURL(phoneCallURL)) {
                application.open(phoneCallURL, options: [:], completionHandler: nil)
            }
        }
    }
    
    
    
    
    func sendEmail() {
    if MFMailComposeViewController.canSendMail() {
    let mail = MFMailComposeViewController()
    mail.mailComposeDelegate = self
    mail.setToRecipients([email])
    mail.setSubject("Bla")
    mail.setMessageBody("<b>Blabla</b>", isHTML: true)
    present(mail, animated: true, completion: nil)
    } else {
    print("Cannot send mail")
    // give feedback to the user
        let alert = UIAlertController(title: "Cannot send mail", message: "Device don't have Email sending App.", preferredStyle: UIAlertController.Style.alert)
        alert.addAction(UIAlertAction(title: "OK", style: UIAlertAction.Style.default, handler: nil))
        self.present(alert, animated: true, completion: nil)
    }
    }
    
    
    func mailComposeController(_ controller: MFMailComposeViewController, didFinishWith result: MFMailComposeResult, error: Error?) {
        switch result.rawValue {
        case MFMailComposeResult.cancelled.rawValue:
            print("Cancelled")
        case MFMailComposeResult.saved.rawValue:
            print("Saved")
        case MFMailComposeResult.sent.rawValue:
            print("Sent")
        case MFMailComposeResult.failed.rawValue:
            print("Error: \(String(describing: error?.localizedDescription))")
        default:
            break
        }
        controller.dismiss(animated: true, completion: nil)
    }
    
    
    
}
