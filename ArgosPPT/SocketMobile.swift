//
//  SocketMobile.swift
//  ArgosPPT
//
//  Created by Mo Abdo on 12/14/23.
//

import Foundation
import SwiftUI
import CaptureSDK


class CaptureHelperManager: ObservableObject {
    static let shared = CaptureHelperManager()
    
    @Published var captureHelper: CaptureHelper
    let cartManager: CartManager
        let cardManager: CardManager
    
    private init() {
        self.captureHelper = CaptureHelper.sharedInstance
        self.cartManager = CartManager()  // Replace with your actual initialization
        self.cardManager = CardManager()
        setupCapture()
    }
    
    private func setupCapture() {
        let appInfo = SKTAppInfo()
        appInfo.developerID = "840a8fc8-c1f3-ec11-bb3d-000d3a357897"
        appInfo.appID = "ios:com.argos.ArgosPPT"
        appInfo.appKey = "MC4CFQDQxk0+oAdSB51x0LYptzb0Bw5JZwIVAMZDqRQhUGVIMjFqH8/Uu36vZAYK"
        
        captureHelper.dispatchQueue = DispatchQueue.main
        captureHelper.pushDelegate(DevicePresenceDelegate())
        captureHelper.pushDelegate(DeviceDecodedDataDelegate(cartManager: cartManager, cardManager: cardManager))
        captureHelper.openWithAppInfo(appInfo) { result in
            if result == SKTResult.E_NOERROR {
                // Handle success
            } else {
                // Handle error
            }
        }
    }
    
    private class DevicePresenceDelegate: CaptureHelperDevicePresenceDelegate {
        func didNotifyArrivalForDevice(_ device: CaptureHelperDevice, withResult result: SKTResult) {
            print("Device arrived")
        }
        
        func didNotifyRemovalForDevice(_ device: CaptureHelperDevice, withResult result: SKTResult) {
            print("Device removed")
        }
    }
    
    private class DeviceDecodedDataDelegate: CaptureHelperDeviceDecodedDataDelegate {
        let cartManager: CartManager
           let cardManager: CardManager

           init(cartManager: CartManager, cardManager: CardManager) {
               self.cartManager = cartManager
               self.cardManager = cardManager
           }

        
        func didReceiveDecodedData(_ decodedData: SKTCaptureDecodedData?, fromDevice device: CaptureHelperDevice, withResult result: SKTResult) {
            if let data = decodedData?.stringFromDecodedData() {
                print("Decoded data: \(data)")
                sendPushNotification(barcodeData: data, cartManager: cartManager, cardManager: cardManager)
            }
        }
        
        func sendPushNotification(barcodeData: String, cartManager: CartManager, cardManager: CardManager) {
            // Send push notification using Firebase Cloud Messaging
            // Construct your notification payload
            let payload: [String: Any] = [
                "to": "c4uWZtF_K0I-gOmlJWJ5Qq:APA91bFG-HZc9SKvchSVhtZ424Fc_hjQLcHTGiE75gORYUqxpSFtRgWBfWhaMhomV9O4w3HFMukkZEGcA3cVBTMhjIHQH-CYhS5DdrPqdDvmoZXcBKibNnjn_udFuVsl4nDRGGT-BqJs",
                "notification": [
                    "title": "Target",
                    "body": "This an ArgosPPT Request, please finish processing your transaction"
                ],
                "data": [
                           "urlScheme": "myapp",
                           "urlHost": "cart"
                       ]
            ]
            
            // Convert payload to JSON
            let jsonData = try? JSONSerialization.data(withJSONObject: payload)
            
            // Construct the request
            let url = URL(string: "https://fcm.googleapis.com/fcm/send")!
            var request = URLRequest(url: url)
            request.httpMethod = "POST"
            request.setValue("application/json", forHTTPHeaderField: "Content-Type")
            request.setValue("key=AAAA5hSPSOM:APA91bFx3mI7jmY4av8tVAuAqh5CniqLUedRiH71cJpHLyT8kbeFPEOKzp69zWJyhddjgSoXErAHrv0DJiwtoSzLjvC-gHyUotDx4EDJjdn43PR5xUueJ_sX9eB_Op9SukgChQoxXPG6", forHTTPHeaderField: "Authorization")
            request.httpBody = jsonData
            
            // Send the request
            let task = URLSession.shared.dataTask(with: request) { data, response, error in
                if let error = error {
                    print("Error sending push notification: \(error.localizedDescription)")
                } else if let data = data {
                    let responseString = String(data: data, encoding: .utf8)
                    print("Push notification sent successfully. Response: \(responseString ?? "")")
                }
                // Navigate to CartView after sending push notification on the main thread
                        DispatchQueue.main.async {
                            NavigationManager.shared.navigateToCartView(cartManager: cartManager, cardManager: cardManager)
                        }
            }
            task.resume()
        }
    }
}
