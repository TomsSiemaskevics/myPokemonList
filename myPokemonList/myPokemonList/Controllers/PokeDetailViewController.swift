//
//  PokeDetailViewController.swift
//  myPokemonList
//
//  Created by toms.siemaskevics on 25/04/2023.
//

import UIKit
import SDWebImage
class PokeDetailViewController: UIViewController {
    var pokemon: Card?
    @IBOutlet weak var pokeImage: UIImageView!
    @IBOutlet weak var pokeNumberLabel: UILabel!
    @IBOutlet weak var evolvesFromLabel: UILabel!
    @IBOutlet weak var pokeRarityLabel: UILabel!
    
    @IBOutlet weak var pokeTextLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = pokemon?.name
        if let pokemon = pokemon{
            self.pokeImage.sd_setImage(with: URL(string: pokemon.imageURL))
            pokeNumberLabel.text = "Number: " + (pokemon.number ?? "")
            evolvesFromLabel.text = "Evolves From: " + (pokemon.evolvesFrom ?? "")
            pokeRarityLabel.text = "Rarity: " + (pokemon.rarity ?? "")
            pokeTextLabel.text = "Card Set: " + (pokemon.cardSet ?? "")
        }
        // Do any additional setup after loading the view.
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
