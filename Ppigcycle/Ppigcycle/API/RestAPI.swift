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
        
        // 원하는 객체 타입으로 바꿔주기 위해 JSONSerialization 사용
        // 파라미터는 api 호출시 받는거
        // 파라미터로 받은 객체를 원하는 타입으로 바꿔서 data에 저장
        let data = try! JSONSerialization.data(withJSONObject: parameters)
        
        // URLRequest 객체 정의하고 요청 내용 담기
        var request = URLRequest(url: url)
        request.httpMethod = "POST"
        request.httpBody = data
        request.setValue("application/json", forHTTPHeaderField: "Content-Type")
        
        // URLSession은 http를 통해 데이터를 주고 받는 api 제공 클래스
        // 비동기(요청과 응답이 동시에 일어나지 않음) 처리하기 위한 코드
        // URLSession 객체를 통해 전송 및 응답값 처리
        let task = URLSession.shared.dataTask(with: request) { [weak self] data, _, error in
            guard let data = data, error == nil else {
                return
            }
            do {
                // JSON 타입의 데이터를 디코딩해서 posts에 저장
                let posts = try JSONDecoder().decode(String.self, from: data)
                DispatchQueue.main.async {
                    print(posts)
                }
            }
            catch {
                print(error)
            }
        }
        // post 전송
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
