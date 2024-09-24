//
//  DecideNow_App.swift
//  DecideNow!
//
//  Created by 李洪锐 on 2024/9/12.
//

import SwiftUI

@main
struct DecideNow_App: App {
    @State private var options : [Option]
    init() {
        if let data = UserDefaults.standard.data(forKey: "options"),
           let decodedOptions = try? JSONDecoder().decode([Option].self, from: data) {
            options = decodedOptions
        } else {
            print("Error loading saved options")
            options = Option.sampleOptions
        }
    }
    var body: some Scene {
        WindowGroup {
            NavigationView{
                ContentView(inputOptions: $options)
            }.padding(.top)
        }
    }
}
