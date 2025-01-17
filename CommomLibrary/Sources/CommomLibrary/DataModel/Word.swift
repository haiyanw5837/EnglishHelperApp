//
//  File.swift
//  
//
//  Created by 老房东 on 2022-03-08.
//

import Foundation

public struct WordViewModel{
    public let name:String
    public let picture: Picture?
}

public extension Word{
    var viewModel: WordViewModel {
        return WordViewModel(
            name: self.name ?? "Unknow",
            picture: self.picture
        )
    }
}
