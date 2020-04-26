//
//  BeerListViewModel.swift
//  PankApp
//
//  Created by Motonari Nakashima on 2020/04/17.
//  Copyright © 2020 motoshima1150. All rights reserved.
//

import Foundation
import Combine

final class BeerListViewModel: ObservableObject, Identifiable {
    
     // MARK: Input
     @Published var userId: String = ""
     @Published var password: String = ""
     
     // MARK: Output
     @Published private(set) var beers: [Beer] = []
    
    private let apiService: APIServiceType
    private var subscriptions = Set<AnyCancellable>()
    
    init(apiService: APIServiceType = APIService()) {
        self.apiService = apiService
        
    }
    
    func onAppear() {
        let request = BeersRequest(page: 1)
        
        apiService.response(from: request).sink(receiveCompletion: { (completion) in
            switch completion {
            case .finished:
                print("Completed")
            case .failure(let error):
                print(error.localizedDescription)
            }
        }) { [weak self] (beers) in
            self?.beers = beers
        }.store(in: &subscriptions)
    }
    
}
