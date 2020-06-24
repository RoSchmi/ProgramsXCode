//
//  HostFormModel.swift
//  MQTTAnalyzer
//
//  Created by user on 2020-04-14.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import Foundation

class TopicSubscriptionFormModel: Identifiable, ObservableObject {
	var id = NSUUID().uuidString
	
	@Published var topic: String
	@Published var qos: Int
	
	init(topic: String, qos: Int) {
		self.topic = topic
		self.qos = qos
	}
}

struct HostFormModel {
	var firstName = ""
	var lastName = ""
	var jobTitle = ""
}

func copyHost(target: Person, source host: HostFormModel) -> Person? {
	
	target.firstName = host.firstName
    target.lastName = host.lastName
    target.jobTitle = host.jobTitle
	return target
}

func transformHost(source host: Person) -> HostFormModel {
	return HostFormModel(firstName: host.firstName,
						 lastName: host.lastName,
                         jobTitle: host.jobTitle)
						 						
}
