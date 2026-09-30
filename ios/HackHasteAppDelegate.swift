// HackHaste keyboard layout. Dr. Marcus Roe, https://drm.cc/ . MIT License.
import UIKit

@main
final class HackHasteHostAppDelegate: UIResponder, UIApplicationDelegate {
    var window: UIWindow?
    func application(
        _ application: UIApplication,
        didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil
    ) -> Bool {
        let w = UIWindow(frame: UIScreen.main.bounds)
        let vc = UIViewController()
        vc.view.backgroundColor = UIColor(white: 0.1, alpha: 1)
        let tv = UITextView(frame: vc.view.bounds)
        tv.autoresizingMask = [.flexibleWidth, .flexibleHeight]
        tv.backgroundColor = .clear
        tv.textColor = .white
        tv.font = .systemFont(ofSize: 18)
        tv.text = """Enable HackHaste:
Settings, General, Keyboard, Keyboards, Add New Keyboard, HackHaste.
Full Access stays off.

Hardware letters on a Magic Keyboard stay the iOS hardware layout.
Caps to Command: Settings, General, Keyboard, Hardware Keyboard, Modifier Keys
(iPadOS 13.4+): Caps Lock = Command, Command = Caps Lock. Control stays Control.
QMK already speaks HackHaste to every OS, including iPad.
"""
        vc.view.addSubview(tv)
        w.rootViewController = vc
        w.makeKeyAndVisible()
        window = w
        return true
    }
}
