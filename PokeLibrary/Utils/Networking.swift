//
//  Networking.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/1/22.
//

import Foundation
import Combine

public protocol Networking {
    func send(request: Request) -> AnyPublisher<Void, Error>
}

public class NetworkingImp: Networking {
    private let urlSession: URLSession
    
    public init(urlSession: URLSession = URLSession.shared) {
        self.urlSession = urlSession
    }
    
    public func send(request: Request) -> AnyPublisher<Void, Error> {
        
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
