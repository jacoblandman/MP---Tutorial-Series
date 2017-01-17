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
    
    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
    @IBOutlet weak var nameLbl: UILabel!
    @IBOutlet weak var mainImg: UIImageView!
    @IBOutlet weak var descriptionLbl: UILabel!
    @IBOutlet weak var typeLbl: UILabel!
    @IBOutlet weak var defenseLbl: UILabel!
    @IBOutlet weak var heightLbl: UILabel!
    @IBOutlet weak var pokedexLbl: UILabel!
    @IBOutlet weak var weightLbl: UILabel!
    @IBOutlet weak var attackLbl: UILabel!
    @IBOutlet weak var currentEvoImg: UIImageView!
    @IBOutlet weak var nextEvoImg: UIImageView!
    @IBOutlet weak var evoLbl: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        nameLbl.text = pokemon.name.capitalized
        pokedexLbl.text = "\(pokemon.pokedexId)"
        
        let img = UIImage(named: "\(pokemon.pokedexId)")
        mainImg.image =  img
        currentEvoImg.image = img
        
        view.isUserInteractionEnabled = false
        activityIndicator.isHidden = false
        activityIndicator.startAnimating()
        
        pokemon.downloadPokemonDetails { [unowned self] in
            
            print("Did arrive here?")
            // Whatever we write here will only be called after the network call is complete!
            self.updateUI()
        }
        
    }
    
    @IBAction func backBtnPressed(_ sender: Any) {
        
        dismiss(animated: true, completion: nil)
    }
    
    func updateUI() {
        
        heightLbl.text = pokemon.height
        weightLbl.text = pokemon.weight
        attackLbl.text = pokemon.attack
        defenseLbl.text = pokemon.defense
        typeLbl.text = pokemon.type
        descriptionLbl.text = pokemon.description
        
        if pokemon.nextEvolutionId == "" {
            
            evoLbl.text = "No Evolutions"
            nextEvoImg.isHidden = true
        } else {
            
            nextEvoImg.isHidden = false
            nextEvoImg.image = UIImage(named: "\(pokemon.nextEvolutionId)")
            evoLbl.text = "Next Evolution: \(pokemon.nextEvolutionName.capitalized) - LVL \(pokemon.nextEvolutionLevel)"
        }
        
        activityIndicator.stopAnimating()
        activityIndicator.isHidden = true
        view.isUserInteractionEnabled = true
        
    }
}
