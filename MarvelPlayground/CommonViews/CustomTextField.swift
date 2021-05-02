//
//  CustomTextField.swift
//  MarvelPlayground
//
//  Created by Cody Miller on 5/2/21.
//

import SwiftUI

struct CustomTextField: View {
    var placeholder: Text
    
    @Binding var text: String
    
    var textChanged: (Bool) -> Void = {_ in}
    var commit: () -> Void = {}
    
    var body: some View {
        ZStack(alignment: .leading, content: {
            if text.isEmpty { placeholder }
            TextField("", text: $text, onEditingChanged: textChanged, onCommit: commit)
        })
    }
}
