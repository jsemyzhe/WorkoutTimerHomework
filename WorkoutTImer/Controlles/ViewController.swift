//
//  ViewController.swift
//  WorkoutTImer
//
//  Created by Julia Semyzhenko on 8/1/22.
//

import UIKit

class ViewController: UIViewController {
    
    
    @IBOutlet weak var newSet: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        newSet.layer.borderWidth = 0.4
        newSet.layer.cornerRadius = 3
    }
    
    @IBAction func newSetPressed(_ sender: UIButton) {
        var exerciseNameTextField: UITextField?
        var exerciseTimeTextField: UITextField?
        var restTimeTextField: UITextField?
        
        
        let alertController = UIAlertController(
            title: "New Set",
            message: "Make a new set",
            preferredStyle: .alert)
        
        let newSetAction = UIAlertAction(
            title: "Add", style: .default) {
                (action) -> Void in
                let exerciseName: String
                if exerciseNameTextField?.text == "" {
                    exerciseName = "New set"
                }
                else {
                    
                    exerciseName = exerciseNameTextField?.text ?? "New Set"
                }
                let exerciseTime = Int(exerciseTimeTextField?.text ?? "5") ?? 5
                let restTime = Int(restTimeTextField?.text ?? "5") ?? 5
                Base.shared.saveSet(name: exerciseName, exerciseTime: exerciseTime , restTime: restTime)
                guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "SetsViewController")
                        as? SetsViewController else { return }
                self.navigationController?.pushViewController(vc, animated: true)
                
            }
        
        let cancelAction = UIAlertAction(title: "Cancel" , style: .destructive){ (action) -> Void in
        }
        
        alertController.addTextField {
            (txtExerciseName) -> Void in
            exerciseNameTextField = txtExerciseName
            exerciseNameTextField!.placeholder = "Exercise name"
        }
        
        alertController.addTextField {
            (exerciseTime) -> Void in
            exerciseTimeTextField = exerciseTime
            exerciseTimeTextField?.placeholder = "Time for Exercise in seconds"
        }
        alertController.addTextField {
            (restTime) -> Void in
            restTimeTextField = restTime
            restTimeTextField?.placeholder = "Time for rest in seconds"
        }
        
        alertController.addAction(newSetAction)
        alertController.addAction(cancelAction)
        self.present(alertController, animated: true, completion: nil)
    }
}
