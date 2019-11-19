//
//  UpdateStore.swift
//  SwiftUI-DesignCode
//
//  Created by Meng To on 2019-06-23.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore : BindableObject {
    var updates: [Update] {
        didSet { willChange.send() }
    }
    
    init(updates: [Update] = []) {
        self.updates = updates
    }
    
    var willChange = PassthroughSubject<Void, Never>()
}
