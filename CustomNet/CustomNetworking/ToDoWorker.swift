//
//  ToDoWorker.swift
//  CustomNetworking
//
//  Created by Виктория Серикова on 01.12.2023.
//


import Foundation

enum toDoEndpoint: Endpoint {
    case todo(Int)
    var compositePath: String {
        switch self {
            
        case .todo(let number):
            "/todos/\(number)"
        }
    }
    
    var headers: HeaderModel { [:] }
}

struct Todo: Codable {
    let userID, id: Int
    let title: String
    let completed: Bool

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, completed
    }
}

final class ToDoWorker {
    private let networking: Networking = Networking(baseUrl: "https://jsonplaceholder.typicode.com")
    
    typealias toDoResult = (Result<Todo, Error>) -> Void
    
    func fetchTodos(complition: @escaping toDoResult) {
        let endPoint = toDoEndpoint.todo(1)
        let request = Request(endpoint: endPoint, method: .get)
        networking.executeRequest(with: request) { result in
            switch result {
            case .success(let model):
                if let data = model.data {
                    print(String(data: data, encoding: .utf8))
                }
            case .failure(let error):
                complition(.failure(error))
            }
        }
    }
}
