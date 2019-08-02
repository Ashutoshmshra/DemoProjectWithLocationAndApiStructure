//
//  UpcomingEventsViewController.swift
//  MountSinai
//
//  Created by Mobikasa on 16/11/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit

enum Month: String {
    
    case January = "Jan" , February = "Feb", March = "Mar", April = "Apr", May = "May", June = "Jun", July = "July", August = "Aug", September = "Sept", October = "Oct", November = "Nov", December = "Dec"
}


class UpcomingEventsViewController: BaseViewController {
    let headerTitles = "Live Well.Study Well"
    let headerTitle2 = "Upcoming Events"
//    let sectionTitles:[String]=["Live Well.Study Well"]
    let sectionImages: UIImage = UIImage(named: "LiveWell Icon")!
    
    
    var eventdata: EventDataModel?
    var numberOfSection: Int = 2
    
    
    @IBOutlet weak var eventsTableView: UITableView!
    override func viewDidLoad() {
        super.viewDidLoad()
//        setnavigationWithoutBack()
        setNavigationBarWithRight()
        eventsTableView.register(UINib(nibName: "UpcomingEventsTableViewCell", bundle: nil), forCellReuseIdentifier: "UpcomingEventsTableViewCell")
        callGetEventDataApi()
        
        
        print("Hello test \(String(describing: Month.init(rawValue: "Jan")))")
         let yearMonth = Month.May.rawValue
        print("Value of the Month is: \(yearMonth).")
        
        
    }
    
    func getShortMonth(month: String) -> String {
        switch month {
        case "January":
            return "JAN"
        case "February":
            return "FEB"
        case "March":
            return "MAR"
        case "April":
            return "APR"
        case "May":
            return "MAY"
        case "June":
            return "JUN"
        case "July":
            return "JUL"
        case "August":
            return "AUG"
        case "September":
            return "SEPT"
        case "October":
            return "OCT"
        case "November":
            return "NOV"
        case "December":
            return "DEC"
            
        default:
            return ""
        }
    }
    
    
}

extension UpcomingEventsViewController {
    
    func callGetEventDataApi() {
        if !NetworkManager.isConnectedToInternet() {
            weak var weakSelf = self
            // Show Alert ---
            alertForInternet()
            print("Please check your internet connection!")
            weakSelf?.callGetEventDataApi()
            return
        }
        
        MKServiceManager.getEventData { [weak self](response, stutus, error, statusCode) -> (Void) in
            if statusCode == 200 {
                if let response = response {
       
                    let message = response["message"] as? String
                    if let data = response ["data"] as? [String:Any] {
                        self?.eventdata = EventDataModel(object: response)
                        
                        if self?.eventdata?.data?.upcomming_events?.count == 0 &&  self?.eventdata?.data?.wellness_events?.count == 0{
                            print("No Events are scheduled !")
                            self?.numberOfSection = 2
                            return
                        }
//                        else if self?.eventdata?.data?.upcomming_events?.count == 0 || self?.eventdata?.data?.wellness_events?.count == 0{
//                            self?.numberOfSection = 1
//                        }
                        else {
                        
//                        if let title = self?.eventdata?.data?.upcomming_events?[0].title, let href = self?.eventdata?.data?.upcomming_events?[0].href, let date = self?.eventdata?.data?.upcomming_events?[0].date{
//                            self?.eventdata?.data?.upcomming_events?[0].title = title
//                            self?.eventdata?.data?.upcomming_events?[0].href = href
//                            self?.eventdata?.data?.upcomming_events?[0].date = date
//                        }
//                        self!.eventsTableView.reloadData()
                        
                    if let jsonData = self?.eventdata?.toData(){
                            AppConstants.SaveUserDefaults(value: jsonData, key: AppConstants.USERDETAILS)
                            
                        }
                       self!.eventsTableView.reloadData()
                    }
                }
                }
            }
            else{
                if let response = response{
                    if let message = response["message"]
                    {
                        //self.alertFunction(message: message as! String)
                    }
                }
            }
        }
        
    }
    
    
    
}








// MARK:- UITableView delegate and dataSource

extension UpcomingEventsViewController: UITableViewDelegate,UITableViewDataSource{
    
    func numberOfSections(in tableView: UITableView) -> Int {
         if self.eventdata?.data?.wellness_events?.count == 0 &&  self.eventdata?.data?.upcomming_events?.count == 0{
        return 2
        }
//         else if self.eventdata?.data?.wellness_events?.count == 0 ||  self.eventdata?.data?.upcomming_events?.count == 0{
//            return 1
//        }
         else {
            return 2
        }
    }
    
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        if section==0{
            if self.eventdata?.data?.wellness_events?.count == 0 {
                return 1
            }
            else {
                return self.eventdata?.data?.wellness_events?.count ?? 1
//            return 1
            }
        }
        else {
            
            if self.eventdata?.data?.upcomming_events?.count == 0 {
                return 1
            }
            else {
                return self.eventdata?.data?.upcomming_events?.count ?? 1
                //            return 1
            }
        }
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = eventsTableView.dequeueReusableCell(withIdentifier: "UpcomingEventsTableViewCell", for: indexPath) as! UpcomingEventsTableViewCell
        cell.selectionStyle = .none
        if indexPath.section == 0 {
            
            if self.eventdata?.data?.wellness_events?.count != 0 {
//            cell.titleLabel.text = "Tail Tuesday"
//            cell.subTitlelabel.text = "Annenberg 10th Floor"
          cell.calenderButton.backgroundColor = UIColor(red: 0/255, green: 174/255, blue: 239/255, alpha: 1)
                cell.dateLabel.backgroundColor = UIColor(red: 0/255, green: 174/255, blue: 239/255, alpha: 1)
           cell.selectionStyle = .none
                let str1 = self.eventdata?.data?.wellness_events?[indexPath.row].date
                let arr = str1?.split(separator: " ")
                var time: String?
                var month: String?
                var date: String?
                var newDate: String?

                print("Seprator array is --\(String(describing: arr))")
                if arr?.count == 7 {
                  time = String(arr![0])
                  month = String(arr![4])
                  date = String(arr![5])
                  let arrDate = date?.split(separator: ",")
                    print("arr of date is ---\(String(describing: arrDate))")
                    newDate = String(arrDate![0])
                    
                    
                }
                let shortMonth = Month.January.rawValue
            cell.titleLabel.text  = self.eventdata?.data?.wellness_events?[indexPath.row].title ?? "No events are scheduled"
//            cell.dateLabel.text  = "\(String(describing: month!))\n\(String(describing: newDate!))"
//                cell.newMonthLabel.text = month!
                cell.newMonthLabel.text = getShortMonth(month: month ?? "")
                cell.newDateLabel.text = newDate ?? ""
                cell.timeLabel.text = time
                return cell
                

            }
            else {
//                cell.titleLabel.text = "No events are scheduled"
//                cell.dateLabel.text = ""
//                cell.calenderButton.backgroundColor = UIColor(red: 0/255, green: 174/255, blue: 239/255, alpha: 1)
//                cell.dateLabel.backgroundColor = UIColor(red: 0/255, green: 174/255, blue: 239/255, alpha: 1)
                cell.noEventsLabel.isHidden = false
                return cell
            }
        }
        else {
            if self.eventdata?.data?.upcomming_events?.count != 0 {
//            cell.titleLabel.text = "Introduction to EndNote"
//            cell.subTitlelabel.text = "Icahn School of Medicine"
                
                let str1 = self.eventdata?.data?.upcomming_events?[indexPath.row].date
                let arr = str1?.split(separator: " ")
                var time: String?
                var month: String?
                var date: String?
                var newDate: String?
                
                print("Seprator array is --\(String(describing: arr))")
                if arr?.count == 7 {
                    time = String(arr![0])
                    month = String(arr![4])
                    date = String(arr![5])
                    let arrDate = date?.split(separator: ",")
                    print("arr of date is ---\(String(describing: arrDate))")
                    newDate = String(arrDate![0])
                    
                    
                }
          
           cell.calenderButton.backgroundColor = UIColor(red: 34/255, green: 31/255, blue: 114/255, alpha: 1)
                cell.dateLabel.backgroundColor = UIColor(red: 34/255, green: 31/255, blue: 114/255, alpha: 1)
            cell.selectionStyle = .none
            cell.titleLabel.text  =  self.eventdata?.data?.upcomming_events?[indexPath.row].title ?? "No events are scheduled"

//            cell.dateLabel.text  = "\(String(describing: month!))\n\(String(describing: newDate!))"
//                cell.newMonthLabel.text = month!
                cell.newMonthLabel.text = getShortMonth(month: month ?? "")
                cell.newDateLabel.text = newDate
                cell.timeLabel.text = time ?? ""
                return cell
        }
        else {
            
//            cell.titleLabel.text = "No events are scheduled"
//            cell.dateLabel.text = ""
//                cell.calenderButton.backgroundColor = UIColor(red: 34/255, green: 31/255, blue: 114/255, alpha: 1)
//                cell.dateLabel.backgroundColor = UIColor(red: 34/255, green: 31/255, blue: 114/255, alpha: 1)
               cell.noEventsLabel.isHidden = false
                
                return cell
        }
    }
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 110
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "ShowBookInWebViewController") as! ShowBookInWebViewController
        if indexPath.section == 0 {
            if self.eventdata?.data?.wellness_events?.count != 0 {
                vc.urlString = self.eventdata?.data?.wellness_events?[indexPath.row].href ?? "https://api3.libcal.com/api_events.php?iid=3035&m=upc&cid=10053&audience=&c=&d=&l=5&simple=ul_date"
                self.navigationController?.pushViewController(vc, animated: true)
                print("Live Well. Study Well. ")
                
            }
            else {
   
//                vc.urlString = "https://api3.libcal.com/api_events.php?iid=3035&m=upc&cid=10053&audience=&c=&d=&l=5&simple=ul_date"
//                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        else {
            if self.eventdata?.data?.upcomming_events?.count != 0 {
                vc.urlString = self.eventdata?.data?.upcomming_events?[indexPath.row].href ?? "https://api3.libcal.com/api_events.php?iid=3035&m=upc&cid=10053&audience=&c=&d=&l=5&simple=ul_date"
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
            else {
//                vc.urlString = "https://api3.libcal.com/api_events.php?iid=3035&m=upc&cid=10053&audience=&c=&d=&l=5&simple=ul_date"
//                self.navigationController?.pushViewController(vc, animated: true)
        }
        }
    }
    
    func tableView(_ tableView: UITableView, titleForHeaderInSection section: Int) -> String? {
        if section == 0{
            if self.eventdata?.data?.wellness_events?.count != nil {
            
            return headerTitles
            }
            else  {
                return nil
            }
        }
        else{
            if self.eventdata?.data?.upcomming_events?.count != nil {
            return headerTitle2
        }
            else {
                return nil
            }
    }
    }
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        return 50
    }
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        let view1 = UIView()
        view1.backgroundColor = UIColor.white
        
        let view2 = UIView()
        view2.backgroundColor = UIColor.white
        
        let image = UIImageView(image:UIImage(named: "LiveWell Icon")!)
        image.frame=(CGRect(x: 12, y:5, width: 35, height: 35))
        view1.addSubview(image)
        if section == 0{
        let label = UILabel()
        label.text=headerTitles
        //       label.font = UIFont(name:"Helvetica Neue", size: 20)
        label.font = UIFont.boldSystemFont(ofSize: 22.0)
        label.frame=(CGRect(x: 60, y: 5, width: 250, height: 35))
        view1.addSubview(label)
            return view1
        }
        else {
        let label1 = UILabel()
        label1.text=headerTitle2
        //       label.font = UIFont(name:"Helvetica Neue", size: 20)
        label1.font = UIFont.boldSystemFont(ofSize: 22.0)
        label1.frame=(CGRect(x: 10, y: 5, width: 250, height: 35))
        view2.addSubview(label1)
        
     
        return view2
        
        }
    }
    
}
