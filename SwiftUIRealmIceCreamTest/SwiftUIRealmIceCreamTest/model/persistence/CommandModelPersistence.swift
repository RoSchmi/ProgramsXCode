//
//  HostModelPersistence.swift
//  MQTTAnalyzer
//
//  Created by user on 16.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import Foundation
import RealmSwift

//swiftlint:disable force_try
public class CommandsModelPersistence {
	let model: CommandsModel
	let realm: Realm
	var token: NotificationToken?
	
	init(model: CommandsModel) {
		self.model = model
		self.realm = CommandsModelPersistence.initRelam()
	}
	
	class func initRelam() -> Realm {
        return try! Realm()
	}
	
	func create(_ command: Command) {
		let setting = transform(command)
		
		do {
			try realm.write {
				realm.add(setting)
			}
		}
		catch {
			NSLog("Error creating entry in database: \(error.localizedDescription)")
		}
	}
    
	
	func update(_ command: Command) {
		let settings = realm.objects(CommandSetting.self)
			.filter("id = %@", command.ID)
		
		if let setting = settings.first {
			do {
				try realm.write {
                    setting.title = command.title
                    setting.explanation = command.explanation
                    setting.topic = command.topic
                    setting.message = command.message
                    setting.qos = command.qos
                    setting.dRetain = command.retain
				}
			}
			catch {
				NSLog("Error updating database: \(error.localizedDescription)")
			}
			
		}
	}
	    
	func delete(_ command: Command) {
		let settings = realm.objects(CommandSetting.self)
			.filter("id = %@", command.ID)
		
		if let setting = settings.first {
			do {
				try realm.write {
					setting.isDeleted = true
				}
			}
			catch {
				NSLog("Error deleting entry from database: \(error.localizedDescription)")
			}
		}
	}
	
	func load() {
		CommandSettingExamples.inititalize(realm: realm)
		
		let settings = realm.objects(CommandSetting.self)
		
		token?.invalidate()
		
		token = settings.observe { (_: RealmCollectionChange) in
			self.pushModel(settings: settings)
		}
	}
    
	private func pushModel(settings: Results<CommandSetting>) {
		let commands: [Command] = settings
		.filter { !$0.isDeleted }
            .  map { self.transform($0) }
		
		DispatchQueue.main.async {
            self.model.commands  = commands
		}
	}
    
    func transform(_ command: CommandSetting) -> Command {
        let result = Command(id: command.id)
        result.deleted = command.isDeleted
        result.title = command.title
        result.explanation = command.explanation
        result.topic = command.topic
        //result.messageType = command.messageType
        result.qos = command.qos
        result.retain = command.dRetain
        return result
    }
    	
    func transform(_ command: Command) -> CommandSetting {
        let result = CommandSetting()
        result.isDeleted = command.deleted
        result.id = command.ID
        result.title = command.title
        result.explanation = command.explanation
        result.qos = command.qos
        result.dRetain = command.retain
        return result
    }
}
