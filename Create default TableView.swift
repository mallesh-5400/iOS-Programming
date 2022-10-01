Steps to be followed before creating a tableView programmatically.

step1: Delete Main.Storyboard 
step2:  Deleting reference to it in the project's General settting . i.e Deployment Info > Main Interface > set no value
step3: Inside the AppDelegate put only the following code
    
import UIKit
@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
  var window: UIWindow?
  func application(
    _ application: UIApplication,
    didFinishLaunchingWithOptions launchOptions:[UIApplication.LaunchOptionsKey: Any]?
  ) -> Bool {
  // assign a new window. Here we get black screen if run the app so make it white inside the viewController.
  
  window = UIWIndow(frame: UIScreen.main.bounds)
  
  let viewController = ViewController()
  //Set rootViewController
  window?.rootViewController = viewController
  
  //make key and visible
  window?.makeKeyAndVisible()
  
  return true
  }

import UIKit
import Foundation

class ViewController: UIViewController {
let tableView = UITableView() 
let safeArea: UILayoutGuide!

let characters = ["Rama", "Shyama", "Bhama", " Lakshmana"]

override func viewDidLoad() {
super.viewDidLoad()
view.backgroundColor = .white   
safeArea = view.layoutMarginsGuide

tableView.dataSource = self

//Here we must register the cell which we want to add
tableView.register(UITableViewCell.self, forCellReuseIdentifier: "Cell")
setUpTableView()

}

func setUpTableView() {
view.addSubView(tableView)
tableView.translateAutoResizingMaskIntoConstraints = false

//Here top anchor is put to safeArea which is just below the topnotch 
tableView.topAnchor.constraints(equalTo: safeArea.topAnchor).isActive = true
tableView.bottomAnchor.constraints(equalTo: view.bottomAnchor).isActive = true
tableView.leadingAnchor.constraints(equalTo: view.leadingAnchor).isActive = true
tableView.trailingAnchor.constraints(equalTo: view.trailingAnchor).isActive = true

}
}
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return characters.count
  }
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath)
    cell.textLabel?.text = characters[indexPath.row]
    return cell
    
extension ViewController: UITableViewDataSource {

func tableView(_ tableView: UITableView , numberOfRowsInSection section: Int) -> Int {
return characters.count 
}

func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
let cell = tableView.dequeReusableCell(withIdentifier: "cell", for: indexPath)
cell.textLabel?.text = characters[indexPath.row]
return cell
}
}

OutPut: It wil display tableview with 4 rows naming  ["Rama", "Shyama", "Bhama", " Lakshmana"]
