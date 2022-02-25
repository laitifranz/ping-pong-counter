//
//  InGameController.swift
//  PingPongCounter
//
//  Created by Francesco Laiti on 02/02/2019.
//  Copyright © 2019 francescolaiti. All rights reserved.
//

import UIKit
import AVFoundation
import AVKit

class InGameController: UIViewController {

    @IBOutlet var TopBtn: UIButton!
    @IBOutlet var DownBtn: UIButton!
    
    @IBOutlet var TestoTop: UILabel!
    @IBOutlet var TestoDown: UILabel!
    
    @IBOutlet var restart: UIButton!
    
    var speechSynthesizer = AVSpeechSynthesizer()
    
    let synth = AVSpeechSynthesizer()
    var myUtterance = AVSpeechUtterance(string: "")
    let generator = UIImpactFeedbackGenerator(style: .light)
    
    var counter = 0
    var somma = 0
    
    var scoreTop = 0
    var scoreDown = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        scoreTop = 0
        scoreDown = 0
        
        TestoTop.text = "\(scoreTop)"
        TestoDown.text = "\(scoreDown)"
        
        TestoTop.transform = CGAffineTransform(rotationAngle: 3.14)
        
        let audioSession = AVAudioSession.sharedInstance()
        try! audioSession.setCategory(AVAudioSession.Category.ambient, mode: .default)

    }
    
    @IBAction func TopAction(_ sender: Any) {
        scoreTop += 1
        //        generator.impactOccurred()
        
        controlla(num: numero)
    }
    
    @IBAction func DownBtn(_ sender: Any) {
        scoreDown += 1
        //        generator.impactOccurred()
        
        controlla(num: numero)
    }
    
    @IBAction func restartCounter(_ sender: Any) {
        resetta()
    }
    

    
    func resetta(){
        somma = 0
        scoreDown = 0
        scoreTop = 0
        counter = 0
        
        TestoTop.text = "\(scoreTop)"
        TestoDown.text = "\(scoreDown)"
        
        synth.stopSpeaking(at: .immediate)
    }
    
    func controlla(num: Int){

        view.endEditing(true)
        somma = counter + num
        
        TestoTop.text = "\(scoreTop)"
        TestoDown.text = "\(scoreDown)"
        
        if (scoreDown == somma-1 && scoreTop == somma-1){
            myUtterance = AVSpeechUtterance(string: "\(scoreTop) a \(scoreDown), si va a \(somma+1), cambio palla")
            
            
            //sforato = true
            counter += 1
        }
        else if (scoreDown == somma-1 || scoreTop == somma-1){
            if(scoreDown == somma-1){
                myUtterance = AVSpeechUtterance(string: "Punto decisivo per \(giocatore2), siete \(scoreTop) a \(scoreDown)")
            }
            else {
                myUtterance = AVSpeechUtterance(string: "Punto decisivo per \(giocatore1), siete \(scoreTop) a \(scoreDown)")
            }
        }
            
        else if (scoreDown == somma){
            myUtterance = AVSpeechUtterance(string: "Vittoria di \(giocatore2)")
            //                myUtterance.rate = 0.5
            
            createAlert(title: "Fine", message: "Vittoria di \(giocatore2)")
        }
        else if (scoreTop == somma){
            myUtterance = AVSpeechUtterance(string: "Vittoria di \(giocatore1)")
            //                myUtterance.rate = 0.5
            
            createAlert(title: "Fine", message: "Vittoria di \(giocatore1)")
        }
        else{
            if (scoreTop+scoreDown)%cambiopalla == 0{
                if (scoreTop == scoreDown){
                    myUtterance = AVSpeechUtterance(string: "\(scoreTop) pari, cambio palla")
                }
                else{
                    myUtterance = AVSpeechUtterance(string: "\(scoreTop) a \(scoreDown), Cambio palla")
                }
            }
            else {
                if (scoreTop == scoreDown){
                    myUtterance = AVSpeechUtterance(string: "\(scoreTop) pari")
                }
                else{
                    myUtterance = AVSpeechUtterance(string: "\(scoreTop) a \(scoreDown)")
                }
                
            }
        }
        
        myUtterance.rate = 0.5
        myUtterance.voice = AVSpeechSynthesisVoice(language: "it-IT")
        synth.speak(myUtterance)
    }
    
    
    func createAlert(title:String, message:String){
        
        let alert = UIAlertController(title: title, message: message, preferredStyle: UIAlertController.Style.alert)
        
        //alert.addAction(UIAlertAction(title: NSLocalizedString("open_set", comment: "open set"), style: UIAlertAction.Style.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)
        //}))
        alert.addAction(UIAlertAction(title: "Chiudi", style: UIAlertAction.Style.default, handler: {(action) in alert.dismiss(animated: true, completion: nil)}))
        
        self.present(alert, animated: true, completion: nil)
        resetta()
    }
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
