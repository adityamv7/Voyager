//
//  SearchByListVC.swift
//  TripGuide
//
//  Created by Mangal Compu Solution on 12/27/17.
//  Copyright © 2017 Mangal Compu Solution. All rights reserved.
//

import UIKit

class SearchByListVC: UIViewController,UITableViewDelegate,UITableViewDataSource {

    var cname:String!
    var country:[String] = []
    var urls:[String] = []
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        let url = URL(string:"http://countryapi.gear.host/v1/Country/getCountries")
        do{
            let allCountryData = try Data(contentsOf: url!)
            let allCountry = try JSONSerialization.jsonObject(with: allCountryData, options: JSONSerialization.ReadingOptions.allowFragments) as! [String:AnyObject]
            if let arrJSON = allCountry["Response"]{
                let a:[AnyObject] = arrJSON as! [AnyObject]
                for i in 0...a.count-1{
                    let aObject = a[i]
                    country.append(aObject["Name"] as! String)
                    urls.append(aObject["FlagPng"] as! String)
                    //print(country)
                }
            }
            self.tableView.reloadData()
            
        }catch{
            
        }
        
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return country.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "mycell") as! MyCell
        cell.lblName.text = country[indexPath.row]
        do{
            let url1 = URL(string:urls[indexPath.row])
            let data = try Data(contentsOf: url1!)
            cell.imageView?.image = UIImage(data:data)
        }catch{
            
        }
        
        return cell
    }
    
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if(segue.identifier=="searchlistSegue"){
            var i:[IndexPath] = tableView.indexPathsForSelectedRows!
            let t=i[0].row
            let infoVC = segue.destination as! InformationVc
            cname=String(country[t])
            UserDefaults.standard.set(cname, forKey: "cname")
            infoVC.vc = self
        }
    

}
}
