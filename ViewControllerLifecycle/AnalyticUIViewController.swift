//
//  AnalyticUiViewController.swift
//  ViewControllerLifecycle
//
//  Created by swamnx on 25.04.21.
//

import UIKit
class AnalyticUIViewController: UIViewController {

    var screenName: String = defaultScreenName
    private static let defaultScreenName = "Default Screen id"

    open override func viewWillAppear(_ animated: Bool) {
        if screenName != AnalyticUIViewController.defaultScreenName {
            print("\(screenName) will appear")
        }
    }

    open override func viewDidAppear(_ animated: Bool) {
        if screenName != AnalyticUIViewController.defaultScreenName {
            print("\(screenName) did appear")
            Analytics.shared.startAnalyticSessionFor(sceneId: screenName)
        }
    }

    open override func viewWillDisappear(_ animated: Bool) {
        if screenName != AnalyticUIViewController.defaultScreenName {
            print("\(screenName) will disappear")
            Analytics.shared.endAnalyticSessionFor(sceneId: screenName)
        }
    }

    open override func viewDidDisappear(_ animated: Bool) {
        if screenName != AnalyticUIViewController.defaultScreenName {
            print("\(screenName) did disappear")
        }
    }
}
