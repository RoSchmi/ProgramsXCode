//
//  EditHostFormModalView.swift
//  MQTTAnalyzer
//
//  Created by user on 2020-06-24.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI

// MARK: Edit Host
struct EditHostFormModalView: View {
	let closeHandler: () -> Void
	let root: RootModel
    var hosts: PeopleModel
    
	let original: Person
	
	@State var host: HostFormModel

	var disableSave: Bool {
		return false
	}

	var body: some View {
		NavigationView {
			EditHostFormView(host: $host)
				.font(.caption)
				.navigationBarTitle(Text("Edit server"), displayMode: .inline)
				.navigationBarItems(
					leading: Button(action: cancel) { Text("Cancel") },
					trailing: Button(action: save) { Text("Save") }.disabled(disableSave)
			)
		}.navigationViewStyle(StackNavigationViewStyle())
	}
	
	func save() {
		let updated = copyHost(target: original, source: host)
		if updated == nil {
			return
		}
		
		DispatchQueue.main.async {
			//self.root.persistence.update(updated!)
			self.closeHandler()
		}
	}
	
	func cancel() {
		closeHandler()
	}
}
