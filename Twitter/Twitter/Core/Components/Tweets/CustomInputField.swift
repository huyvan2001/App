//
//  CustomInputField.swift
//  Twitter
//
//  Created by Lê Văn Huy on 22/08/2022.
//

import SwiftUI

struct CustomInputField: View {
    let image: String
    let placeholderText: String
    var isSecuredField : Bool? = false
    @Binding var text: String
    
    var body: some View {
        VStack{
            HStack{
                Image(systemName: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 20, height: 20)
                    .foregroundColor(Color(.darkGray))
                if isSecuredField ?? false{
                    SecureField(placeholderText,text:$text)
                }
                else {
                    TextField(placeholderText,text:$text)
                }
            }
            Divider()
                .background(Color(.darkGray))
            
            
        }
    }
}

struct CustomInputField_Previews: PreviewProvider {
    static var previews: some View {
        CustomInputField(image: "envelope", placeholderText: "Email", isSecuredField: false, text: .constant(""))
    }
}
