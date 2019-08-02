//
//  MapLocation.swift
//  MountSinai
//
//  Created by Praveen on 04/12/18.
//  Copyright © 2018 Mobikasa. All rights reserved.
//

import UIKit
import  MapKit

class MapLocation: UIView {

    @IBOutlet weak var containerView: UIView!
    
    @IBOutlet weak var tableView: UITableView!
    
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        commonInit()
    }
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        Bundle.main.loadNibNamed("MapLocation", owner: self, options: nil)
        addSubview(containerView)
        containerView.frame = self.bounds
        containerView.autoresizingMask = [.flexibleWidth,.flexibleHeight,.flexibleTopMargin]
        
    }
    
    
    
    override func awakeFromNib() {
        tableView.register(UINib(nibName: "LibraryTimeTableViewCell", bundle: nil), forCellReuseIdentifier: "LibraryTimeTableViewCell")
    }
    
}
extension MapLocation: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
        
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 3
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "LibraryTimeTableViewCell", for: indexPath) as! LibraryTimeTableViewCell
        cell.selectionStyle = .none
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 80
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
//        let vc = UIStoryboard.init(name: "Main", bundle: Bundle.main).instantiateViewController(withIdentifier: "LibAddressViewController") as? LibAddressViewController
////        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
}

