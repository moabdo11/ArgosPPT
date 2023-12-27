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
    
    private init() {
        self.captureHelper = CaptureHelper.sharedInstance
        setupCapture()
    }
    
    private func setupCapture() {
        let appInfo = SKTAppInfo()
        appInfo.developerID = "840a8fc8-c1f3-ec11-bb3d-000d3a357897"
        appInfo.appID = "ios:com.argos.ArgosPPT"
        appInfo.appKey = "MC4CFQDQxk0+oAdSB51x0LYptzb0Bw5JZwIVAMZDqRQhUGVIMjFqH8/Uu36vZAYK"
        
        captureHelper.dispatchQueue = DispatchQueue.main
        captureHelper.pushDelegate(DevicePresenceDelegate())
        captureHelper.pushDelegate(DeviceDecodedDataDelegate())
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
        func didReceiveDecodedData(_ decodedData: SKTCaptureDecodedData?, fromDevice device: CaptureHelperDevice, withResult result: SKTResult) {
            if let data = decodedData?.stringFromDecodedData() {
                print("Decoded data: \(data)")
                sendPushNotification(barcodeData: data)
            }
        }
        
        func sendPushNotification(barcodeData: String) {
            // Send push notification using Firebase Cloud Messaging
            // Construct your notification payload
            let payload: [String: Any] = [
                "to": "c4uWZtF_K0I-gOmlJWJ5Qq:APA91bFG-HZc9SKvchSVhtZ424Fc_hjQLcHTGiE75gORYUqxpSFtRgWBfWhaMhomV9O4w3HFMukkZEGcA3cVBTMhjIHQH-CYhS5DdrPqdDvmoZXcBKibNnjn_udFuVsl4nDRGGT-BqJs",
                "notification": [
                    "title": "Barcode Scanned",
                    "body": "Barcode: \(barcodeData)"
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
            }
            
            task.resume()
        }
    }
}
