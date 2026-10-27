import SwiftUI
import WebKit

// Die Web-App aus dem Ordner "web" läuft unverändert in einer WebView.
@main
struct TagesroutineApp: App {
    var body: some Scene {
        WindowGroup {
            RoutineWebView()
                .ignoresSafeArea()
                .background(Color(red: 0.945, green: 0.965, blue: 0.961))
        }
    }
}

struct RoutineWebView: UIViewRepresentable {
    func makeCoordinator() -> Coordinator { Coordinator() }

    func makeUIView(context: Context) -> WKWebView {
        let config = WKWebViewConfiguration()
        config.websiteDataStore = .default() // speichert Routinen und Häkchen dauerhaft
        let web = WKWebView(frame: .zero, configuration: config)
        web.navigationDelegate = context.coordinator
        web.scrollView.contentInsetAdjustmentBehavior = .never
        web.isOpaque = false
        web.backgroundColor = .clear
        if let dir = Bundle.main.url(forResource: "web", withExtension: nil) {
            web.loadFileURL(dir.appendingPathComponent("index.html"), allowingReadAccessTo: dir)
        }
        return web
    }

    func updateUIView(_ uiView: WKWebView, context: Context) {}

    final class Coordinator: NSObject, WKNavigationDelegate {
        // Externe Links in Safari öffnen statt in der App
        func webView(_ webView: WKWebView,
                     decidePolicyFor action: WKNavigationAction,
                     decisionHandler: @escaping (WKNavigationActionPolicy) -> Void) {
            if let url = action.request.url, url.scheme != "file", action.navigationType == .linkActivated {
                UIApplication.shared.open(url)
                decisionHandler(.cancel)
                return
            }
            decisionHandler(.allow)
        }
    }
}
