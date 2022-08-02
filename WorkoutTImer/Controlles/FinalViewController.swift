//
//  FinalViewController.swift
//  WorkoutTImer
//
//  Created by Julia Semyzhenko on 8/2/22.
//

import UIKit

class FinalViewController: UIViewController {
    @IBOutlet weak var goodJobLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        goodJobLabel.layer.borderWidth = 0.4
        goodJobLabel.layer.cornerRadius = 3
        
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "ViewController")
                    as? ViewController else { return }
            self.navigationController?.pushViewController(vc, animated: true)
        }
        
    }
    
}
