//
//  RestAPI.swift
//  Ppigcycle
//
//  Created by Jinhee on 2023/02/26.
//

import Foundation
import Combine

struct SignUp: Hashable, Codable {
    let id: String
    let password: String
    let checkePassword: String
    let nickname: String
    let date: String
}

struct Login: Hashable, Codable {
    // 로그인 성공 시 반환되는 값
}

class RestAPI: ObservableObject {
    static let shared = RestAPI()
    @Published var signup: [SignUp] = []
    @Published var login: [Login] = []
    @Published var loginsuccess: Bool = false
    
    //MARK: 회원가입
    func Signup(parameters: [String: Any]) {
        guard let url = URL(string:
                                "http://localhost:8080/users/new-user") else {
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                let posts = try JSONDecoder().decode(String.self, from: data)
                DispatchQueue.main.async {
                    print(posts)
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    
    //MARK: 로그인
    func LoginSuccess(parameters: [String: Any],completion: @escaping (Bool) -> Void) {
        
        guard let url = URL(string:
                                "api 주소") else {
            return
        }
        
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
                
            }
            
            do {
                let posts = try JSONDecoder().decode(Login.self, from: data)
                DispatchQueue.main.async {
//                    self!.loginsuccess = true
//                    print("확인 : ", self!.loginsuccess)
//                    print("확인 : ", posts)
                    completion(true)
                }
            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
}
