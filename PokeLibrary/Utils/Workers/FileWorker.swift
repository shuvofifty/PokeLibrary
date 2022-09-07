//
//  FileWorker.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/7/22.
//

import Foundation
import Combine
import UIKit

public protocol FileWorker {
    func getImageFrom(url: String) -> AnyPublisher<UIImage, APIError>
}

public class FileWorkerImp: FileWorker {
    private let networking: Networking
    
    public init(networking: Networking) {
        self.networking = networking
    }
    
    public convenience init() {
        self.init(networking: NetworkingImp())
    }
    
    public func getImageFrom(url: String) -> AnyPublisher<UIImage, APIError> {
        networking.sendImage(request: Request(type: .GET, url: url, header: [:], body: [:]))
            .receive(on: DispatchQueue.main)
            .eraseToAnyPublisher()
    }
}
