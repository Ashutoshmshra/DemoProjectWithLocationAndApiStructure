//
//  LibraryTimingViewController.swift
//  MountSinai
//
//  Created by Praveen on 16/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit

class LibraryTimingViewController: BaseViewController {
    
    @IBOutlet weak var showMapButton: UIButton!
    @IBOutlet weak var libraryDetailTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
        self.setNavigationBar()
        libraryDetailTableView.register(UINib(nibName: "LibraryTimeTableViewCell", bundle: nil), forCellReuseIdentifier: "LibraryTimeTableViewCell")
        
        //        showMapButton.layer.masksToBounds =  false
        //        showMapButton.layer.cornerRadius = 10.0
        //        showMapButton.layer.borderWidth = 0.01
        //        showMapButton.layer.borderColor = UIColor.lightGray.cgColor
        //        showMapButton.layer.shadowColor = UIColor.black.cgColor;
        //        showMapButton.layer.shadowOffset = CGSize(width: 1, height: 1)
        //        showMapButton.layer.shadowOpacity = 0.33
        //        showMapButton.layer.shadowRadius = 10.0
    }
    
    
    @IBAction func actionShowMapButton(_ sender: UIButton) {
        self.navigationController?.popViewController(animated: true)
        
    }
    
}
// MARK:- UITableViewDelegate and DataSource

extension LibraryTimingViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 4
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryTimeTableViewCell", for: indexPath) as! LibraryTimeTableViewCell
        
        if indexPath.row == 0 {
            cell.tiltleAddressLabel.text = "Levy Library"
            cell.subtitleAddressLabel.text = "O.G.L. Levy Place, Anberg 11, NY, 10029"
            cell.timingLabel.text = " Today’s Hours: 8 AM - 12 AM"
            cell.sideSubView.backgroundColor = UIColor(red: 216/255, green: 11/255, blue: 140/255, alpha: 1)
        }
        else  if indexPath.row == 1 {
            cell.tiltleAddressLabel.text = "Mount Sinai Beth Israel"
            cell.subtitleAddressLabel.text = "317 East 17th St, NY, 10003"
            cell.timingLabel.text = "Today’s Hours: 9 AM - 5 PM"
            cell.sideSubView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)        }
        else if indexPath.row == 2 {
            cell.tiltleAddressLabel.text = "Mount Sinai St. Luke's IC"
            cell.subtitleAddressLabel.text = "Muhlenberg Building, NY, 10025"
            cell.timingLabel.text = "Today’s Hours: 9 AM - 5 PM"
            cell.sideSubView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        }
        else {
            
            cell.tiltleAddressLabel.text = "Mount Sinai West Library"
            cell.subtitleAddressLabel.text = "1000 10th Avenue, NY, 10019"
            cell.timingLabel.text = "Today’s Hours: 9 AM - 5 PM"
            cell.sideSubView.backgroundColor = UIColor(red: 0/255, green: 0/255, blue: 0/255, alpha: 1)
        }
        
        
        
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 93
        
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        if indexPath.row == 0 {
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
        else if indexPath.row == 1 {
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
        else  if indexPath.row == 2 {
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
        else if indexPath.row == 3 {
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
}
