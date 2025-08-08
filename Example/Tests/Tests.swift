import UIKit
import XCTest
import SwiftQRScanner   

class MockQRScannerDelegate: QRScannerCodeDelegate {
    var scannedCode: String?

    func qrScanner(_ controller: UIViewController, didScanResult result: String) {
        scannedCode = result
    }

    func qrScannerDidFail(_ controller: UIViewController, error: String) {}
    func qrScannerDidCancel(_ controller: UIViewController) {}
}

class QRScannerTests: XCTestCase {
    func testMockQRScan() {
        let delegate = MockQRScannerDelegate()
        let controller = QRScannerController()
        controller.delegate = delegate

        // Simulate a scan result (normally this would come from the camera)
        delegate.qrScanner(controller, didScanResult: "https://example.com")

        XCTAssertEqual(delegate.scannedCode, "https://example.com")
    }
}
