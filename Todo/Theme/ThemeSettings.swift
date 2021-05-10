//
//  ThemeSettings.swift
//  Todo
//
//  Created by MahDi SaeDi on 5/9/21.
//

import SwiftUI

// MARK: - THEME CLASS

class ThemeSettings: ObservableObject{
    @Published var themeSettings: Int = UserDefaults.standard.integer(forKey: "Theme"){
        didSet{
            UserDefaults.standard.set(self.themeSettings,forKey: "Theme")
        }
    }
}
