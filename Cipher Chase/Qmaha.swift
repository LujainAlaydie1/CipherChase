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
    
    @State private var isButton6Tapped = false
    @State private var isButton1Tapped = false
    
    @EnvironmentObject var router: Router
    @State private var isShowingPopup = false
    @State private var progress: Double = 5 / 6
        
    var body: some View {
                ZStack {
                    Color(.sRGB, red: 2/255, green: 49/255, blue: 69/255)
                        .edgesIgnoringSafeArea(.all)
                    
                        .alert(isPresented: $isShowingPopup) {
                            Alert(
                                title: Text("Information"),
                                message: Text("Find the correct decryption shift."),
                                dismissButton: .default(Text("OK"))
                            )
                        }
                        
                        VStack(spacing: -20) {
                        GeometryReader { geometry in
                            ScrollView {
                                VStack(alignment: .leading) {
                                    Text(codeText)
                                        .font(Font.system(size: 16))
                                        .padding()
                                        .background(Color.gray.opacity(0.4))
                                        .cornerRadius(10)
                                        .foregroundColor(.white)
                                        .offset(y: 10)
                                    HStack(spacing: 15){
                                        Spacer() // Add spacer to push content to the center
                                        
                                        Button(action: {
                                            // Action to perform when the first button is tapped
                                            print("Button 1 tapped")
                                            self.isButton1Tapped.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                               self.isButton1Tapped = false
                                                           }
                                            
                                        }) {
                                            Text("1")
                                                .font(.headline)
                                                .foregroundColor(.black)
                                                .padding()
                                                .background(isButton1Tapped ? Color.red : Color.white)
                                                .cornerRadius(10)
                                        }
                                        
                                        Button(action: {
                                            // Action to perform when the second button is tapped
                                            print("Button 3 tapped")
                                            router.navigate(to: .progress5)
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
                                            self.isButton6Tapped.toggle()
                                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                                               self.isButton6Tapped = false
                                                           }
                                        }) {
                                            Text("6")
                                                .font(.headline)
                                                .foregroundColor(.black)
                                                .padding()
                                                .background(isButton6Tapped ? Color.red : Color.white)
                                                .cornerRadius(10)
                                        }
                                        Spacer() // Add spacer to push content to the center
                                        
                                        
                                    }
                                    .offset(y: 10)
                                    
                                }
                                .padding()
                            }
                        }
                    }
                }

            .onAppear {
                UserDefaults.standard.set("Qmaha", forKey: "leftOff")
                    }
        
            .navigationTitle("Task 5")
            .navigationBarBackButtonHidden()

            .toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button {
                        print("Information")
                        isShowingPopup.toggle()
                    } label: {
                        Image(systemName: "lightbulb")
                            .foregroundColor(.white)
                    }
                }
                
                ToolbarItem(placement: .navigationBarLeading) {
                    Button {
                        router.navigateToRoot()
                    } label: {
                        Image(systemName: "chevron.backward")
                            .foregroundColor(.white)
                        Text("Back")
                            .foregroundColor(.white)
                    }
                }
            }

            }
        }

#Preview {
    Qmaha()
}


