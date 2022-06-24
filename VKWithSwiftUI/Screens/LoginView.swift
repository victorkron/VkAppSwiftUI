//
//  ContentView.swift
//  VKWithSwiftUI
//
//  Created by Карим Руабхи on 18.06.2022.
//

import SwiftUI
import Combine

struct LoginView: View {
    
    @Binding var isUserLoggedIn: Bool
    
    @State private var login = ""
    @State private var password = ""
    @State private var shouldShowLogo: Bool = true
    @State private var currentBackground: Int = 0
    
    @State private var showIncorrentCredentialsWarning = false
    
    private let backgrounds: [String] = ["light mode", "dark mode"]
    
    
    private let keyboardIsOnPublisher = Publishers.Merge(
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillShowNotification)
            .map { _ in true },
        NotificationCenter.default.publisher(for: UIResponder.keyboardWillHideNotification)
            .map { _ in false }
    )
        .removeDuplicates()
    
    
    private func verifyLoginData() {
        if login == "" && password == "" {
            isUserLoggedIn = true
        } else {
            showIncorrentCredentialsWarning = true
        }
        
        password = ""
    }
    
    
    var body: some View {
        ZStack {
            GeometryReader { geometry in
                Image(backgrounds[currentBackground])
                    .resizable()
                    .edgesIgnoringSafeArea(.all)
                    .aspectRatio(contentMode: .fill)
                    .frame(
                        maxWidth: geometry.size.width,
                        maxHeight: geometry.size.height
                    )
            }
            
            VStack {
                ScrollView {
                    
                    if shouldShowLogo {
                        VStack {
                            Image("shoes")
                                .resizable()
                                .edgesIgnoringSafeArea(.all)
                                .aspectRatio(contentMode: .fill)
                                .frame(width: 80, height: 80, alignment: .center)
                            Text("____________")
                                .foregroundColor(.white)
                                .font(.largeTitle)
                                .padding(.top, -50)
                        }
                        
                    }
                    
                    VStack {
                        HStack {
                            Text("Phone number or email:")
                                .foregroundColor(Color.white)
                                .font(.headline)
                            Spacer()
                        }
                        TextField("", text: $login)
                            .textFieldStyle(.roundedBorder)
                            .padding(.top, -10)
                    }.padding([.leading, .trailing], 40)
                    
                    VStack {
                        HStack {
                            Text("Password:")
                                .foregroundColor(Color.white)
                                .font(.headline)
                            Spacer()
                        }
                        TextField("", text: $password)
                            .textFieldStyle(.roundedBorder)
                            .padding(.top, -10)
                    }.padding([.leading, .trailing], 40)
                    
                    HStack {
                        Button {
                            self.verifyLoginData()
                        } label: {
                            Label("Log in ", image: "")
                                .foregroundColor(Color.white)
                        }
                        .padding([.trailing, .leading, .top, .bottom], 5)
                        .background(Color(red: 0.5, green: 0.4, blue: 0.65, opacity: 1))
                        .cornerRadius(10)
                        .padding(.top, 20)
                        
                        Button {
                            print("Cancel button pressed")
                        } label: {
                            Label("Cancel ", image: "")
                                .foregroundColor(Color.white)
                        }
                        .padding([.trailing, .leading, .top, .bottom], 5)
                        .background(Color(red: 0.4, green: 0.3, blue: 0.55, opacity: 0.8))
                        .cornerRadius(10)
                        .padding(.top, 20)
                    }
                    
                    VStack {
                        HStack {
                            Text("Haven't account yet?")
                                .foregroundColor(Color.white)
                                .font(.headline)
                            Spacer()
                        }
                        GeometryReader { geometry in
                            Button {
                                print("Registration button pressed")
                            } label: {
                                Label("Registration ", image: "")
                                    .foregroundColor(Color.white)
                            }
                            .frame(width: geometry.size.width, height: 50, alignment: .center)
                            .background(Color(red: 0.6, green: 0.4, blue: 0.65, opacity: 1))
                            .cornerRadius(10)
                        }
                        
                    }.padding().padding(.top, 10)
                    
                    
                }
                .onReceive(keyboardIsOnPublisher) { isKeyboardOn in
                    withAnimation(Animation.easeInOut(duration: 0.5)) {
                        self.shouldShowLogo = !isKeyboardOn
                    }
                }
                Spacer()
                Picker(selection: $currentBackground, label: Text("Chouse background")) {
                    Text("Chose a color👆🏻")
                    ForEach(0..<2) { index in
                        Text(backgrounds[index])
                    }
                }
            }
            .padding()
            .font(.title)
        }
        .autocapitalization(.none)
        .alert(isPresented: self.$showIncorrentCredentialsWarning, content: {
            Alert(
                title: Text("Incorrect credentials"),
                message: Text("Incorrect password or login"),
                dismissButton: .cancel()
            )
        })
        .onTapGesture {
            UIApplication.shared.endEditing()
        }
        
    }
}

extension UIApplication {
    func endEditing() {
        sendAction(#selector(UIResponder.resignFirstResponder), to: nil, from: nil, for: nil)
    }
}

//struct ContentView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
