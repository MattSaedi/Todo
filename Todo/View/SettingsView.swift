//
//  SettingsView.swift
//  Todo
//
//  Created by MahDi SaeDi on 5/8/21.
//

import SwiftUI

struct SettingsView: View {
    //MARK: - PROPERTIES
    @Environment(\.presentationMode) var presentationMode
    //MARK: - BODY
    var body: some View {
        NavigationView{
            VStack(alignment: .center, spacing: 0){
                //MARK: - FORM
                Form{
                    //MARK: - SECTION 3
                    Section(header:Text("Follow us on social media")){
                        FormRowLinkView(icon: "globe", color: .pink, text: "Website", link: "https://mattt.ir")
                        FormRowLinkView(icon: "link", color: .blue, text: "Twitter", link: "https://twitter.com/mattsaedi")
                    }//:SECTION 3
                    .padding(.vertical,3)
                    //MARK: - SECTION 4
                    Section(header:Text("About the Application")){
                        FormRowStaticView(icon: "gear", firstText: "Application", secendText: "Todo")
                        FormRowStaticView(icon: "checkmark.seal", firstText: "Compatibility", secendText: "iPhone, iPad")
                        FormRowStaticView(icon: "keyboard", firstText: "Developer", secendText: "Matt Saedi")
                        FormRowStaticView(icon: "paintbrush", firstText: "Developer", secendText: "Robert Petras")
                        FormRowStaticView(icon: "flag", firstText: "Version", secendText: "1.0.0")
                    }//:SECTION 4
                    .padding(.vertical,3)
                    
                }//:FORM
                .listStyle(GroupedListStyle())
                .environment(\.horizontalSizeClass, .regular)
                //MARK: - FOOTER
                Text("Copyright © All rights reserved\nBetter Apps ♡ Less Coode")
                    .multilineTextAlignment(.center)
                    .font(.footnote)
                    .padding(.top,6)
                    .padding(.bottom,8)
                    .foregroundColor(.secondary)
            }//:VSTACK
            .navigationBarItems(trailing:
                                    Button(action: {
                                        self.presentationMode.wrappedValue.dismiss()
                                    }, label: {
                                        Image(systemName: "xmark")
                                    })
            )
            .navigationBarTitle("Settings", displayMode: .inline)
            .background(Color("ColorBackground").edgesIgnoringSafeArea(.all))
        }//:NAVIGATION
    }
}
//MARK: - PREVIEW
struct SettingsView_Previews: PreviewProvider {
    static var previews: some View {
        SettingsView()
    }
}
