//
//  DateHelper.swift
//  BlockPouch
//
//  Created by Harrison on 13/5/2025.
//

import Foundation

class DateHelper {
    static var formatter: DateFormatter = {
        let df = DateFormatter()
        df.dateFormat = "yyyy/MM/dd HH:mm"
        return df
    }()
}
