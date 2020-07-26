//
//  GeometryReaderTools.swift
//  News
//
//  Created by Patryk Dampc on 26/07/2020.
//  Copyright © 2020 Patryk Dampc. All rights reserved.
//

import SwiftUI

extension GeometryProxy {
    
    func height() -> CGFloat {
        self.frame(in: .global).height
    }
    
    func width() -> CGFloat {
        self.frame(in: .global).width
    }
    
}
