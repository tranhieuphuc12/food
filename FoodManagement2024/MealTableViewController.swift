//
//  MealTableViewController.swift
//  FoodManagement2024
//
//  Created by DaiTran on 4/5/24.
//

import UIKit

class MealTableViewController: UITableViewController {
    //MARK: Properties
    
    private var meals:[Meal] = []
    private let mealDetailStoryBoardId = "MealDetail"
    @IBOutlet weak var navigation: UINavigationItem!
    private var navigationType: NavigationType = .newMeal
    private var selectedIndexPath: IndexPath?
    
    
    enum NavigationType {
        case newMeal
        case editMeal
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //add edit btn for navigation bar
        navigation.leftBarButtonItem = editButtonItem
        
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    
    @IBAction func newMeal(_ sender: UIBarButtonItem) {
        if let detailController = self.storyboard!.instantiateViewController(withIdentifier: mealDetailStoryBoardId) as? MealDetailController{
            
            navigationType = .newMeal
            
            //Display meal detail controller
            present(detailController, animated: true)
        }
    }
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return meals.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let reuseCell = "MealCell"
        
        if let cell = tableView.dequeueReusableCell(withIdentifier: reuseCell, for: indexPath) as? MealCell{
            
            //Lay phan tu thu i trong mang
            let meal = meals[indexPath.row]
            cell.mealName.text = meal.name
            cell.mealImage.image = meal.image
            cell.mealRating.ratingValue = meal.rating
            
           
            //Bo sung cho bat su kien cho cell theo cach 1
            if cell.onTap == nil {
                cell.onTap = UITapGestureRecognizer()
                cell.onTap!.addTarget(self, action: #selector(editMeal))
                cell.addGestureRecognizer(cell.onTap!)
            }
            
            
            return cell
        }
                
        // Configure the cell...

        fatalError("khong the tao cell")
    }
    @objc private func editMeal(_ sender:UITapGestureRecognizer){
        if let detailController = self.storyboard!.instantiateViewController(withIdentifier: mealDetailStoryBoardId) as? MealDetailController{
                
            navigationType = .editMeal
            //định vị đối tượng cell dc tap và
            //lấy vị trí của cell trong table view
            if let cell = sender.view as? MealCell, let indexPath = tableView.indexPath(for: cell) {
                selectedIndexPath = indexPath
                detailController.meal = meals[indexPath.row]
                //Display meal detail controller
                present(detailController, animated: true)
            }
           
            
        }
    }
    
    @IBAction func unwindFromMealDetail(_ segue:UIStoryboardSegue) {
//        print("UNWIND")
        if let mealDetailController = segue.source as? MealDetailController, let meal = mealDetailController.meal{
            switch navigationType {
            case .newMeal:
                meals.append(meal)
                
                let newIndexPath = IndexPath(row: meals.count - 1, section: 0)
                tableView.insertRows(at: [newIndexPath], with: .top)
                break
            case .editMeal:
                
                if let selectedIndexPath = selectedIndexPath {
                    meals[selectedIndexPath.row] = meal
                    tableView.reloadRows(at: [selectedIndexPath], with: .left)
                }
                
                break
            }
          
        }
    }
    
    
    
    /*
    // Override to support conditional editing of the table view.
    override func tableView(_ tableView: UITableView, canEditRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the specified item to be editable.
        return true
    }
    */

    
    // Override to support editing the table view.
    override func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
        if editingStyle == .delete {
            //delete meal in datasource
            meals.remove(at: indexPath.row)
            // Delete the row from the data source
            tableView.deleteRows(at: [indexPath], with: .fade)
            
        } else if editingStyle == .insert {
            // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
        }    
    }
    

    /*
    // Override to support rearranging the table view.
    override func tableView(_ tableView: UITableView, moveRowAt fromIndexPath: IndexPath, to: IndexPath) {

    }
    */

    /*
    // Override to support conditional rearranging of the table view.
    override func tableView(_ tableView: UITableView, canMoveRowAt indexPath: IndexPath) -> Bool {
        // Return false if you do not want the item to be re-orderable.
        return true
    }
    */

    
    // MARK: - Navigation
/*
    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //Cach 2
        if let detailController = segue.destination as? MealDetailController{
            if let indexPath = tableView.indexPathForSelectedRow{
                navigationType = .editMeal
                selectedIndexPath = indexPath
                detailController.meal = meals[indexPath.row]
               
            }
        }
        /*
    //định vị đối tượng cell dc tap và
    //lấy vị trí của cell trong table view
        if let detailController = segue.destination as? MealDetailController,let cell = sender as? MealCell, let indexPath = tableView.indexPath(for: cell) {
         navigationType = .editMeal
         selectedIndexPath = indexPath
         detailController.meal = meals[indexPath.row]
        //Display meal detail controller
        
    }
   
    */
      
    }
    */

}
