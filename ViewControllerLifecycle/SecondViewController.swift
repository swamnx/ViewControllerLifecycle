//
//  SecondViewController.swift
//  ViewControllerLifecycle
//
//  Created by swamnx on 25.04.21.
//

import UIKit

class SecondViewController: AnalyticUIViewController {

    override init(nibName nibNameOrNil: String?, bundle nibBundleOrNil: Bundle?) {
        super.init(nibName: nibNameOrNil, bundle: nibBundleOrNil)
        screenName = String(describing: type(of: self) )
    }

    required init?(coder: NSCoder) {
        super.init(coder: coder)
        screenName = String(describing: type(of: self) )
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

}
