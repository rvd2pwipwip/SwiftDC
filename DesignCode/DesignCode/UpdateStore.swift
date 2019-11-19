//
//  UpdateStore.swift
//  DesignCode
//
//  Created by Herve Desrosiers on 2019-10-15.
//  Copyright © 2019 Herve Desrosiers. All rights reserved.
//

import SwiftUI
import Combine //framework for data store and data manipulate/edit
//stores are like states, except they exist externally
class UpdateStore: ObservableObject { //create a store that will listen to data changes
    @Published var updates: [Update] = updateData //ping publisher everytime field changes
    
}

