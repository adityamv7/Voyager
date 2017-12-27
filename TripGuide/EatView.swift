
import UIKit

class EatView: UIViewController
{
    
        var cname:String!
        var ind:Int!
      
        @IBOutlet weak var webView: UIWebView!
        var a1 : [String:Any] = [:]
        override func viewDidLoad() {
            super.viewDidLoad()
            cname=UserDefaults.standard.string(forKey: "cname")
            print(cname)
            let url = URL(string: "https://en.wikivoyage.org/w/api.php?action=mobileview&page="+cname+"&sections=55&format=json")
            do
            {
                let contentData = try Data(contentsOf: url!)
                let allcontent =  try JSONSerialization.jsonObject(with: contentData, options: .allowFragments) as! [String:AnyObject]
                
                let arrJSON = allcontent["mobileview"]
                
                
                let a:[AnyObject] = arrJSON!["sections"] as! [AnyObject]
                for i in 0...a.count-1
                {
                    
                    let aObject=a[i] as! [String:AnyObject]
                    
                    if(i==55)
                    {
                        
                        let Data2 : AnyObject = aObject["text"] as! AnyObject
                        print(Data2)
                        webView.loadHTMLString(Data2 as! String , baseURL: nil)
                        
                        
                        
                        
                    }
                    
                    
                    
                    
                    
                }
                
                
                
            }
            catch
            {
                
            }
            
            
            
            
        }


    }

