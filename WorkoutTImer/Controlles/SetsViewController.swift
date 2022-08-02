//
//  SetsViewController.swift
//  WorkoutTImer
//
//  Created by Julia Semyzhenko on 8/2/22.
//

import UIKit

class SetsViewController: UIViewController  {
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var start: UIButton!
    
    @IBOutlet weak var clean: UIButton!
    @IBOutlet weak var addMore: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        
        clean.layer.borderWidth = 0.4
        clean.layer.cornerRadius = 3
        start.layer.borderWidth = 0.4
        addMore.layer.borderWidth = 0.4
        start.layer.cornerRadius = 46.5
        addMore.layer.cornerRadius = 46.5
    }
    @IBAction func cleanTablePressed(_ sender: UIButton) {
        Base.shared.sets = []
        tableView.reloadData()
    }
    @IBAction func startPressed(_ sender: UIButton) {
        guard let vc = self.storyboard?.instantiateViewController(withIdentifier: "CountdownViewController")
                as? CountdownViewController else { return }
        self.navigationController?.pushViewController(vc, animated: true)
        
    }
    
    @IBAction func addMore(_ sender: UIButton) {
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
                self.tableView.reloadData()
                
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

extension SetsViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        Base.shared.sets.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TableViewCell", for: indexPath) as? TableViewCell
        cell?.exerciseTime.text =  "\(Base.shared.sets[indexPath.row].exerciseTime)"
        cell?.restTime.text =  "\(Base.shared.sets[indexPath.row].restTime)"
        cell?.setName.text =  Base.shared.sets[indexPath.row].exersiceName
        return cell ?? TableViewCell()
    }
    
    
}
