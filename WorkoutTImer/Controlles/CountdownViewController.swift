//
//  CountdownViewController.swift
//  WorkoutTImer
//
//  Created by Julia Semyzhenko on 8/2/22.
//

import UIKit
import KCCircularTimer


class CountdownViewController: UIViewController {
    
    var index = 0
    
    @IBOutlet weak var exerciseName: UILabel!
    @IBOutlet weak var timer: KCCircularTimer!
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewDidAppear(_ animated: Bool) {
        
        super.viewDidAppear(animated)
        if Base.shared.sets.count != 0  {
            self.timer.animate(from: Double(Base.shared.sets[index].exerciseTime), to: 0)
            exerciseName.text = Base.shared.sets[index].exersiceName
            
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.nextRest()
            }
        }
    }
    
    func nextRest() {
        if index < Base.shared.sets.count {
            self.timer.animate(from: Double(Base.shared.sets[index].restTime), to: 0)
            exerciseName.text = "Rest"
            index += 1
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                
                self.nextExercise()
            }
        }
    }
    
    func nextExercise(){
        
        if index == Base.shared.sets.count {
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.3) {
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "FinalViewController")
                        as? FinalViewController else { return }
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        
        if index < Base.shared.sets.count {
            self.timer.animate(from: Double(Base.shared.sets[index].exerciseTime), to: 0)
            exerciseName.text = Base.shared.sets[index].exersiceName
            DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
                self.nextRest()
            }
        }
    }
}

