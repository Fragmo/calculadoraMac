//
//  ViewController.swift
//  Calculadora
//
//  Created by CETYS on 26/09/17.
//  Copyright © 2017 CETYS. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var pantalla: UILabel!
    
    @IBOutlet var miniPantalla: UILabel!
    
    
    
    
    
    var elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero : Bool = false;
    // variable de instancia, se lee desde toda la clase
    var operando1: Double = 0;
    var operando2: Double = 0
    var operacion: String = "";
    
    
    @IBAction func enterPulsado() {
        let numero : NSString = pantalla.text! as NSString
        operando2 = numero.doubleValue
        
        let resultado = realizaOperacion()
        pantalla.text = String(format: "%g", resultado)
    }
    
    @IBAction func operacionPulsada(_ sender: UIButton) {
        
        let numero : NSString = pantalla.text! as NSString
        operando1 = numero.doubleValue
        
        //guardo la operacion pulsada
        operacion = sender.currentTitle!
        miniPantalla.text = pantalla.text
            //pongo un 0 en la plantalla para escribir el 2º operando
        pantalla.text = "0";
        elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero = false
        
        
    }
    
    @IBAction func NumeroPulsado(_ sender: UIButton) {
        // var: variable
        // let: constante
        
        
       // var: variable : tipo  ej: String
        
        let digito : String! = sender.currentTitle; // digito es una variable que almacena lo que hay escrito en el ultimo boton pulsado
        
        if elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero{
            pantalla.text = pantalla.text! + digito;
        }else{
            pantalla.text = digito;
            elUsuarioEstaEnMedioDeLaEscrituraDeUnNumero = true;
        }
        
       print(digito);// manda a pantalla el texto
        //print(digito);// printa por pantalla el string digito
        
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func realizaOperacion() -> Double{  // la flecha significa que devuelve algo y el double es el dato que devuelve
        var resultado : Double = 0;
        
        //codigo de la suma
        if operacion == "+"{
            resultado = operando1 + operando2
        }
        if operacion == "-"{
            resultado = operando1 - operando2
        }
        if operacion == "*"{
            resultado = operando1 * operando2
        }
        if operacion == "/"{
            resultado = operando1 / operando2
        }
        
        return resultado
    }


}

