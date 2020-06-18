//
//  AppDelegate.swift
//  SwiftRealmTest
//
//  Created by user on 15.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import UIKit
//RoSchmi
//import CoreData
//RoSchmi
import IceCream
import CloudKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {

    // RoSchmi
    var syncEngine: SyncEngine?

    
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?)-> Bool {
        // RoSchmi changed
        //DataMigration.initMigration(afterMigration:
        //self.afterMigration)
        
        syncEngine = SyncEngine(objects: [SyncObject<CommandTemplate>()], databaseScope: .private)
        
        syncEngine?.pull()
        
        application.registerForRemoteNotifications()
        // RoSchmi Removed
        //CloudDataManager.instance.initDocumentsDirectory()
        
        // Override point for customization after application launch.
        return true
    }

    
    
    // RoSchmi added
    func afterMigration() {
        syncEngine?.pushAll()
    }

    

    func application(_ application: UIApplication, didReceiveRemoteNotification userInfo: [AnyHashable: Any], fetchCompletionHandler completionHandler: @escaping (UIBackgroundFetchResult) -> Void) {
        
        // swiftlint:disable line_length
        if let dict = userInfo as? [String: NSObject], let notification = CKNotification(fromRemoteNotificationDictionary: dict), let subscriptionID = notification.subscriptionID, IceCreamSubscription.allIDs.contains(subscriptionID) {
            NotificationCenter.default.post(name: Notifications.cloudKitDataDidChangeRemotely.name, object: nil, userInfo: userInfo)
            completionHandler(.newData)
        }
        
    }
    
    
    
    func applicationWillTerminate(_ application: UIApplication) {
            // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
            // Saves changes in the application's managed object context before the application terminates.
    //        self.saveContext()
        }
    
    
    // MARK: UISceneSession Lifecycle
    
    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }
    
    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }

    // MARK: - Core Data stack
    
    // RoSchmi Removed
    //lazy var persistentContainer: NSPersistentContainer = {
    

    // MARK: - Core Data Saving support

    // RoSchmi Removed
    /*
    func saveContext () {
        let context = persistentContainer.viewContext
        if context.hasChanges {
            do {
                try context.save()
            } catch {
                // Replace this implementation with code to handle the error appropriately.
                // fatalError() causes the application to generate a crash log and terminate. You should not use this function in a shipping application, although it may be useful during development.
                let nserror = error as NSError
                fatalError("Unresolved error \(nserror), \(nserror.userInfo)")
            }
        }
    }
    */

}

