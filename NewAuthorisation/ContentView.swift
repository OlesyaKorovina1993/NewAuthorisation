//
//  ContentView.swift
//  NewAuthorisation
//
//  Created by user on 06.04.2021.
//

import SwiftUI
import UIKit

struct CustomTextFieldLogin: View {
    var placeholder: Text
    @Binding var textLogin: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .center) {
            if textLogin.isEmpty { placeholder }
            TextField("", text: $textLogin, onEditingChanged: editingChanged, onCommit: commit)
        }
    }
}

struct CustomTextFieldPassword: View {
    
    var placeholder: Text
    @Binding var textPassword: String
    var editingChanged: (Bool)->() = { _ in }
    var commit: ()->() = { }

    var body: some View {
        ZStack(alignment: .center) {
            if textPassword.isEmpty { placeholder }
                TextField("", text: $textPassword, onEditingChanged: editingChanged, onCommit: commit)
            
            
        }
    }
}

struct ContentView: View {
    @State var login = "butterfly"
    @State var password = "12345"
    @State var textLogin = ""
    @State var textPassword = ""
    @State var showView = false
    
    @State private var isLoginValid: Bool = false
    @State var errorLabel = ""
    //@State var showSheet = ""
    var body: some View {
        
        NavigationView{
                
            VStack(alignment: .center, spacing: 0.0) {
            Spacer(minLength: 0.0)
            Text("Авторизация")
                .foregroundColor(Color.blue)
                .lineLimit(16)
                .padding()
        
            VStack(alignment: .center, spacing: 10.0) {
                TextField("Логин", text: self.$textLogin)
                /*CustomTextFieldLogin(
                    placeholder: Text("Логин").foregroundColor(.white),
                    textLogin: Binding.constant(textLogin)
                )*/
                .frame(width: 150.0, height: 30.0)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)//цвет текста от пользователя
                .accentColor(.red)//цвет слеша
                .background(Color.gray)//цвет иконки
                .cornerRadius(10)
                .padding()
                
            
                /*CustomTextFieldPassword(
                    placeholder: Text("Пароль").foregroundColor(.white),
                    textPassword: Binding.constant(textPassword)
                )*/
                TextField("Пароль", text: self.$textPassword)
                .frame(width: 150.0, height: 30.0)
                .multilineTextAlignment(.center)
                .foregroundColor(.red)
                .background(Color.gray)
                .cornerRadius(10)
            }
            .padding()
            NavigationLink(
                destination: GreetingView(),
                isActive: self.$isLoginValid) {
                    Text("Вход")
                        .onTapGesture {
                        //let isLoginValid = login == "butterfly" && password == "12345"
                        print(self.textLogin)
                        if self.textLogin == "butterfly" && self.textPassword == "12345" {
                            self.isLoginValid = true
                        } else {
                            
                            self.errorLabel = "Wrong password or login. Try again"
                            print("12345678")
                            //self.shouldShowLoginAlert = true
                        }
                    }
                }
            //else{
           //    return("Wrong login or password. Try again")
           // }
            //NavigationLink(destination: GreetingView(), isActive: $showView) {
                //Text("Вход")
           // }
            
            Spacer(minLength: 50.0)
               /*Label("Wrong password or login. Try again", systemImage: "", text: self.$errorLabel)*/
                Label(self.errorLabel, systemImage: "")
                /*Button(action: {
                    showSheet.toggle()
                    }, label: {
                   Text("Wrong password or login. Try again")
                            })*/
                .foregroundColor(.red)
                .frame(width: /*@START_MENU_TOKEN@*/100/*@END_MENU_TOKEN@*/, height: 60, alignment: .center)
                .multilineTextAlignment(.center)
                
              
                
              }
        .padding()
        }
    }
    
    /*var navLinkBinding : Binding<Bool> {
            Binding<Bool> { () -> Bool in
                return _navLinkActive
            } set: { (newValue) in
                if newValue {
                    print("Side effect")
                }
                _navLinkActive = newValue
            }
        }*/
}


struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
