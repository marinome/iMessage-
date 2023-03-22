//
//  ContentView.swift
//  iMessage
//
//  Created by MM & DS
//

import SwiftUI

struct ContentView: View {
    
    
    
    
    @State private var code: String = ""
    @State private var language: String = ""
    
    var body: some View {
        //WelcomeScreenView()
        Text("test")//test
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

struct PrimaryButton: View {
    var title: String
    var body: some View {
        Text(title)
            .font(.title3)
            .fontWeight(.bold)
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color("PrimaryColor"))
            .cornerRadius(50)
    }
}

extension ContentView {
    //Generates a theme with the given name
    //Parameter name: The name of the theme you want to generate
    //Returns: The generated theme
    static public func getTheme(name: String) -> Theme? {
        if let theme = themes[name] {
            let defaultColor = ThemeColor(hex: (theme["default"] as? String) ?? "#000000")
            let backgroundColor = ThemeColor(hex: (theme["background"] as? String) ?? "#000000")
            
            let currentLineColor = ThemeColor(hex: (theme["currentLine"] as? String) ?? "#000000")
            let selectionColor = ThemeColor(hex: (theme["selection"] as? String) ?? "#000000")
            let cursorColor = ThemeColor(hex: (theme["cursor"] as? String) ?? "#000000")
            
            let styleRaw = theme["style"] as? String
            let style: Theme.UIStyle = styleRaw == "light" ? .light : .dark
            
            let lineNumber = ThemeColor(hex: (theme["lineNumber"] as? String) ?? "#000000")
            let lineNumber_Active = ThemeColor(hex: (theme["lineNumber-Active"] as? String) ?? "#000000")
            
            var colors: [String: ThemeColor] = [:]
            
            if let cDefs = theme["definitions"] as? [String: String] {
                for item in cDefs {
                    colors.merge([item.key: ThemeColor(hex: (item.value))]) { (first, _) -> ThemeColor in return first }
                }
            }
            
            return Theme(defaultFontColor: defaultColor, backgroundColor: backgroundColor, currentLine: currentLineColor, selection: selectionColor, cursor: cursorColor, colors: colors, font: ThemeFont.systemFont(ofSize: ThemeFont.systemFontSize), style: style, lineNumber: lineNumber, lineNumber_Active: lineNumber_Active)
        }
        return nil
    }
}
