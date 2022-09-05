//
//  Networking.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/1/22.
//

import Foundation
import Combine

public protocol Networking {
    func send(request: Request) -> AnyPublisher<Data, APIError>
}

public class NetworkingImp: Networking {
    private let urlSession: URLSession
    
    public init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    public func send(request: Request) -> AnyPublisher<Data, APIError> {
        guard let url = URL(string: request.url) else {
            return Fail(error: APIError.invalidRequestError("URL Invalid")).eraseToAnyPublisher()
        }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = request.type.rawValue
        request.header.forEach { (key, val) in
            if let val = val as? String {
                urlRequest.setValue(val, forHTTPHeaderField: key)
            }
        }
        
        return urlSession.dataTaskPublisher(for: urlRequest)
            .tryMap { data, response -> Data in
                guard let response = response as? HTTPURLResponse else {
                    throw APIError.unknownError("HTTP URL Response not found")
                }
                guard (200..<300).contains(response.statusCode) else {
                    throw APIError.failedResponse(code: response.statusCode, message: "Failed request with status code: \(response.statusCode)")
                }
                return data
            }
            .mapError{error in
                    .unknownError("Unhandled error occured: \(error.localizedDescription)")
            }
            .eraseToAnyPublisher()
    }
}

public struct Request {
    var type: RequestType
    var url: String
    var header: [String: Any]
    var body: [String: Any]
}

public enum RequestType: String {
    case POST, GET, PUT, DELETE
}

public enum APIError: LocalizedError {
    case invalidRequestError(String)
    case unknownError(String)
    case failedResponse(code: Int, message: String)
}
