//
//  SplashViewController.swift
//  vacation planer
//
//  Created by fa7labs on 07/04/18.
//  Copyright © 2018 Fernando Barros. All rights reserved.
//

import UIKit

class SplashViewController: UIViewController {

    @IBOutlet weak var imageLogo: UIImageView!
    @IBOutlet weak var btnTravel: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        self.imageLogo.alpha = 0
        self.btnTravel.alpha = 0
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        UIView.animate(withDuration: 1, delay: 0, options: [], animations: {
            
            self.imageLogo.alpha = 1
            
        }, completion: nil)
        
        UIView.animate(withDuration: 2, delay: 0, options: [], animations: {
            
            self.btnTravel.alpha = 1
            self.btnTravel.center.y -= 30
            
        }, completion: nil)        
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
