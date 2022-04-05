//
//  ViewController.swift
//  QuizAppPM2
//
//  Created by Mac13 on 08/03/22.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var preguntaLbl: UILabel!
    @IBOutlet weak var puntajeLbl: UILabel!
    @IBOutlet weak var verdaderoBoton: UIButton!
    @IBOutlet weak var avancePrgrs: UIProgressView!
    @IBOutlet weak var falsoBoton: UIButton!
    var numPregunta = 0
    var puntos = 0
    
    let preguntas = [
        Pregunta(texto:"La mayonesa es un instrumento musical",respuesta: "Falso"),
        Pregunta(texto:"La raiz cuadrada de 2 es 4",respuesta: "Verdadero"),
        Pregunta(texto:"2 y 2  son 4, 4 y 2 son 6",respuesta: "Verdadero"),
        Pregunta(texto:"El platano proporciona potasio",respuesta: "Verdadero"),
        Pregunta(texto:"3 al cubo es 34?",respuesta: "Falso"),
        Pregunta(texto:"Las macs tardan 3 años en encender?",respuesta: "Verdadero"),
        Pregunta(texto:"5 + 2 = 8?",respuesta: "Falso"),
        Pregunta(texto:"Los gatos adoran dormir",respuesta: "Verdadero"),
        Pregunta(texto:"Los gatos adoran bañarse",respuesta: "Falso"),
        Pregunta(texto:"Los perros pueden sentir emociones",respuesta: "Verdadero")
    ]
    
    override func viewDidLoad() {
        super.viewDidLoad()
        cambiarPregunta()
    }
    
    @IBAction func respuestaBTN(_ sender: UIButton) {
        let respuestaUsuario = sender.currentTitle
        let respuestaCorrecta = preguntas[numPregunta].respuesta
        
        if respuestaUsuario == respuestaCorrecta{
            puntos = puntos + 10
            print("Respuesta Correcta")
            puntajeLbl.text = "Puntaje: \(puntos)"
            sender.backgroundColor = UIColor.green
        } else {
            print("Respuesta Erronea")
            sender.backgroundColor = UIColor.red
        }
        
        if numPregunta + 1 < preguntas.count{
            cambiarPregunta()
            numPregunta += 1
        } else {
            numPregunta = 0
            let alerta = UIAlertController(title: "Muy bien lo lograste", message: "Su puntaje es... \(puntos) pts", preferredStyle: .alert)
            let accionSalir = UIAlertAction(title: "salir", style: .cancel){_ in exit(0)}
            let accionJugarNuevo = UIAlertAction(title: "nuevo juego", style: .default){_ in self}
            alerta.addAction(accionJugarNuevo)
            alerta.addAction(accionSalir)
            present(alerta, animated: true, completion: nil)
            puntos = 0
        }
        
        Timer.scheduledTimer(timeInterval: 1.0, target: self, selector: #selector(cambiarPregunta), userInfo: nil, repeats: false)
    }
    
    
    
    
    @objc func cambiarPregunta() {
        preguntaLbl.text = preguntas[numPregunta].texto
        verdaderoBoton.backgroundColor = UIColor.white
        falsoBoton.backgroundColor = UIColor.white
        avancePrgrs.progress = Float(numPregunta + 1) / Float(preguntas.count)
        //mensaje
    }


}
