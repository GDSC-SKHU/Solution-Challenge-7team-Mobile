//
//  RestAPI.swift
//  ppigcycle
//
//  Created by Jinhee on 2023/03/26.
//

import Foundation
import Combine
import SwiftUI

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

struct Barcode: Hashable, Codable {
    let goods_name: String
    let how: String
    let method: String
}
//struct Marerial: Hashable, Codable {
//    let how: String
//}

class RestAPI: ObservableObject {
    static let shared = RestAPI()
    @Published var signup: [SignUp] = []
    @Published var login: [Login] = []
    @Published var loginsuccess: Bool = false
    @Published var date: String = ""//날짜
    @Published var posts: [Barcode] = []
//    @Published var materialResponse: [Material] = [] //분리수거과정
    @Published var materialResponse: String = ""
    var getid: Any = ""
    
    //MARK: 회원가입
    func Signup(parameters: [String: Any]) {
        guard let url = URL(string:
                                "http://ppigcycle.duckdns.org/users/new-user") else {
            return
        }
        
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        getid = parameters["id"]
        
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
                                "http://ppigcycle.duckdns.org/login") else {
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
                    completion(true)
                }

            }
            catch {
                print(error)
            }
        }
        task.resume()
    }
    func fetchDate() {
        if let url = URL(string: "http://ppigcycle.duckdns.org/user/\(getid)/day") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error:", error)
                } else if let data = data, let responseString = String(data: data, encoding: .utf8) {
                    DispatchQueue.main.async {
                        self.date = responseString
                    }
                }
            }
            task.resume()
        }
    }
    
    func fetchMaterial(material: String) {
        if let url = URL(string: "http://ppigcycle.duckdns.org/recycle/\(material)") {
            let task = URLSession.shared.dataTask(with: url) { (data, response, error) in
                if let error = error {
                    print("Error:", error)
                } else if let data = data, let responseString = String(data: data, encoding: .utf8) {
                    DispatchQueue.main.async {
                        self.materialResponse = responseString
                    }
                }
            }
            task.resume()
        }
    }
    
    
    
//
//            func fetchMaterial(meterial: String) {
//                guard let url = URL(string: "http://ppigcycle.duckdns.org/recycle/\(meterial)") else {
//                    print("Invalid URL")
//                    return
//                }
//
//                let request = URLRequest(url: url)
//                let session = URLSession.shared
//                let task = session.dataTask(with: request) { (data, response, error) in
//                    if let error = error {
//                        print("Error: \(error.localizedDescription)")
//                        return
//                    }
//                    guard let data = data,
//                          let responseString = String(data: data, encoding: .utf8) else {
//                        print("No data returned")
//                        return
//                    }
//                    // 받은 데이터를 이용하여 view를 업데이트합니다.
//                    DispatchQueue.main.async {[self] in
//                        self.materialResponse = materialResponse
//
//                    }
//                }
//                task.resume()
//
//            }
//
        
        //MARK: 바코드 번호로 조회
        func fetch(parameters: [String : Any]) {
            let barcodeNumber = parameters["barcodeNumber"]!
            
            guard let url = URL(string:
                                    "http://ppigcycle.duckdns.org/barcode/\(barcodeNumber)") else {
                return
            }
            
            let task = URLSession.shared.dataTask(with: url) { [weak self] data, _, error in
                guard let data = data, error == nil else {
                    return
                }
                
                do {
                    let posts = try JSONDecoder().decode(Barcode.self, from: data)
                    DispatchQueue.main.async { [self] in
                        self?.posts = [posts]
                    }
                }
                catch {
                    print(error)
                }
            }
            task.resume()
        }
}
