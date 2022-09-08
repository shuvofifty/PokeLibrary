//
//  AsynImageView.swift
//  PokeLibrary
//
//  Created by Shubroto Shuvo on 9/7/22.
//

import Combine
import Foundation
import SwiftUI

public struct AsyncImageView: View {
    @ObservedObject private var viewModel: AsyncImageViewModel = AsyncImageViewModel()
    @State private var image: UIImage = UIImage(imageLiteralResourceName: "NoImage")
    
    private let url: String
    
    public init(url: String) {
        self.url = url
    }
    
    public var body: some View {
        Image(uiImage: image)
            .resizable()
            .onAppear(perform: {
                viewModel.getImage(from: url)
            })
            .onReceive(viewModel.didChange) { image in
                self.image = image
            }
    }
}

fileprivate class AsyncImageViewModel: ObservableObject {
    let didChange = PassthroughSubject<UIImage, Never>()
    private var subscriptions = Set<AnyCancellable>()
    
    private let fileWorker: FileWorker
    
    init(fileWorker: FileWorker = FileWorkerImp()) {
        self.fileWorker = fileWorker
    }
    
    func getImage(from url: String) {
        fileWorker.getImageFrom(url: url)
            .replaceError(with: UIImage(imageLiteralResourceName: "NoImage"))
            .sink { image in
                self.didChange.send(image)
            }
            .store(in: &subscriptions)
    }
}
