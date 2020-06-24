//
//  NewHostFormModalView.swift
//  MQTTAnalyzer
//
//  Created by user on 2019-11-22.
//  Copyright © 2010 RoSchmi. All rights reserved.
//

import SwiftUI
//import swift_petitparser

// MARK: Create Host
struct NewHostFormModalView: View {
	let closeHandler: () -> Void
	let root: RootModel
	var hosts: PeopleModel
	
	@State var host: HostFormModel
	
	var disableSave: Bool {
        return	false
	}
	
	var body: some View {
        
        VStack {
            //Text("hello from NewHostFormModalView")
            NavigationView {
                EditHostFormView(host: $host)
                    .font(.caption)
                    .navigationBarTitle(Text("New Person"), displayMode: .inline)
                    .navigationBarItems(
                        leading: Button(action: cancel) {
                            Text("Cancel")
                            
                        }.buttonStyle(ActionStyleT50()),
                        
                        trailing: Button(action: save) {
                            Text("Save")
                        }.buttonStyle(ActionStyleL50()).disabled(disableSave)
                        
                )
            }.navigationViewStyle(StackNavigationViewStyle())        }
	}
	
	func save() {
		let newHost = copyHost(target: Person(id: NSUUID().uuidString, firstName: "", lastName: "", jobTitle: ""), source: host)
		if newHost == nil {
			return
		}
		
		DispatchQueue.main.async {
            self.hosts.people.append(newHost!)
			//self.root.persistence.create(newHost!)
			
			self.closeHandler()
		}
	}
    
	func cancel() {
		closeHandler()
	}
}
