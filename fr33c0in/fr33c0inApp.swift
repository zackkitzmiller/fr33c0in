//
//  fr33c0inApp.swift
//  fr33c0in
//
//  Created by Zack Kitzmiller on 11/14/20.
//

import SwiftUI

@main
struct fr33c0inApp: App {
    var order = Order()
    
    var body: some Scene {
        WindowGroup {
            AppView().environmentObject(order)
        }
    }
}
