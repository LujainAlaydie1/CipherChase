//
//  test.swift
//  Cipher Chase
//
//  Created by AMIRA on 20/05/1445 AH.
//

import SwiftUI

struct test: View {
    @State var box : String = ""
    @State var someText: String = ""

    var body: some View {
        VStack{
            HStack{
                TextField("",text: $box)
                    .frame(width: 40, height: 40)
                    .background(.red)
                    .cornerRadius(5)

                    .onChange(of: someText) {
                        if someText.count > 1 {
                            someText = String(someText.prefix(1))
                        }
                    }

                TextField("",text: $box)
                    .frame(width: 40, height: 40)
                    .background(.red)
                    .cornerRadius(5)
                    .onChange(of: someText) {
                        if someText.count > 1 {
                            someText = String(someText.prefix(1))
                        }
                    }
                
                TextField("",text: $box)
                    .frame(width: 40, height: 40)
                    .background(.red)
                    .cornerRadius(5)
                    .onChange(of: someText) {
                        if someText.count > 1 {
                            someText = String(someText.prefix(1))
                        }
                    }
                
                
            }
            HStack{
                Text("a")
                Text("a")
                Text("a")
            }
        }
        Text("احبك")
    }
}

#Preview {
    test()
}
