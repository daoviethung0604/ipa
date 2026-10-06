import UIKit
import WebKit

class ViewController: UIViewController, WKNavigationDelegate {
    var webView: WKWebView!

    override func loadView() {
        let webConfiguration = WKWebViewConfiguration()
        webView = WKWebView(frame: .zero, configuration: webConfiguration)
        webView.navigationDelegate = self
        self.view = webView
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        let urlString = "https://daoviethung0604.github.io/neww/"
        
        if let url = URL(string: urlString) {
            let myRequest = URLRequest(url: url)
            webView.load(myRequest)
        }
    }

    // Xử lý khi trang web yêu cầu chuyển hướng hoặc mở liên kết mở Game
    func webView(_ webView: WKWebView, decidePolicyFor navigationAction: WKNavigationAction, decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
        if let url = navigationAction.request.url {
            let scheme = url.scheme?.lowercased() ?? ""
            
            // Nếu liên kết không phải là http hoặc https (ví dụ: freefire://, itms-apps://,...)
            if scheme != "http" && scheme != "https" && scheme != "about" {
                if UIApplication.shared.canOpenURL(url) {
                    UIApplication.shared.open(url, options: [:], completionHandler: nil)
                    decisionHandler(.cancel)
                    return
                }
            }
        }
        decisionHandler(.allow)
    }
}

class AppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {
        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = ViewController()
        window?.makeKeyAndVisible()
        return true
    }
}

UIApplicationMain(
    CommandLine.argc,
    CommandLine.unsafeArgv,
    nil,
    NSStringFromClass(AppDelegate.self)
)
