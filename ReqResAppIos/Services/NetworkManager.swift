//
//  NetworkManager.swift
//  ReqResAppIos
//
//  Created by Vadim on 22.07.2024.
//

import Foundation

final class NetworkManager{
    
    static let shared = NetworkManager()
    
    private init() {}
    
    enum NetworkError: Error{
        case noData
        case decodingError
        case noUsers
        
        var title: String{
            switch self {
            case .noData:
                return "Can't decode received data"
            case .decodingError:
                return "Can't fetch data at all"
            case .noUsers:
                return "No users got from API"
            }
        }
    }
    
    func fetchAvatar(from url: URL, completion: @escaping(Data) -> Void) {
        DispatchQueue.global().async {
            guard let imageData = try? Data(contentsOf: url) else { return }
            
            DispatchQueue.main.async {
                completion(imageData)
            }
        }
    }
    
    func fetchUsers(completion: @escaping (Result<[User], NetworkError>) -> Void) {
        URLSession.shared.dataTask(with: Link.allUsers.url) { data, response, error in
            guard let data, let response = response as? HTTPURLResponse else{
                print(error?.localizedDescription ?? "No error description")
                sendFailure(with: .noData)
                return
            }
            
            if (200...299).contains(response.statusCode){
                
                let decoder = JSONDecoder()
                decoder.keyDecodingStrategy = .convertFromSnakeCase
                
                do{
                    let usersQuery =  try decoder.decode(UsersQuery.self, from: data)
                    DispatchQueue.main.async{
                        if usersQuery.data.count == 0{
                            sendFailure(with: .noUsers)
                            return
                        }
                        completion(.success(usersQuery.data))
                    }
                } catch {
                    sendFailure(with: .decodingError)
                }
            }
            func sendFailure(with error: NetworkError) {
                DispatchQueue.main.async {
                    completion(.failure(error))
                }
            }
        }.resume()
    }
}

// MARK: - Link
extension NetworkManager {
    enum Link{
        case allUsers
        case withNoData
        case withDecodingError
        case withNoUsers
        
        var url: URL {
            switch self{
            case .allUsers:
                return URL(string: "https://reqres.in/api/users/?delay=2")!
            case .withNoData:
                return URL(string: "https://reqres.in/api/users")!
            case .withDecodingError:
                return URL(string: "https://reqres.in/api/users/3?delay=2")!
            case .withNoUsers:
                return URL(string: "https://reqres.in/api/users/?delay=2&page=3")!
            }
        }
    }
}
