import UIKit

class ViewController: UIViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Cấu hình giao diện cơ bản
        view.backgroundColor = UIColor.systemBackground
        
        // Thêm tiêu đề
        let titleLabel = UILabel()
        titleLabel.text = "Dynamic Color Demo"
        titleLabel.font = UIFont.boldSystemFont(ofSize: 24)
        titleLabel.textColor = UIColor.label
        titleLabel.textAlignment = .center
        titleLabel.translatesAutoresizingMaskIntoConstraints = false
        
        // Thêm thẻ hiển thị màu
        let cardView = UIView()
        cardView.backgroundColor = UIColor.systemBlue
        cardView.layer.cornerRadius = 12
        cardView.translatesAutoresizingMaskIntoConstraints = false
        
        let cardLabel = UILabel()
        cardLabel.text = "App Build qua GitHub Actions"
        cardLabel.textColor = .white
        cardLabel.font = UIFont.systemFont(ofSize: 16, weight: .medium)
        cardLabel.textAlignment = .center
        cardLabel.translatesAutoresizingMaskIntoConstraints = false
        
        cardView.addSubview(cardLabel)
        view.addSubview(titleLabel)
        view.addSubview(cardView)
        
        // Bố trí giao diện (Auto Layout)
        NSLayoutConstraint.activate([
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 60),
            
            cardView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            cardView.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            cardView.widthAnchor.constraint(equalToConstant: 280),
            cardView.heightAnchor.constraint(equalToConstant: 120),
            
            cardLabel.centerXAnchor.constraint(equalTo: cardView.centerXAnchor),
            cardLabel.centerYAnchor.constraint(equalTo: cardView.centerYAnchor)
        ])
    }
}

// Khởi tạo ứng dụng iOS
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
