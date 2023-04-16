//
//  FabView.swift
//  MoveoTasks
//
//  Created by Paul Maltsev on 14/04/2023.
//

import SwiftUI

struct FabView: View {
    
    private let completion: () -> Void
    
    init(completion: @escaping () -> Void) {
        self.completion = completion
    }
    
    var body: some View {
        VStack {
            Spacer()
            
            HStack {
                Spacer()
                
                Button(action: completion) {
                    Image(systemName: "plus")
                        .font(.system(size: 24))
                        .foregroundColor(.white)
                        .padding()
                        .background(.blue)
                        .clipShape(Circle())
                        .padding(.trailing, 20)
                        .padding(.bottom, 20)
                }
            }
        }
    }
}

struct FabView_Previews: PreviewProvider {
    static var previews: some View {
        FabView{}
    }
}
