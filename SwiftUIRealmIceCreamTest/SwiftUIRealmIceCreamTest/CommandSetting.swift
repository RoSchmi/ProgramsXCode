//
//  CommandSetting.swift
//  SwiftUIRealmIceCreamTest
//
//  Created by user on 17.06.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//


import Foundation

import RealmSwift
import IceCream
import CloudKit



class CommandSetting: Object {
    @objc dynamic var id = NSUUID().uuidString
    @objc dynamic var title = ""
    @objc dynamic var explanation = ""
    @objc dynamic var topic = ""
    @objc dynamic var message = ""
    @objc dynamic var qos: Int = 0
    @objc dynamic var dRetain: Bool = false

    @objc dynamic var isDeleted = false
    
    override class func primaryKey() -> String? {
        return "id"
    }
}

extension CommandSetting: CKRecordConvertible {
}

extension CommandSetting: CKRecordRecoverable {
}
