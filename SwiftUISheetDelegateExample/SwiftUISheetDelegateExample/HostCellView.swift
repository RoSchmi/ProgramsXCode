//
//  HostCellView.swift
//  MQTTAnalyzer
//
//  Created by user on 2019-11-17.
//  Copyright © 2019 RoSchmi. All rights reserved.
//

import SwiftUI

enum HostCellViewSheetType {
	case edit
	case login
}

struct HostCellView: View {
	@EnvironmentObject var model: RootModel
	@ObservedObject var person: Person
		
	@State var sheetPresented = false
	@State var sheetType = HostCellViewSheetType.edit
	
    // sends back the selected person
	var clonePersonHandler: (Person) -> Void
	
    var connectionColor: Color { .green
		
	}
	
	var body: some View {
        		
        NavigationLink(destination: DetailsView(person: person)) {			HStack {
				VStack(alignment: .leading) {
					HStack {
                           Text("\(person.firstName) \(person.lastName)")
                            .fontWeight(.bold)
					}
					Spacer()
					Group {
						Text(person.jobTitle)
                        .fontWeight(.light)					}
					.font(.footnote)
					.foregroundColor(.secondary)
				}
				Spacer()
				
				if true {
                    Text("\(person.firstName)")
						.font(.system(size: 14, design: .monospaced))
						.foregroundColor(.secondary)
					
					Image(systemName: "circle.fill")
						.font(.subheadline)
						.foregroundColor(connectionColor)
				}
                
			}
			.contextMenu {
				MenuButton(title: "Edit", systemImage: "pencil.circle", action: editHost)
				MenuButton(title: "Do nothing", systemImage: "pencil.circle", action: cloneHost)
                if person.firstName == "Hans" {
					MenuButton(title: "Do another nothing", systemImage: "stop.circle", action: disconnect)
				}
				else {
					MenuButton(title: "Connect", systemImage: "play.circle", action: connect)
				}
			}
		}.sheet(isPresented: $sheetPresented, onDismiss: cancelEditCreation, content: {
			if self.sheetType == .login {
			//	LoginDialogView(loginCallback: self.login, host: self.host, data: self.createLoginDataModel())
			}
			else {
                
				EditHostFormModalView(closeHandler: self.cancelEditCreation,
					root: self.model,
					hosts: self.model.hostsModel,
					original: self.person,
					host: transformHost(source: self.person))
            
			}
		})
	}
	
	func cloneHost() {
		clonePersonHandler(person)
	}
	
	func editHost() {
		sheetType = .edit
		sheetPresented = true
	}
	
    func disconnect() {}
    
    func connect() {}
    
	func cancelEditCreation() {
		sheetPresented = false
	}
}
