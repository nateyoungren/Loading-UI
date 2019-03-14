//
//  ViewController.swift
//  Loading UI Test
//
//  Created by Nathanael Youngren on 3/13/19.
//  Copyright © 2019 Nathanael Youngren. All rights reserved.
//

import UIKit
import Loading_UI

class ViewController: UIViewController {

    @IBAction func buttonTapped(_ sender: UIButton) {
        
        let loading = LoadingViewController()
        
/* Customization:
 
        loading.color = UIColor.yellow.cgColor
        loading.size = 50
        loading.width = 10
        loading.backgroundColor = UIColor.orange

 */
        
        present(loading, animated: true) { }
    }
}
