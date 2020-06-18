//
//  HostSetting.swift
//  MQTTAnalyzer
//
//  Created by Philipp Arndt on 2020-06-15.
//  Copyright © 2019 RoSchmi. All rights reserved.
//

import Foundation

import RealmSwift
import IceCream
import CloudKit



class CommandTemplate: Object {
	@objc dynamic var dId = NSUUID().uuidString
	@objc dynamic var dTitle = ""
	@objc dynamic var dExplanation = ""
    @objc dynamic var dQos: Int = 0
    @objc dynamic var dRetain: Bool = false

	@objc dynamic var isDeleted = false
	
	override class func primaryKey() -> String? {
		return "dId"
	}
}


	


extension CommandTemplate: CKRecordConvertible {
}


extension CommandTemplate: CKRecordRecoverable {
}
