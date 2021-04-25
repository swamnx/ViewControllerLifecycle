//
//  Analytic.swift
//  ViewControllerLifecycle
//
//  Created by swamnx on 25.04.21.
//

import Foundation

class Analytics {

    private var sessions = [String: Date]()
    private let dateFormatter = DateFormatter()
    private let dateComponentsFormatter = DateComponentsFormatter()

    static var shared: Analytics = {
          let instance = Analytics()
          return instance
      }()

    private init() {
        dateFormatter.dateFormat = "yyyy-MM-dd HH:mm:ss"
        dateComponentsFormatter.allowedUnits = [.day, .hour, .minute, .second]
        dateComponentsFormatter.unitsStyle = .full
    }

    func startAnalyticSessionFor(sceneId: String) {
        sessions[sceneId] = Date()
    }

    func endAnalyticSessionFor(sceneId: String) {
        let endDate = Date()
        if let removedStartDate = sessions.removeValue(forKey: sceneId) {
            let sessionInterval = DateInterval(start: removedStartDate, end: endDate).duration
            let formatedSessionInterval = formatedInterval(sessionInterval)
            let formatedStartDate = formatedDate(removedStartDate)
            print("Session for \(sceneId) is ended.",
                  "It was started on \(formatedStartDate) and lasted for \(formatedSessionInterval)")
        } else {
            print("No session with sceneId: \(sceneId) was found")
        }
    }

    private func formatedInterval(_ interval: TimeInterval) -> String {
        return dateComponentsFormatter.string(from: interval)!
    }

    private func formatedDate(_ date: Date) -> String {
        return dateFormatter.string(from: date)
    }

}
