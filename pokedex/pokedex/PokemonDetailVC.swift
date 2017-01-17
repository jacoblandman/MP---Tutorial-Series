//
//  PokemonDetailVC.swift
//  pokedex
//
//  Created by Jacob Landman on 1/16/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import UIKit

class PokemonDetailVC: UIViewController {

    var pokemon: Pokemon!
    @IBOutlet weak var nameLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name
        
    }
}
