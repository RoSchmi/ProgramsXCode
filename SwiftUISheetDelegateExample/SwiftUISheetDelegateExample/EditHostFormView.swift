//
//  NewHostFormView.swift
//  SwiftUITest
//
//  Created by user on 2020-06-24.
//  Copyright © 2019 RoSchmi. All rights reserved.
//

import SwiftUI

struct EditHostFormView: View {
	@Binding var host: HostFormModel
	@State var advanced = false
    
	var body: some View {
              
        Form {
            Text("Hello from EditHostFormView")
            Text("Edit Person Properties")
            HStack {
            Text("FirstName: ")
            TextField("", text: $host.firstName)
            }
            HStack {
            Text("LastName: ")
            TextField("", text: $host.lastName)
            }
            HStack {
            Text("JobTitle: ")
            TextField("", text: $host.jobTitle)
            }
        }
	}
}

struct FormFieldInvalidMark: View {
	var invalid: Bool
	
	var body: some View {
		Group {
			if invalid {
				Image(systemName: "xmark.octagon.fill")
				.font(.headline)
					.foregroundColor(.red)
			}
		}
	}
}

#if DEBUG
//struct NewHostFormView_Previews : PreviewProvider {
//	static var previews: some View {
//		NavigationView {
//			NewHostFormView(host: Host())
//		}
//	}
//}
#endif
