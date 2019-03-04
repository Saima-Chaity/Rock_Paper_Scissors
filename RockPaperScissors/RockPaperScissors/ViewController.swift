//
//  ViewController.swift
//  RockPaperScissors
//
//  Created by MD Akbar on 2019-03-03.
//  Copyright © 2019 saimachaity. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

  @IBOutlet weak var imageView1: UIImageView!
  @IBOutlet weak var imageView2: UIImageView!
  @IBOutlet weak var p1Button: UIButton!
  @IBOutlet weak var p2Button: UIButton!
  @IBOutlet weak var p1ErrorLabel: UILabel!
  @IBOutlet weak var p2ErrorLabel: UILabel!
  @IBOutlet weak var winnerLabel: UILabel!
  
  let imageNames = ["paper", "rock", "scissors"]
  
  var randomImageName1 : String?
    var randomImageName2 : String?
  
  var p1Count : Int = 0
  var p2Count : Int = 0
  
  @IBAction func P1Button(_ sender: Any) {
    p1Count += 1
    randomImageName1 = imageNames.randomElement()
    
    if let imageName1 = randomImageName1{
      imageView1.image = UIImage(named: imageName1)
      
      if(p1Count == 1){
        p1ErrorLabel.text = "Please wait for Player 2!"
        p1Button.isEnabled = false
        determineWinner()
      }
    }
    p2Count = 0;
    p2Button.isEnabled = true;
    p2ErrorLabel.text = ""
  }

  @IBAction func P2Button(_ sender: Any) {
    p2Count += 1
    randomImageName2 = imageNames.randomElement()
    
    if let imageName2 = randomImageName2{
      imageView2.image = UIImage(named: imageName2)
      
      if(p2Count == 1){
        p2ErrorLabel.text = "Please wait for Player 1!"
        p2Button.isEnabled = false
        determineWinner()
      }
    }
    p1Count = 0;
    p1Button.isEnabled = true;
    p1ErrorLabel.text = ""
  }
  
  func determineWinner() {
    if(p1Count == 1 && p2Count == 1){
      if(randomImageName1 == "rock" && randomImageName2 == "scissors"){
        winnerLabel.text = "Player1 wins!"
        replay()
      }
      else if(randomImageName1 == "scissors" && randomImageName2 == "paper"){
        winnerLabel.text = "Player1 wins!"
        replay()
      }
      else if(randomImageName1 == "paper" && randomImageName2 == "rock"){
        winnerLabel.text = "Player1 wins!"
        replay()
      }
      else if(randomImageName2 == "rock" && randomImageName1 == "scissors"){
        winnerLabel.text = "Player2 wins!"
        replay()
      }
      else if(randomImageName2 == "scissors" && randomImageName1 == "paper"){
        winnerLabel.text = "Player2 wins!"
        replay()
      }
      else if(randomImageName2 == "paper" && randomImageName1 == "rock"){
        winnerLabel.text = "Player2 wins!"
        replay()
      }
      else{
        winnerLabel.text = ""
      }
    }
  }
  
  func replay(){
    p1Count = 0;
    p1Button.isEnabled = true;
    p1ErrorLabel.text = ""
    p2Count = 0;
    p2Button.isEnabled = true;
    p2ErrorLabel.text = ""
  }
  
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view, typically from a nib.
  }


}

