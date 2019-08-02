
weak var mapLocationview: MapLocation!

import UIKit
import MapKit

struct Location {
    let title: String
    let latitude: Double
    let longitude: Double
}
class CityLocation: NSObject, MKAnnotation {
    var title: String?
    var coordinate: CLLocationCoordinate2D
    
    
    init(title: String, coordinate: CLLocationCoordinate2D) {
        self.title = title
        self.coordinate = coordinate
        
    }
}
private let reuseIdentifier = "CustomPin"
class MapViewController: BaseViewController,MKMapViewDelegate, CLLocationManagerDelegate {
    @IBOutlet weak var mapView: MKMapView!
    @IBOutlet weak var libraryLocationButton: UIButton!
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var locationListView: UIView!
    
    var anotationtitle = String()
    var arrayMapData = [MapModelData]()
    var selectedImage = UIImage(named: "BlackPin")
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadMapData()
//        self.setnavigationWithoutBack()
        setNavigationBarWithRight()
        tableView.register(UINib(nibName: "LibraryTimeTableViewCell", bundle: nil), forCellReuseIdentifier: "LibraryTimeTableViewCell")
        mapView.mapType = MKMapType.standard
        
        let tapGesture = UITapGestureRecognizer(target: self, action: #selector(mapviewTaped))
        mapView.addGestureRecognizer(tapGesture)
        let location = CLLocationCoordinate2D(latitude: 40.7696,longitude: -73.9867)
        let span = MKCoordinateSpan(latitudeDelta: 0.09, longitudeDelta: 0.09)
        let region = MKCoordinateRegion(center: location, span: span)
        mapView.setRegion(region, animated: true)
        
        let newYork = CityLocation(title: "New York", coordinate: CLLocationCoordinate2D(latitude: 40.7128, longitude:74.0060))
        
        mapView.delegate = self
        let locations = [
            ["title": "Levy Library",  "subtitle" :  "New York, 10029", "latitude": 40.7898, "longitude": -73.9529],
            ["title": "Mount Sinai Beth Israel",  "subtitle" :"New York, 10003",    "latitude": 40.7341, "longitude": -73.9826],
            ["title": "Mount Sinai St. Luke's IC", "subtitle" :"New York, 10025",     "latitude": 40.8002, "longitude": -73.9605],
            ["title": "Mount Sinai West Library", "subtitle" :"New York, 10019",     "latitude": 40.7696, "longitude": -73.9867]
        ]
        
        for location in locations {
            let annotation = MKPointAnnotation()
            
            annotation.title = location["title"] as? String
            annotation.subtitle = location["subtitle"] as? String
            annotation.coordinate = CLLocationCoordinate2D(latitude: location["latitude"] as! Double, longitude: location["longitude"] as! Double)
            mapView.addAnnotation(annotation)
        }

        
    }
    
    @objc func mapviewTaped(){
        if (!self.locationListView.isHidden){
            hideViewWithAnimation()
//            self.selectedImage = UIImage(named: "LocationBlack")
        }
        
    }
    
    // MARK:- View With Animation
    func showViewWithAnimation() {
        let height: CGFloat = UIScreen.main.bounds.size.height
        let width: CGFloat = UIScreen.main.bounds.size.width
        UIView.animate(withDuration: 0.33, delay: 0.3, options: .curveEaseIn, animations: {
            self.locationListView.frame = CGRect(x: 0, y: height - height / 2, width: width, height: height / 2)
            
        }) { finished in
            self.locationListView.isHidden = false
        }
    }
    
    func hideViewWithAnimation() {
        let height: CGFloat = UIScreen.main.bounds.size.height
        let width: CGFloat = UIScreen.main.bounds.size.width
        UIView.animate(withDuration: 0.5, delay: 0.2, options: .curveEaseIn, animations: {
            self.locationListView.frame = CGRect(x: 0, y: height, width: width, height: height / 2)
        }) { finished in
            if finished {
                self.locationListView.isHidden = true
            }
        }
    }
    
    
    @IBAction func actionLibraryButton(_ sender: UIButton) {
//        sender.isSelected = !sender.isSelected
        
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
            annotationView.image = selectedImage
        
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, didSelect view: MKAnnotationView) {
        
        self.anotationtitle = view.annotation?.title! ?? ""
        if view.isSelected == true {
            view.image = UIImage(named: "location_active")
        }
        else {
            
        }
        self.showViewWithAnimation()

        print("Current Annotation title is:- \(anotationtitle)")
        let obj = arrayMapData.filter{$0.title == self.anotationtitle}[0]
        arrayMapData.remove(at: arrayMapData.firstIndex(of: obj)!)
        arrayMapData.insert(obj, at: 0)
        tableView.reloadData()
    }
    
    func mapView(_ mapView: MKMapView, didDeselect view: MKAnnotationView) {
        view.image = UIImage(named: "BlackPin")
        if (!self.locationListView.isHidden){
            hideViewWithAnimation()
        }
    }
    
    func loadMapData(){
        
        let obj1 = MapModelData(title: "Levy Library", subtitle: "O.G.L. Levy Place, Anberg 11, NY, 10029", timing: "Today’s Hours: 8 AM - 12 AM", subViewBackColor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1))
        arrayMapData.append(obj1)
//        tableView.reloadData()
        let obj2 = MapModelData(title: "Mount Sinai Beth Israel", subtitle: "317 East 17th St, NY, 10003", timing: "Today’s Hours: 9 AM - 5 PM", subViewBackColor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1))
        arrayMapData.append(obj2)
//        tableView.reloadData()
        let obj3 = MapModelData(title: "Mount Sinai St. Luke's IC", subtitle: "Muhlenberg Building, NY, 10025", timing: "Today’s Hours: 9 AM - 5 PM", subViewBackColor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1))
        arrayMapData.append(obj3)
       
        
        let obj4 = MapModelData(title: "Mount Sinai West Library", subtitle: "1000 10th Avenue, NY, 10019", timing: "Today’s Hours: 9 AM - 5 PM", subViewBackColor: UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1))
        arrayMapData.append(obj4)
        tableView.reloadData()
        
        
    }
}

extension MapViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return arrayMapData.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryTimeTableViewCell", for: indexPath) as! LibraryTimeTableViewCell
        
        cell.displayData(mapData: arrayMapData[indexPath.row])
        if indexPath.row == 0 {
            cell.sideSubView.backgroundColor = UIColor(red: 216/255, green: 11/255, blue: 140/255, alpha: 1)
        }
        
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryTimeTableViewCell", for: indexPath) as! LibraryTimeTableViewCell
        
   
        
        cell.displayData(mapData: arrayMapData[indexPath.row])
        if  arrayMapData[indexPath.row].title ==  "Levy Library" {
//        if indexPath.row == 0 {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LibAddressViewController") as? LibAddressViewController
            vc?.libraryName = "Levy Library"
            vc?.latitudeData = 40.7898
                vc?.longitudeData = -73.9529 
            vc?.libraryLocation = "One Gustave L. Levy Place, Annenberg 11,\n New York, NY, 10029"
            vc?.email = "refdesk@mssm.edu"
            vc?.libraryURL = "https://icahn.mssm.edu/about/ait/levy-library"
            vc?.phoneNumber = "212-241-7791"
            vc?.libraryTimming = "Monday: \n\nTuesday: \n\nWednesday: \n\nThursday: \n\nFriday: \n\nSaturday: \n\nSunday: "
            vc?.libraryNewTime = "8:00am - 12:00am\n\n 8:00am - 12:00am\n\n 8:00am - 12:00am\n\n 8:00am - 12:00am\n\n 8:00am - 12:00am\n\n 9:00am - 12:00am\n\n 10:00am - 12:00am"
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
         else if ( (arrayMapData[indexPath.row].title) ==  "Mount Sinai Beth Israel") {
//        else if indexPath.row == 1 {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LibAddressViewController") as? LibAddressViewController
            vc?.libraryName = "Mount Sinai Beth Israel"
            vc?.latitudeData = 40.7341
            vc?.longitudeData = -73.9826
            vc?.libraryLocation = "317 East 17th St, Fierman Hall, 12th floor,\n New York, NY, 10003"
            vc?.email = "librarymsbi@mountsinai.org"
            vc?.libraryURL = "https://libguides.mssm.edu/MSBI_Library"
            vc?.phoneNumber = "212-420-3858"
            vc?.libraryTimming = "Monday: \n\nTuesday: \n\nWednesday: \n\nThursday: \n\nFriday: "
            
            vc?.libraryNewTime = "9:00am - 5:00pm\n\n 9:00am - 5:00pm\n\n 9:00am - 5:00pm\n\n 9:00am - 5:00am\n\n 9:00am - 5:00pm"
            self.navigationController?.pushViewController(vc!, animated: true)
        }
       else if arrayMapData[indexPath.row].title ==  "Mount Sinai St. Luke's IC" {
//        else  if indexPath.row == 2 {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LibAddressViewController") as? LibAddressViewController
            vc?.libraryName = "Mount Sinai St. Luke's Information Commons"
            vc?.latitudeData = 40.8002
            vc?.longitudeData = -73.9605
            
            vc?.libraryLocation = "Muhlenberg Building, 5th floor,\n New York, NY, 10025"
            vc?.email = "msslwlibrary@mountsinai.org"
            vc?.libraryURL = "https://libguides.mssm.edu/MSWSL"
            vc?.phoneNumber = "212-523-4315"
            vc?.libraryTimming = "Monday: \n\nTuesday: \n\nWednesday: \n\nThursday: \n\nFriday: "
            
            vc?.libraryNewTime = "9:00am - 5:00pm\n\n 9:00am - 5:00pm\n\n 9:00am - 5:00pm\n\n 9:00am - 5:00am\n\n 9:00am - 5:00pm"
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
       else if  arrayMapData[indexPath.row].title ==  "Mount Sinai West Library" {
//        else if indexPath.row == 3 {
            let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LibAddressViewController") as? LibAddressViewController
            vc?.libraryName = "Mount Sinai West Library"
            vc?.latitudeData = 40.7696
            vc?.longitudeData = -73.9867
            vc?.libraryLocation = "1000 10th Avenue, Room 2A-10 (Near chapel),\n New York, NY, 10019"
            vc?.email = "msslwlibrary@mountsinai.org"
            vc?.libraryURL = "https://libguides.mssm.edu/MSWSL"
            vc?.phoneNumber = "212-523-6100"
            vc?.libraryTimming = "Monday: \n\nTuesday: \n\nWednesday: \n\nThursday: \n\nFriday: "
            
            vc?.libraryNewTime = "9:00am - 5:00pm\n\n 9:00am - 5:00pm\n\n 9:00am - 5:00pm\n\n 9:00am - 5:00am\n\n 9:00am - 5:00pm"
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return UITableView.automaticDimension
    }
}




