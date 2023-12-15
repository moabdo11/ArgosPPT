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
            }
        }
    }
}
