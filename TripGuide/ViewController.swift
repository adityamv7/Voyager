//
//  ViewController.swift
//  TripGuide
//
//  Created by Mangal Compu Solution on 12/27/17.
//  Copyright © 2017 Mangal Compu Solution. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var str:String!
    var a : UIImage!
    var b : UIImage!
    var c : UIImage!
    var d : UIImage!
    var e : UIImage!
    
    
    var images : [UIImage]!
    var animatedimage : UIImage!
    @IBOutlet var textName: UITextField!
    @IBOutlet var imageView: UIImageView!
    @IBAction func search(_ sender: Any) {
        str = textName!.text!
        UserDefaults.standard.set(str, forKey: "cname")
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        a = UIImage(named: "city.jpg")
        b = UIImage(named: "london3.jpg")
        c = UIImage(named: "cityscape.png")
        d = UIImage(named: "mumbai.jpg")
        e = UIImage(named: "mumbai2.jpg")
        
        images = [a,b,c,d,e]
        
        animatedimage=UIImage.animatedImage(with: images, duration: 10.0)
        imageView.image=animatedimage
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

