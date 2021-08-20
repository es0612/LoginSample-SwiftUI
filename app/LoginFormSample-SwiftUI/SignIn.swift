//
//  SignIn.swift
//  LoginFormSample-SwiftUI
//
//  Created by Shinya Ema on 2021/08/20.
//

import SwiftUI

struct SignIn: View {
    @State var email: String = ""
    @State var password: String = ""
    
    var body: some View {
        
        VStack{
            Text("Sign In")
                .font(.title)
                .fontWeight(.bold)
                .foregroundColor(Color("dark"))
                .kerning(2)
                .frame(maxWidth: .infinity,  alignment: .leading)
            
            VStack(alignment: .leading, spacing: 6, content: {
                Text("User name")
                    .bold()
                    .foregroundColor(.gray)
                
                TextField("test@test.com", text: $email)
                    .font(.system(size: 18, weight: .semibold, design: .default))
                    .foregroundColor(Color("dark"))
                    .padding(.top, 6)
                
                Divider()
                
            })
            .padding(.top, 18)
            
            VStack(alignment: .leading, spacing: 6, content: {
                Text("Password")
                    .bold()
                    .foregroundColor(.gray)
                
                TextField("password", text: $password)
                    .font(.system(size: 18, weight: .semibold, design: .default))
                    .foregroundColor(Color("dark"))
                    .padding(.top, 6)
                
                Divider()
                
            })
            .padding(.top, 12)
            
            Button(action: {}, label: {
                Text("Forgot password?")
                    .bold()
                    .foregroundColor(.gray)
            })
            .frame(maxWidth: .infinity, alignment: .trailing)
            .padding(.top, 6)
            
            Button(action: {}, label: {
                Image(systemName: "arrow.right")
                    .font(.system(size: 24, weight: .bold, design: .default))
                    .foregroundColor(.white)
                    .padding()
                    .background(Color.black)
                    .clipShape(Circle())
                    .shadow(color: Color("lightBlue").opacity(0.6), radius: 6, x: 0.0, y: 0.0)
            })
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding(.top, 12)
            
        }
        .padding()
    }
}

struct SignIn_Previews: PreviewProvider {
    static var previews: some View {
        SignIn()
    }
}
