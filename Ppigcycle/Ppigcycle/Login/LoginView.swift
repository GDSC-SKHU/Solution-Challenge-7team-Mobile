//
//  LoginView.swift
//  Ppigcycle
//
//  Created by Jinhee on 2023/02/25.
//

import SwiftUI

extension Color {
    init(r: CGFloat, g: CGFloat, b: CGFloat) {
        self.init(red: r/255, green: g/255, blue: b/255)
    }
}

struct LoginView: View {
    @State private var id: String = ""
    @State private var password: String = ""
    @State private var signup = false
    @State var tag:Int? = nil
    @State private var error = false
    @StateObject var api = RestAPI.shared
    @Binding var loginSuccess: Bool // 화면 전환 시 사용
    
    var body: some View {
        NavigationView {
            ZStack {
                Color(r:254, g: 251, b: 233).ignoresSafeArea()
                VStack {
                    Spacer()
                    Image("logo")
                        .resizable()
                        .frame(width: 120, height: 100)
                    HStack {
                        Spacer()
                        TextField("아이디", text: $id)
                            .padding()
                            .autocapitalization(.none) // 자동으로 대문자 설정 안하기
                            .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                        Spacer()
                    }
                    .padding(10)
                    HStack {
                        Spacer()
                        SecureField("비밀번호", text: $password)
                            .padding()
                            .background(RoundedRectangle(cornerRadius: 10).strokeBorder())
                        Spacer()
                    }
                    .padding(10)
                    HStack {
                        // 로그인 버튼
                        Button(action: {
                            // api 연결 코드 작성
                            self.loginSuccess = true
                        }) {
                            Text("로그인")
                                .frame(width: 100, height: 35)
                                .fontWeight(.semibold)
                                .font(.title3)
                                .foregroundColor(.white)
                                .background(RoundedRectangle(cornerRadius: 40).fill(Color.green))
                        }
                        // 회원가입 버튼
                        Button(action: {
                            self.signup = true
                        }) {
                            Text("회원가입")
                                .frame(width: 100, height: 35)
                                .fontWeight(.semibold)
                                .font(.title3)
                                .foregroundColor(.white)
                                .background(RoundedRectangle(cornerRadius: 40).fill(Color.green))
                                .sheet(isPresented: self.$signup) {
                                    SignUpView()
                                }
                        }
                    }
                    .padding()
                    Spacer()
                    // 로그인 실패 시 오류
                    if error {
                        Text("아이디 또는 비밀번호 오류")
                            .foregroundColor(Color.red)
                    }
                }
            }
        }
    }
}

//struct LoginView_Previews: PreviewProvider {
//    static var previews: some View {
//        LoginView()
//    }
//}
