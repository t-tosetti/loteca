//
//  MegaSenaViewController.swift
//  Loteca
//
//  Created by Thiago Tosetti Lopes on 31/01/16.
//  Copyright © 2016 tDesign. All rights reserved.
//

import UIKit

class MegaSenaViewController: UIViewController {

    private let totalDezenas = 6
    private let numerosValidos = Array(1...60)
    
    @IBOutlet weak var megaDisplay: UIPickerView!
    
    @IBAction func megaSorteio(sender: UIButton) {
        let mega = sortearMega()
        
        for (indiceDezena, dezena) in mega.enumerate() {
            let indiceLinha = numerosValidos.indexOf(dezena)!
            megaDisplay.selectRow(indiceLinha, inComponent: indiceDezena, animated: true)
        }

    }
    
    private func sortearMega() -> [Int] {
        var sorteio = Set<Int>()
        
        while sorteio.count < totalDezenas {
            sorteio.insert(sortearDezena())
        }
        
        return sorteio.sort()
    }
    
    
    private func sortearDezena() -> Int {
        let tamanho = UInt32(numerosValidos.count)
        let sorteio = Int(arc4random_uniform(tamanho))
        return numerosValidos[sorteio]
    }
    

}


    // MARK: - UIPickerViewDataSource
    
    extension MegaSenaViewController: UIPickerViewDataSource {
        func numberOfComponentsInPickerView(pickerView: UIPickerView) -> Int {
            return totalDezenas
        }
        
        func pickerView(pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return numerosValidos.count
        }
        
    }
    
    // MARK: - UIPickerViewDELEGATE
    extension MegaSenaViewController: UIPickerViewDelegate {
        func pickerView(pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
            return String(numerosValidos[row])
        }
        
        func pickerView(pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
            print(component, row)
        }
    }

