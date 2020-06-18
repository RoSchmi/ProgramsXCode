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
		let example1 = CommandTemplate()
        example1.dTitle = "Turn Light on"
        example1.dExplanation = "Turns the Light on"
        example1.dQos = 0
        example1.dRetain = false
		
		let example2 = CommandTemplate()
		example1.dTitle = "Turn Light off"
        example1.dExplanation = "Turns the Light off"
        example1.dQos = 0
        example1.dRetain = false
        
		createIfNotPresent(setting: example1, realm: realm)
		createIfNotPresent(setting: example2, realm: realm)
	}
	
	private class func createIfNotPresent(setting: CommandTemplate, realm: Realm) {
		let settings = realm.objects(CommandTemplate.self)
            .filter("dId = %@", setting.dId)
		
		if settings.isEmpty {
			// swiftlint:disable force_try
			try! realm.write {
				realm.add(setting)
			}
		}
	}
}
