//
//  ViewController.swift
//  PingPongCounter
//
//  Created by Francesco Laiti on 26/01/2019.
//  Copyright © 2019 francescolaiti. All rights reserved.
//

import UIKit


var numero = 0
var cambiopalla = 0

var giocatore1 = ""
var giocatore2 = ""

class ViewController: UIViewController {

    @IBOutlet var segmento: UISegmentedControl!
    @IBOutlet var cambioPalla: UISegmentedControl!
    
    @IBOutlet var contenutoBlu: UITextField!
    @IBOutlet var contenutoRosso: UITextField!
    
    @IBOutlet var inizioPartita: UIButton!
    
    

//    var sforato = false

    
    //speechUtterance.voice = AVSpeechSynthesisVoice(language: "it-IT")
    
    override var preferredStatusBarStyle: UIStatusBarStyle {
        return .lightContent
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
        contenutoBlu.text = giocatore1
        contenutoRosso.text = giocatore2
        
//        self.contenutoRosso.delegate = self
//        self.contenutoBlu.delegate = self
    }
    
    @IBAction func inizio(_ sender: Any) {
        if segmento.selectedSegmentIndex == 0{
            numero = 11
        }
        if segmento.selectedSegmentIndex == 1{
            numero = 21
        }
        
        if cambioPalla.selectedSegmentIndex == 0{
            cambiopalla = 2
        }
        if cambioPalla.selectedSegmentIndex == 1{
            cambiopalla = 5
        }
        
        giocatore2 = contenutoRosso.text ?? "Rosso"
        giocatore1 = contenutoBlu.text ?? "Blu"
    }
    
    private func textFieldShouldReturn(textField: UITextField) -> Bool {
        textField.resignFirstResponder()
        return true
    }
    
    
}

