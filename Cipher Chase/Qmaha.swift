//
//  mahas_senarios.swift
//  Cipher Chase
//
//  Created by maha on 09/05/1445 AH.
//
//

import SwiftUI

struct Qmaha: View {
    @Environment(\.presentationMode) var presentationMode: Binding<PresentationMode>
    @State private var path = NavigationPath()
    
    let codeText = """
    def decrypt_caesar(encrypted_text, shift):
        decrypted_message = ""
    
        for char in encrypted_text:
            if char.isalpha():
                is_upper = char.isupper()
                decrypted_char = chr((ord(char) - shift - ord('A' if is_upper else 'a')) % 26 + ord('A' if is_upper else 'a'))
                decrypted_message += decrypted_char
            else:
                decrypted_message += char
    
        return decrypted_message
    
    # Example usage
    encrypted_message = "Wkh Skrhqla surmhfw dlpv wr lqilowudwh wkh fruh orjlf ri wkh dfdghpb'v vhfxulwb vbvwhp. Wkh Hqfrghu sodqv wr hasorlw yxoqhudelolwlhv dqg jdlq frqwuro. Ehzduh, ghfrghuv, wkh qhaw ohyho dzdlwv, dqg wkh Skrhqla lv uhdgb wr vsuhdg lwv zlqjv"
    decryption_shift =
    
    decrypted_message = decrypt_caesar(encrypted_message, decryption_shift)
    print("Decrypted Message:", decrypted_message)
    """
    

    
    @State var isActive: Bool = false
    
    
    var body: some View {
        
        if self.isActive{
            mahas_senarios()
        }else{
            NavigationStack(path: $path) {
                ZStack {
                    Color(.sRGB, red: 2/255, green: 49/255, blue: 69/255)
                        .edgesIgnoringSafeArea(.all)
                    
                    VStack {
                        GeometryReader { geometry in
                            ScrollView {
                                VStack(alignment: .leading) {
                                    Text(codeText)
                                        .font(Font.custom("PixelifySans-Bold", size: 16))
                                        .padding()
                                        .background(Color.gray.opacity(0.4))
                                        .cornerRadius(10)
                                        .foregroundColor(.white)
                                    
                                    HStack(spacing: 15){
                                        Spacer() // Add spacer to push content to the center
                                        
                                        Button(action: {
                                            // Action to perform when the first button is tapped
                                            print("Button 1 tapped")
                                        }) {
                                            Text("1")
                                                .font(.headline)
                                                .foregroundColor(.black)
                                                .padding()
                                                .background(Color.white)
                                                .cornerRadius(10)
                                        }
                                        
                                        Button(action: {
                                            // Action to perform when the second button is tapped
                                            print("Button 3 tapped")
                                            isActive = true
                                        }) {
                                            Text("3")
                                                .font(.headline)
                                                .foregroundColor(.black)
                                                .padding()
                                                .background(Color.white)
                                                .cornerRadius(10)
                                        }
                                        
                                        Button(action: {
                                            // Action to perform when the third button is tapped
                                            print("Button 6 tapped")
                                        }) {
                                            Text("6")
                                                .font(.headline)
                                                .foregroundColor(.black)
                                                .padding()
                                                .background(Color.white)
                                                .cornerRadius(10)
                                        }
                                        Spacer() // Add spacer to push content to the center
                                        
                                        
                                    }
                                    .padding(.leading, 40)
                                    
                                }
                                .padding()
                            }
                        }
                    }
                }
            }
            .onAppear {
                UserDefaults.standard.set("Qmaha", forKey: "leftOff")
                    }
        }

            }
        }

#Preview {
    Qmaha()
}


