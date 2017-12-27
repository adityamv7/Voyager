

import UIKit

class HotelsView: UIViewController {

    var cname:String!
    var a1 : [String:Any] = [:]
    
    
    @IBOutlet weak var webViewAround: UIWebView!
    override func viewDidLoad() {
        super.viewDidLoad()
        cname=UserDefaults.standard.string(forKey: "cname")
        let url = URL(string: "https://en.wikivoyage.org/w/api.php?action=mobileview&page="+cname+"&sections=63&format=json")
        do
        {
            let contentData = try Data(contentsOf: url!)
            let allcontent =  try JSONSerialization.jsonObject(with: contentData, options: .allowFragments) as! [String:AnyObject]
            
            let arrJSON = allcontent["mobileview"]
            
            
            let a:[AnyObject] = arrJSON!["sections"] as! [AnyObject]
            for i in 0...a.count-1
            {
                
                let aObject=a[i] as! [String:AnyObject]
                
                if(i==63)
                {
                    
                    var Data2 : AnyObject = aObject["text"] as! AnyObject
                    webViewAround.loadHTMLString(Data2 as! String , baseURL: nil)
                    
                }
                
            }
        }
        catch
        {
            
        }
        
    }

    

}
