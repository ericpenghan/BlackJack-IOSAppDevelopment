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
  var numofAforD = 0
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
  
 
  //all connecting
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
  @IBOutlet weak var ChooseBetMessage: UILabel!
  @IBOutlet weak var finishbetting: UIButton!
  


  
  
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
    
   // count = count + 1
    dealTapped(sender)
    //count = 0
    Stand(sender)
    //make sure win is stay hiddem
    if(self.printlose.isHidden == false){
      self.printwin.isHidden = true
      self.lostcardv.isHidden = true
    }
    //  print(dealer1hand)//testing
  }

  
  
  @IBAction func startbutton(_ sender: Any){
    //first reset everything
     numofAforD =  0//reset
    countD = 0//reset coutd to 0
    user1hand = 0//reset userhand
    amountbetput = 0//reset the amount bet put every time hit start
    numofA = 0
    
    
    
   dealercountingvalue()//dealer get 2 cards
  countingvalue()//user get two card and calculate the value at hand
  startHide()//hide everthing
  
    //display intial everytime it resets
    self.ChooseBetMessage.isHidden = false
    self.finishbetting.isHidden = false
    
  
    
    
    //reset if money go under 500
    if(playerTotal <= 0){
        playerTotal = 500
      playerscore.text = String(playerTotal)
    }


  

    
    
    startcount = startcount + 3
    if (startcount % 3 == 0){//it's been cliked again
       dealerBack.image = UIImage(named: "card\(0)")//create an object，show card 2
    }
    
  }
  
  //dealer gets the first two cards, called first when click start button
  func dealercountingvalue() -> Void{//couting and adding 2 cards value
    
 //  let leftnum = Int.random(in: 2...14)//need to go back
    let leftnum = 14
    if leftnum == 11 || leftnum == 12 || leftnum == 13{//if cards r j,q,k assign them to 10
      dealer1hand = 10
    }
    else if leftnum == 14{
      dealer1hand = 11//it has to be 11
      numofAforD =  numofAforD + 1//increment one ace
    }
    else{
      dealer1hand = leftnum;
    }
    
    
   let rightnum = Int.random(in: 2...14)

  
    
    if rightnum == 11 || rightnum == 12 || rightnum == 13{//if cards r j,q,k assign them to 10
      dealer1hand = dealer1hand + 10
    }
    else if rightnum == 14{
        dealer1hand = dealer1hand + 1 //if get another A, then treeat it as 1
         numofAforD =  numofAforD + 1//increment one ace
      }
    else{
      dealer1hand = dealer1hand + rightnum
    }
    
  
    
    Dealer2.image = UIImage(named: "card\(rightnum)")//create an object，show card 2
//    print(dleftnum)
    dleftnum = leftnum//set equal to global variable
  
  }
  
  //players get 2 cards, get called first
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
  
  //hide things when user click hide, hdie function does different things
  func startHide() -> Void{
    //hide intial cards first, and player options
      self.Dealer1.isHidden = true
      self.Dealer2.isHidden = true
      self.leftimageviewer.isHidden = true
      self.rightimageview.isHidden = true
    self.dealerBack.isHidden = true

    hitting.isHidden = true
    Standing.isHidden = true
    doubleDown.isHidden = true
    
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
    
 
  }
  
  //when bet placed
  func betplacedHide() -> Void{
      //hide bet message, then reveil the cards
      self.ChooseBetMessage.isHidden = true
         self.dealerBack.isHidden = false
      self.Dealer1.isHidden = false
      self.Dealer2.isHidden = false
      self.leftimageviewer.isHidden = false
      self.rightimageview.isHidden = false
      hitting.isHidden = false
      Standing.isHidden = false
      doubleDown.isHidden = false
    
  }
  
  
  
  func Dealercontinuevalue(x: Int) -> Void{//dealer couting and adding value once click hit
    
    let rightnum = Int.random(in: 2...14)
    //   generate random num

    if rightnum == 11 || rightnum == 12 || rightnum == 13{//if cards r j,q,k assign them to 10
      dealer1hand = dealer1hand + 10
      if dealer1hand > 21{
        if(numofAforD == 1){
          dealer1hand = dealer1hand - 10 //treat one ace as one
          numofAforD = 0//reset
      
        }
        else if(numofAforD == 2){
          dealer1hand = dealer1hand - 20//treat ace as one
           numofAforD = 0//reset
        }
        else if(numofAforD == 3){
          dealer1hand = dealer1hand - 30//treat ace as one
           numofAforD = 0//reset
        }
        else{
        self.printwin.isHidden = false //print lose
        //sorry you are busted
        }
      }
    }
    else if rightnum == 14{
      
      dealer1hand = dealer1hand + 1 //if get another A, then treeat it as 1
      if dealer1hand > 21{
        
        if(numofAforD == 1){
          dealer1hand = dealer1hand - 10 //treat one ace as one
           numofAforD = 0//reset
        }
        else if(numofAforD == 2){
          dealer1hand = dealer1hand - 20 //
           numofAforD = 0//reset
        }
        else if(numofAforD == 3){
          dealer1hand = dealer1hand - 30//treat ace as one
           numofAforD = 0//reset
        }
        else{
          self.printwin.isHidden = false //print lose
          //sorry you are busted
        }
      }
    }
    else{
      dealer1hand = dealer1hand + rightnum
      if dealer1hand > 21{
        if(numofAforD == 1){
          dealer1hand = dealer1hand - 10 //treat one ace as one
           numofAforD = 0//reset
        }
        else if(numofAforD == 2){
          dealer1hand = dealer1hand - 20
           numofAforD = 0//reset
        }
        else if(numofAforD == 3){
          dealer1hand = dealer1hand - 30//treat ace as one
           numofAforD = 0//reset
        }
        else{
          self.printwin.isHidden = false //print lose
          //sorry you are busted
        }
      }
    }
    
    if(x == 1){
      Dealer3.image = UIImage(named: "card\(rightnum)")//create an object
    }
    else if(x == 2){
      Dealer4.image = UIImage(named: "card\(rightnum)")//create an object
    }
    else if(x == 3){
      Dealer5.image = UIImage(named: "card\(rightnum)")//create an object
    }
    else if(x == 4){
      Dealer6.image = UIImage(named: "card\(rightnum)")//create an object
    }
    else if(x == 5){
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
    
  

    while (dealer1hand < 17){
      countD = countD + 1
    //  print(countD)
      //run continuedealer
      if(countD == 1){
        //player3 is unhidden
        self.Dealer3.isHidden = false
        Dealercontinuevalue(x: countD)
      }
      else if(countD == 2){
        //player4 is unhidden
        self.Dealer4.isHidden = false
        Dealercontinuevalue(x: countD)
      }
      else if(countD == 3){
        //player5 is unhidden
       self.Dealer5.isHidden = false
      Dealercontinuevalue(x: countD)
        
      }
      else if(countD == 4){
        //player6 is unhidden
        self.Dealer6.isHidden = false
        Dealercontinuevalue(x: countD)
        
      }
      else if(countD == 5){
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
        self.printtie.isHidden = false//print it's a tie
      playerTotal = playerTotal + amountbetput//get you put in back

    }
  }
  
  @IBAction func finishbetClicked(_ sender: Any) {
    //call hide intial fucntion
    betplacedHide()
    self.dis25.isHidden = true
    self.dis50.isHidden = true
    self.dis100.isHidden = true
    finishbetting.isHidden = true//hide the button at the end
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


