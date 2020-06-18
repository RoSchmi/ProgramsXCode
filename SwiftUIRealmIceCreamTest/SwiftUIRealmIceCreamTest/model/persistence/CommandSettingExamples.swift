//
//  HostSettingExamples.swift
//  MQTTAnalyzer
//
//  Created by Philipp Arndt on 2019-11-23.
//  Copyright © 2019 Philipp Arndt. All rights reserved.
//

import Foundation
import RealmSwift

class CommandSettingExamples {
	class func inititalize(realm: Realm) {
		let example1 = CommandSetting()
        example1.id = "1"
		example1.title = "Switch the Light on"
		example1.explanation = "Switches Light on"
        example1.topic = "theTopic"
        example1.message = "theMessage"
        example1.qos = 0
        example1.dRetain = false
				
		let example2 = CommandSetting()
        example2.id = "2"
        example2.title = "Switch the Light off"
        example2.explanation = "Switches Light on"
        example2.topic = "theTopic"
        example2.message = "theMessage"
        example2.qos = 0
        example2.dRetain = false
        
		createIfNotPresent(setting: example1, realm: realm)
		createIfNotPresent(setting: example2, realm: realm)
	}
	
	private class func createIfNotPresent(setting: CommandSetting, realm: Realm) {
		let settings = realm.objects(CommandSetting.self)
			 .filter("id = %@", setting.id)
		
		if settings.isEmpty {
			// swiftlint:disable force_try
			try! realm.write {
				realm.add(setting)
			}
		}
	}
}
