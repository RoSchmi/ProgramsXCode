//
//  HostCellView.swift
//  SwiftUICommandsTest
//
//  Created by user on 13.05.20.
//  Copyright © 2020 RoSchmi. All rights reserved.
//

import SwiftUI


enum HostCellViewSheetType {
    case edit
    case login
}
/*
struct HostCellView: View {
   // @EnvironmentObject var model: RootModel
   // @ObservedObject var host: Host
    //@ObservedObject var messageModel: MessageModel
    
    @State var sheetPresented = false
    @State var sheetType = HostCellViewSheetType.edit
    */
    
    /*
    var connectionColor: Color {
        host.state == .connected ? .green : .gray
    }
    */
    /*
    var body: some View {
        NavigationLink(destination: TopicsView(model: messageModel, host: host, dialogPresented: host.needsAuth)) {
            HStack {
                VStack(alignment: .leading) {
                    Text(host.aliasOrHost)
                    Spacer()
                    Group {
                        Text(host.hostname)
                        Text(host.subscriptionsReadable)
                    }
                    .font(.footnote)
                    .foregroundColor(.secondary)
                    
//                    if host.clientImpl == .moscapsule {
//                        DeprecationBox()
//                    }
                }
                
                Spacer()
                
                if host.state != .disconnected {
                    Text("\(messageModel.messageCount)")
                        .font(.system(size: 14, design: .monospaced))
                        .foregroundColor(.secondary)
                    
                    Image(systemName: "circle.fill")
                        .font(.subheadline)
                        .foregroundColor(connectionColor)
                }
            }
            .contextMenu {
                MenuButton(title: "Edit", systemImage: "pencil.circle", action: editHost)
                if host.state != .disconnected {
                    MenuButton(title: "Disconnect", systemImage: "stop.circle", action: disconnect)
                }
                else {
                    MenuButton(title: "Connect", systemImage: "play.circle", action: connect)
                }
            }
        }.sheet(isPresented: $sheetPresented, onDismiss: cancelEditCreation, content: {
            if self.sheetType == .login {
                LoginDialogView(loginCallback: self.login, host: self.host, data: self.createLoginDataModel())
            }
            else {
                EditHostFormModalView(closeHandler: self.cancelEditCreation,
                    root: self.model,
                    hosts: self.model.hostsModel,
                    original: self.host,
                    host: transformHost(source: self.host))
            }
        })
    }
    
    func editHost() {
        sheetType = .edit
        sheetPresented = true
    }
    
    func disconnect() {
        host.disconnect()
    }
    
    func connect() {
        if self.host.needsAuth {
            sheetType = .login
            sheetPresented = true
        }
        else {
            model.connect(to: host)
        }
    }
    
    func login() {
        sheetType = .login
        sheetPresented = false
        model.connect(to: self.host)
    }
    */
    /*
    func createLoginDataModel() -> LoginData {
        return LoginData(username: host.username, password: host.password)
    }
    */
   
/*
    func cancelEditCreation() {
        sheetPresented = false
    }
}
 */




/*
struct HostCleeView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HostCleeView_Previews: PreviewProvider {
    static var previews: some View {
        HostCleeView()
    }
}
 */





struct HostCellView: View {
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

struct HostCellView_Previews: PreviewProvider {
    static var previews: some View {
        HostCellView()
    }
}
