//
//  AuthNavController.swift
//  MAP
//
//  Created by killi8n on 2018. 7. 18..
//  Copyright © 2018년 killi8n. All rights reserved.
//

import UIKit

class AuthNavController: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()

        view.backgroundColor = .white
    
        
        let views = [LoginViewController()]
        
        viewControllers = views
        
        
        
    }

}
