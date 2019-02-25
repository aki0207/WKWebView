import UIKit
import WebKit
class ViewController: UIViewController, WKUIDelegate ,WKNavigationDelegate{
    
    var webView: WKWebView!
    
    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.uiDelegate = self
        webView.navigationDelegate = self
        view = webView
    }
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let myURL = URL(string: "https://transit.yahoo.co.jp")
        let myRequest = URLRequest(url: myURL!)
        webView.load(myRequest)
    }
    


func webView(_ webView: WKWebView, didCommit navigation: WKNavigation!) {
    print("遷移開始")
}

func webView(_ webView: WKWebView, didFinish navigation: WKNavigation!) {
    print("読み込み完了")
    webView.evaluateJavaScript("document.getElementById(\"sfrom\").value=\"開始駅\"", completionHandler: nil)
    webView.evaluateJavaScript("document.getElementById(\"sto\").value=\"到着駅\"", completionHandler: nil)
    webView.evaluateJavaScript("document.getElementById(\"searchModuleSubmit\").click()", completionHandler: nil)
}

}
