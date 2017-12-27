
import UIKit

class DrinkView: UIViewController
{
    @IBOutlet weak var webView: UIWebView!
    
    var cname:String!
    var a1 : [String:Any] = [:]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cname=UserDefaults.standard.string(forKey: "cname")
        let url = URL(string: "https://en.wikivoyage.org/w/api.php?action=mobileview&page="+cname+"&sections=62&format=json")
        do
        {
            let contentData = try Data(contentsOf: url!)
            let allcontent =  try JSONSerialization.jsonObject(with: contentData, options: .allowFragments) as! [String:AnyObject]
            
            let arrJSON = allcontent["mobileview"]
            
            
            let a:[AnyObject] = arrJSON!["sections"] as! [AnyObject]
            print(a)
            for i in 0...a.count-1
            {
                
                let aObject=a[i] as! [String:AnyObject]
                
                print(aObject)
                if(i==62)
                {
                    
                    let Data2 : AnyObject = aObject["text"] as! AnyObject
                    webView.loadHTMLString(Data2 as! String , baseURL: nil)
                    
                }
                
            }
        }
        catch
        {
            
        }
        



}
}
