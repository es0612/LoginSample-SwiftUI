//
//  Home.swift
//  LoginFormSample-SwiftUI
//
//  Created by Shinya Ema on 2021/08/20.
//

import SwiftUI

struct Home: View {
    
    @State var maxCircleheight: CGFloat = 0
    @State var signUpIsShown = false
    
    var body: some View {
        VStack {
            
            GeometryReader{ proxy -> AnyView in
                let height = proxy.frame(in: .global).height
                
                DispatchQueue.main.async {
                    if maxCircleheight == 0 {
                        maxCircleheight = height
                    }
                    
                }
                
                return AnyView(
                    ZStack{
                        Circle().foregroundColor(Color("dark"))
                            .offset(x: UIScreen.main.bounds.width / 2, y: -height / 1.2)
                        Circle().foregroundColor(Color("dark"))
                            .offset(x: -UIScreen.main.bounds.width / 2, y: -height / 1.3)
                        Circle().foregroundColor(Color("lightBlue"))
                            .offset(y: -height / 1.3)
                            .rotationEffect(.init(degrees: -5))
                        
                    }.frame( height: height)
                )
            }
            
            
            ZStack{
                if signUpIsShown {
                    SignUp().transition(.move(edge: .trailing))
                }
                else {
                    SignIn().transition(.move(edge: .trailing))
                }
            }
            .padding(.top, -maxCircleheight / 1.6)
            .frame(maxHeight: .infinity, alignment: .top)
        }
        .overlay(
            HStack {
                Text(!signUpIsShown ? "New menber" : "Already member")
                    .bold()
                    .foregroundColor(.gray)
                
                Button(action: {
                    withAnimation {
                        signUpIsShown.toggle()
                    }
                    
                }, label: {
                    Text(!signUpIsShown ? "Sign Up" : "Sign In")
                        .bold()
                        .foregroundColor(Color("lightBlue"))
                })
            }
            ,alignment: .bottom
        )
        .background(
            HStack{
                Circle()
                    .fill(Color("lightBlue"))
                    .frame(width: 72, height: 72)
                    .offset(x: -20, y: 0)
                
                Spacer()
                
                Circle()
                    .fill(Color("dark"))
                    .frame(width: 108, height: 108)
                    .offset(x: 40, y: 20)
            }
            .offset(y: getSafeArea().bottom + 30)
            ,alignment: .bottom
        )
    }
}

struct Home_Previews: PreviewProvider {
    static var previews: some View {
        Home()
    }
}

extension View {
    func getSafeArea() -> UIEdgeInsets {
        return UIApplication.shared.windows.first?.safeAreaInsets ?? UIEdgeInsets(top: 0, left: 0, bottom: 0, right: 0)
    }
}
