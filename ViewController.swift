//
//  ViewController.swift
//  warcard
//
//  Created by Eric Han on 9/4/19.
//  Copyright © 2019 Eric Han. All rights reserved.
//

import UIKit//use the libiary



class ViewController: UIViewController {
  
  var leftscore = 500//set intial money to 500
  var user1hand = 0//starting hand value set to 0
  var count = 0//set count to 0
  var countD = 0//set count to 0
  var numofA = 0//set to 0
   var dealer1hand = 0//starting hand value set to 0
var dleftnum = 0
  var startcount = 0//set to 0
  
  var playerTotal = 500
  var amountbetput = 0
//  var lef = 0
//  var lef2 = 0
//  var cef = 0
//  var cef2 = 0
//  var total = 500
  
 
  
  @IBOutlet weak var leftimageviewer: UIImageView!
  @IBOutlet weak var rightimageview: UIImageView!
  @IBOutlet weak var hitting: UIButton!
  @IBOutlet weak var Standing: UIButton!
  @IBOutlet weak var doubleDown: UIButton!
  @IBOutlet weak var dealerBack: UIImageView!
  @IBOutlet weak var Dealer1: UIImageView!
  @IBOutlet weak var Dealer2: UIImageView!
  @IBOutlet weak var Dealer3: UIImageView!
  @IBOutlet weak var Dealer4: UIImageView!
  @IBOutlet weak var Dealer5: UIImageView!
  @IBOutlet weak var Dealer6: UIImageView!
  @IBOutlet weak var Dealer7: UIImageView!
  @IBOutlet weak var Dealer8: UIImageView!
  @IBOutlet weak var Player3: UIImageView!
  @IBOutlet weak var Player4: UIImageView!
  @IBOutlet weak var Player5: UIImageView!
  @IBOutlet weak var Player6: UIImageView!
  @IBOutlet weak var Player7: UIImageView!
  @IBOutlet weak var Player8: UIImageView!
  @IBOutlet weak var printlose: UILabel!
  @IBOutlet weak var printwin: UILabel!
  @IBOutlet weak var printtie: UILabel!
  @IBOutlet weak var lostcardv: UILabel!
  @IBOutlet weak var dis25: UIButton!
  @IBOutlet weak var dis50: UIButton!
  @IBOutlet weak var dis100: UIButton!
  @IBOutlet weak var dealerscore: UILabel!
  @IBOutlet weak var playerscore: UILabel!
  


  
 
  

  
  
 
  


  
  
  override func viewDidLoad() {
    super.viewDidLoad()
  // Do any additional setup after loading the view.
    let Tap:UITapGestureRecognizer = UITapGestureRecognizer(target: self , action: #selector(DismissKeyboard))//hide the keyboard when tapping
    view.addGestureRecognizer(Tap)//hide the keyboard when tapping
 
  }
  
  @objc func DismissKeyboard(){//hide the keyboard when tapping
    view.endEditing(true)
  }
  

  @IBAction func bet25(_ sender: Any) {//when click 25
    playerTotal = playerTotal - 25
    playerscore.text = String(playerTotal)
    amountbetput = amountbetput + 25
    if(playerTotal <= 0){
      //print you are lost
      self.dis25.isHidden = true
      self.dis50.isHidden = true
      self.dis100.isHidden = true
      self.lostcardv.isHidden = false//print you are lost
    
    }
    
    
  }
  
  
  @IBAction func bet50(_ sender: Any) {//when click 50
    playerTotal = playerTotal - 50
    playerscore.text = String(playerTotal)
    amountbetput = amountbetput + 50
    if(playerTotal <= 0){
      //print you are lost
      self.dis25.isHidden = true
      self.dis50.isHidden = true
      self.dis100.isHidden = true
      self.lostcardv.isHidden = false//print you are lost
    
    }
  }

  @IBAction func bet100(_ sender: Any) {//when click 100
    playerTotal = playerTotal - 100
    playerscore.text = String(playerTotal)
    amountbetput = amountbetput + 100
    if(playerTotal <= 0){
      //print you are lost
      self.dis25.isHidden = true
      self.dis50.isHidden = true
      self.dis100.isHidden = true
      self.lostcardv.isHidden = false//print you are lost
     
    }
    
  }
  
  @IBAction func double(_ sender: Any) {
     playerTotal = playerTotal - amountbetput//set money after doubling bet
   amountbetput = amountbetput + amountbetput//double the amount bet
    
   
    playerscore.text = String(playerTotal)//display new num after double

    
    
  }

  
  
  @IBAction func startbutton(_ sender: Any){
    user1hand = 0//reset userhand
    amountbetput = 0//reset the amount bet put every time hit start
    numofA = 0
   dealercountingvalue()//dealer get 2 cards
  countingvalue()//user get two card and calculate the value at hand
        self.Dealer3.isHidden = true
         self.Dealer4.isHidden = true
        self.Dealer5.isHidden = true
        self.Dealer6.isHidden = true
        self.Dealer7.isHidden = true
        self.Dealer8.isHidden = true
    self.Player3.isHidden = true
    self.Player4.isHidden = true
     self.Player5.isHidden = true
     self.Player6.isHidden = true
     self.Player7.isHidden = true
     self.Player8.isHidden = true
     self.printwin.isHidden = true
     self.printlose.isHidden = true
    self.printtie.isHidden = true
    self.lostcardv.isHidden = true
    self.dealerscore.isHidden = true
    self.dis25.isHidden = false//unhidden
    self.dis50.isHidden = false//unhidden
    self.dis100.isHidden = false//unhidden
    
    if(playerTotal <= 0){
        playerTotal = 500//reset
    }else{

      //do nothing
    }

  

    
    
    startcount = startcount + 3
    if (startcount % 3 == 0){//it's been cliked again
       dealerBack.image = UIImage(named: "card\(0)")//create an object，show card 2
    }
    
  }
  
  func dealercountingvalue() -> Void{//couting and adding 2 cards value
    
    let leftnum = Int.random(in: 2...14)//need to go back
 
    if leftnum == 11 || leftnum == 12 || leftnum == 13{//if cards r j,q,k assign them to 10
      dealer1hand = 10
    }
    else if leftnum == 14{
      dealer1hand = 11//it has to be 11
    }
    else{
      dealer1hand = leftnum;
    }
    
    
    let rightnum = Int.random(in: 2...14)
   
    
    if rightnum == 11 || rightnum == 12 || rightnum == 13{//if cards r j,q,k assign them to 10
      dealer1hand = dealer1hand + 10
    }
    else if rightnum == 14{
      if leftnum <= 10{
        dealer1hand = dealer1hand + 11 //if user left card is slower or equal to 10, then treeat rightcard as 11
      }
      else {
        dealer1hand = dealer1hand + 1 //if get another A, then treeat it as 1
      }
    }
    else{
      dealer1hand = dealer1hand + rightnum
    }
    
  
    
    Dealer2.image = UIImage(named: "card\(rightnum)")//create an object，show card 2
//    print(dleftnum)
    dleftnum = leftnum//set equal to global variable
  
  }
  
  func countingvalue() -> Void{//couting and adding 2 cards value

    let leftnum = Int.random(in: 2...14)
    
    if leftnum == 11 || leftnum == 12 || leftnum == 13{//if cards r j,q,k assign them to 10
      user1hand = 10
    }
    else if leftnum == 14{
      user1hand = 1//assume it will be 1
      numofA = numofA + 1//encoument
    }
    else{
      user1hand = leftnum;
    }

   

    let rightnum = Int.random(in: 2...14)
   
    //    print(rightnum)
    if rightnum == 11 || rightnum == 12 || rightnum == 13{//if cards r j,q,k assign them to 10
      user1hand = user1hand + 10
    }
    else if rightnum == 14{
     
      user1hand = user1hand + 1 //if get another A, then treeat it as 1
      numofA = numofA + 1
    }
    else{
      user1hand = user1hand + rightnum
    }

    leftimageviewer.image = UIImage(named: "card\(leftnum)")//create an object
    rightimageview.image = UIImage(named: "card\(rightnum)")//create an object



  }
  
  

  
  
  
  func Dealercontinuevalue(x: Int) -> Void{//dealer couting and adding value once click hit
    
    let rightnum = Int.random(in: 2...14)
    //   generate random num
    
    if rightnum == 11 || rightnum == 12 || rightnum == 13{//if cards r j,q,k assign them to 10
      dealer1hand = dealer1hand + 10
      if dealer1hand > 21{
        self.printwin.isHidden = false //print lose
        //sorry you are busted
      }
    }
    else if rightnum == 14{
      
      dealer1hand = dealer1hand + 1 //if get another A, then treeat it as 1
      if dealer1hand > 21{
        
        self.printwin.isHidden = false //print lose
        //you win, dealer busted
      }
    }
    else{
      dealer1hand = dealer1hand + rightnum
      if dealer1hand > 21{
        self.printwin.isHidden = false //print lose
        //you win, dealer busted
      }
    }
    
    if(count == 1){
      Dealer3.image = UIImage(named: "card\(rightnum)")//create an object
    }
    else if(count == 2){
      Dealer4.image = UIImage(named: "card\(rightnum)")//create an object
    }
    else if(count == 3){
      Dealer5.image = UIImage(named: "card\(rightnum)")//create an object
    }
    else if(count == 4){
      Dealer6.image = UIImage(named: "card\(rightnum)")//create an object
    }
    else if(count == 4){
      Dealer7.image = UIImage(named: "card\(rightnum)")//create an object
    }
    else{
      Dealer8.image = UIImage(named: "card\(rightnum)")//create an object
    }
  }
 
  
  
  
  func playercontinuevalue(x: Int) -> Void{//couting and adding value once click hit
   
    let rightnum = Int.random(in: 2...14)
    //   generate random num

    if rightnum == 11 || rightnum == 12 || rightnum == 13{//if cards r j,q,k assign them to 10
      user1hand = user1hand + 10
      if user1hand > 21{
        self.printlose.isHidden = false //print lose
        //sorry you are busted
      }
    }
    else if rightnum == 14{
      numofA = numofA + 1//increment
    
        user1hand = user1hand + 1 //if get another A, then treeat it as 1
        if user1hand > 21{
    
          self.printlose.isHidden = false //print lose
          //sorry you are busted
        }
      }
    else{
      user1hand = user1hand + rightnum
      if user1hand > 21{
        self.printlose.isHidden = false //print lose
        //sorry you are busted
      }
    }
    
    if(count == 1){
    Player3.image = UIImage(named: "card\(rightnum)")//create an object
    }
    else if(count == 2){
      Player4.image = UIImage(named: "card\(rightnum)")//create an object
    }
    else if(count == 3){
      Player5.image = UIImage(named: "card\(rightnum)")//create an object
    }
    else if(count == 4){
      Player6.image = UIImage(named: "card\(rightnum)")//create an object
    }
    else if(count == 4){
      Player7.image = UIImage(named: "card\(rightnum)")//create an object
    }
    else{
      Player8.image = UIImage(named: "card\(rightnum)")//create an object
    }
  }
  
  @IBAction func Stand(_ sender: Any) {
    //stand
//    countD = countD + 1
    self.dis25.isHidden = true
    self.dis50.isHidden = true
    self.dis100.isHidden = true
    
   
    while dealer1hand < 17{
      countD = countD + 1
      
      //run continuedealer
      if(count == 1){
        //player3 is unhidden
        self.Dealer3.isHidden = false
        Dealercontinuevalue(x: countD)
      }
      else if(count == 2){
        //player4 is unhidden
        self.Dealer4.isHidden = false
        Dealercontinuevalue(x: countD)
      }
      else if(count == 3){
        //player5 is unhidden
       self.Dealer5.isHidden = false
      Dealercontinuevalue(x: countD)
        
      }
      else if(count == 4){
        //player6 is unhidden
        self.Dealer6.isHidden = false
        Dealercontinuevalue(x: countD)
        
      }
      else if(count == 5){
        //player7 is unhidden
       self.Dealer7.isHidden = false
        Dealercontinuevalue(x: countD)
        
      }
      else {
        //player8 is unhidden
        self.Dealer8.isHidden = false
        Dealercontinuevalue(x: countD)
        
      }
    }
    //after while loop display the value of th hidden card
   
    dealerBack.image = UIImage(named: "card\(dleftnum)")//create an object，show card 2
    
    
    if(self.printwin.isHidden == false){
      //do the same as winning
      playerTotal = playerTotal + amountbetput + amountbetput//intial + intial amount bet put + wining
      
      playerscore.text = String(playerTotal)//display new num
    }
    else if(self.printlose.isHidden == false){
      //do nothing
    }
    else if(self.lostcardv.isHidden == false){
      //do nothing
    }
    else{
    //now need to compare the hands of dealer and player
    if(numofA == 0){
      compare()//call compare function
    }
    else if(numofA == 1){
      user1hand = user1hand + 10//make it 11
      if user1hand <= 21{
        compare()//safe to call compare
      }
      else{
        user1hand = user1hand - 10//go back to where it was before
        compare()//then it will be safe to call
      }
    }
    else if(numofA == 2){
      user1hand = user1hand + 20//make it 11
      if user1hand <= 21{
        compare()//safe to call compare
      }
      else{
        user1hand = user1hand - 20//go back to where it was before
        compare()//then it will be safe to call
      }
    }
    else{
      compare()//safe to call
    }
    }
    
  }
  
  func compare() -> Void{
    if(dealer1hand > user1hand && dealer1hand != user1hand && dealer1hand <= 21){
      self.lostcardv.isHidden = false //print lose
     //money doesn't change
    }
    else if(dealer1hand < user1hand && dealer1hand != user1hand){
     
      self.printwin.isHidden = false //print win
      playerTotal = playerTotal + amountbetput + amountbetput//intial + intial amount bet put + wining

      playerscore.text = String(playerTotal)//display new num

    }
    else {
      //it's a tie
      playerTotal = playerTotal + amountbetput//get you put in back

    }
  }
  

  @IBAction func dealTapped(_ sender: Any) {
    //hitting finished
    
//    print(numofA)
        self.dis25.isHidden = true
        self.dis50.isHidden = true
        self.dis100.isHidden = true
    count = count + 1
//    print(count)
    if(count == 1){
      //player3 is unhidden
      self.Player3.isHidden = false
      playercontinuevalue(x: count)//call function
    }
    else if(count == 2){
      //player4 is unhidden
      self.Player4.isHidden = false
      playercontinuevalue(x: count)//call function
    }
    else if(count == 3){
      //player5 is unhidden
      self.Player5.isHidden = false
      playercontinuevalue(x: count)//call function

    }
    else if(count == 4){
      //player6 is unhidden
      self.Player6.isHidden = false
      playercontinuevalue(x: count)//call function

    }
    else if(count == 5){
      //player7 is unhidden
      self.Player7.isHidden = false
      playercontinuevalue(x: count)//call function

    }
    else {
      //player8 is unhidden
      self.Player8.isHidden = false
      playercontinuevalue(x: count)//call function

    }
    
  }
  
}

