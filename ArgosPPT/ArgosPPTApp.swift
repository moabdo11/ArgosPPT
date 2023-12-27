//
//  ArgosPPTApp.swift
//  ArgosPPT
//
//  Created by Mo Abdo on 12/8/23.
//

import SwiftUI
import UserNotifications
import FirebaseCore
import FirebaseMessaging

class MyAppDelegate: NSObject, UIApplicationDelegate, ObservableObject {
    
    var app: ArgosPPTApp?
    
    func application(_ application: UIApplication,
                     didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]? = nil) -> Bool {
        
        application.registerForRemoteNotifications()
        
        FirebaseApp.configure()
        
        Messaging.messaging().delegate = self
        
        UNUserNotificationCenter.current().delegate = self
        
        return true
    }
}

extension MyAppDelegate: UNUserNotificationCenterDelegate {
    func userNotificationCenter(_ center: UNUserNotificationCenter, didReceive response: UNNotificationResponse) async {
//        if let deepLink = response.notification.request.content.userInfo["link"] as? String {
//            print("got the value")
//        }
    }
}

extension MyAppDelegate: MessagingDelegate {
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        Messaging.messaging().apnsToken = deviceToken
    }
    
    func messaging(_ messaging: Messaging, 
                   didReceiveRegistrationToken fcmToken: String?) {
        #if DEBUG
        print("FCM Token: \(fcmToken)")
        #endif
    }
}

@main
struct ArgosPPTApp: App {
    
    @State var currentTab: Tab = .Home
    
    @UIApplicationDelegateAdaptor private var appDelegate: MyAppDelegate
    var body: some Scene {
        WindowGroup {
            ContentView()
        }
    }
}
