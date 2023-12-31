//
//  NotificationsManager.swift
//  ArgosPPT
//
//  Created by Mo Abdo on 12/22/23.
//

import Foundation
import UserNotifications

@MainActor 
class NotificationsManager: ObservableObject {
    
    @Published private(set) var hasPermission = false
    
    init () {
        Task {
            await getAuthStatus()
        }
    }
    
    func request() async {
        do{
            try await UNUserNotificationCenter.current().requestAuthorization(options: [.alert, .badge, .sound])
        } catch {
            print(error)
        }
    }
    
    func getAuthStatus() async {
        let status = await UNUserNotificationCenter.current().notificationSettings()
        switch status.authorizationStatus {
        case .authorized,
                .provisional,
                .ephemeral:
            hasPermission = true
        default:
            hasPermission = false
        }
    }
}
