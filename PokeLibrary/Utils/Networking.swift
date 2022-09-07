//
//  Networking.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/1/22.
//

import Foundation
import Combine
import UIKit

public protocol Networking {
    func send(request: Request) -> AnyPublisher<Data, APIError>
    func sendImage(request: Request) -> AnyPublisher<UIImage, APIError>
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
            .mapError { error in
                error as? APIError ?? .unknownError("Unhandled error occured: The operation couldn’t be completed. Error: \(error)")
            }
            .eraseToAnyPublisher()
    }
    
    public func sendImage(request: Request) -> AnyPublisher<UIImage, APIError> {
        send(request: request)
            .tryMap {data -> UIImage in
                guard let image = UIImage(data: data) else {
                    throw APIError.fileConversionError(code: 10, type: .Image, message: "Unable to convert the downloaded data to image")
                }
                return image
            }
            .mapError { error in
                error as? APIError ?? .unknownError("Unhandled error occured: The operation couldn’t be completed. Error: \(error)")
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
    public enum FileType {
        case Image, File, PDF
    }
    
    case invalidRequestError(String)
    case unknownError(String)
    case failedResponse(code: Int, message: String)
    case fileConversionError(code: Int, type: FileType, message: String)
}
