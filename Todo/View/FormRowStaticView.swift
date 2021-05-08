//
//  FormRowStaticView.swift
//  Todo
//
//  Created by MahDi SaeDi on 5/8/21.
//

import SwiftUI

struct FormRowStaticView: View {
    //MARK: - PROPERTIES
    var icon:String
    var firstText: String
    var secendText:String
    //MARK: - BODY
    var body: some View {
        HStack {
            ZStack{
                RoundedRectangle(cornerRadius: 8,style: .continuous)
                    .fill(Color.gray)
                Image(systemName: icon)
                    .foregroundColor(.white)
            }
            .frame(width: 36, height: 36, alignment: .center)
            Text(firstText).foregroundColor(.gray)
            Spacer()
            Text(secendText)
        }
    }
}
//MARK: - PREVIEW
struct FormRowStaticView_Previews: PreviewProvider {
    static var previews: some View {
        FormRowStaticView(icon: "gear", firstText: "Application", secendText: "Todo")
            .previewLayout(.fixed(width: 375, height: 60))
            .padding()
    }
}
