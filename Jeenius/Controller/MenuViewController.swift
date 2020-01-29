//
//  MenuViewController.swift
//  Jeenius
//
//  Created by Mariana Beilune Abad on 29/01/20.
//  Copyright © 2020 Mariana Beilune Abad. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var play: UIButton!
    @IBOutlet weak var ranking: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        play.layer.cornerRadius = 20
        ranking.layer.cornerRadius = 20
        // Do any additional setup after loading the view.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
