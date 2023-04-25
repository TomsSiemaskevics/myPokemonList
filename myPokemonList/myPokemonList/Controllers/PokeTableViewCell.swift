//
//  PokeTableViewCell.swift
//  myPokemonList
//
//  Created by toms.siemaskevics on 24/04/2023.
//

import UIKit
import SDWebImage
class PokeTableViewCell: UITableViewCell {
    
    @IBOutlet weak var pokeImageView: UIImageView!
    @IBOutlet weak var pokeNameLabel: UILabel!
    @IBOutlet weak var pokeSuperTypeLabel: UILabel!
    @IBOutlet weak var pokeHpLabel: UILabel!
    @IBOutlet weak var pokeSeriesLabel: UILabel!
    
    func setupUI(withDataFrom: Card) {
        pokeNameLabel.text = "Name: " + withDataFrom.name
       
        pokeHpLabel.text = "Health: " + (withDataFrom.hp ?? "")
        pokeSeriesLabel.text = String("Series ") + withDataFrom.series.rawValue
        pokeImageView.sd_setImage(with: URL(string: withDataFrom.imageURL))
        
        if let superType = withDataFrom.supertype {
            pokeSuperTypeLabel.text = "Group: " + superType
           if withDataFrom.supertype == "Trainer" {
                contentView.backgroundColor = UIColor.red
           } else if withDataFrom.supertype == "Pokémon"{
               contentView.backgroundColor = UIColor.yellow
           } else if withDataFrom.supertype == "Energy" {
               contentView.backgroundColor = UIColor.green
           }
        }
    }
    
}
