//
//  Foundation.swift
//  GoLamaGo
//
//  Created by Denis Koryttsev on 11/07/2017.
//  Copyright © 2017 Surf. All rights reserved.
//

import Foundation

// MARK: System undepended

extension NSObject {
    @objc class var nameOfClass: String {
        return NSStringFromClass(self).components(separatedBy: ".").last!
    }

    @objc var nameOfClass: String {
        return NSStringFromClass(type(of: self)).components(separatedBy: ".").last!
    }
}

extension Optional {
    var isNil: Bool {
        if case .none = self { return true }
        return false
    }
    var isSome: Bool {
        if case .some = self { return true }
        return false
    }
}

extension Optional {
    func map<U>(if isRight: () -> Bool, _ transform: (Wrapped) throws -> U) rethrows -> U? {
        guard isRight() else { return nil }

        return try map(transform)
    }
}

extension String: LocalizedError {
    public var errorDescription: String? { return self }
}

extension Double {
    static func radian(fromDegrees degrees: Double) -> Double {
        return (degrees / 180) * .pi
    }
}

extension TimeInterval {
    static var hour: TimeInterval { return 3600 }
    static var day: TimeInterval { return 86400 }
    static var week: TimeInterval { return 604_800 }
}

extension Date {
    func timeIntervalSinceStartOfDay(for timeZone: TimeZone = .current) -> TimeInterval {
        return timeIntervalSince1970.truncatingRemainder(dividingBy: .day) + Double(timeZone.secondsFromGMT())
    }
}

extension Collection {
    subscript(left lInset: IndexDistance, right rInset: IndexDistance) -> SubSequence {
        return self[index(startIndex, offsetBy: lInset) ..< index(endIndex, offsetBy: -rInset)]
    }
}

extension Calendar {
    func timeInterval(sinceStartOfDayFor date: Date) -> TimeInterval {
        return date.timeIntervalSince(startOfDay(for: date))
    }
}

// MARK: App local

extension DateFormatter {
    static let preset = Preset()
    class Preset {
        lazy var time: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "HH:mm"
            return formatter
        }()

        lazy var dayMonth: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "dd MMM"
            return formatter
        }()

        lazy var weekDay: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEEE"
            formatter.formattingContext = .standalone
            return formatter
        }()

        lazy var weekDayShort: DateFormatter = {
            let formatter = DateFormatter()
            formatter.dateFormat = "EEE"
            formatter.formattingContext = .standalone
            return formatter
        }()
    }

    @objc func string(from timeInterval: TimeInterval, withGMTOffset with: Bool = true) -> String {
        return string(from: Date(timeIntervalSince1970: timeInterval - TimeInterval(with ? 0 : timeZone.secondsFromGMT())))
    }
}
