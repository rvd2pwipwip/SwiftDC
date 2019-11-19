//
//  UpdateStore.swift
//  DesignCode
//
//  Created by Meng To on 2019-07-01.
//  Copyright © 2019 Meng To. All rights reserved.
//

import SwiftUI
import Combine

class UpdateStore: ObservableObject {
    @Published var updates: [Update] = updateData
}

