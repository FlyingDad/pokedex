 //
//  PokeCell.swift
//  pokedex
//
//  Created by Michael Kroth on 6/26/16.
//  Copyright © 2016 MGK Technology Solutions, LLC. All rights reserved.
//

import UIKit

class PokeCell: UICollectionViewCell {
    
    @IBOutlet weak var thumbImg: UIImageView!
    @IBOutlet weak var nameLbl: UILabel!
    
    var pokeman: Pokeman!
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        self.layer.cornerRadius = 5.0
        self.clipsToBounds = true
    }
    
    func configureCell(pokeman: Pokeman) {
        self.pokeman = pokeman
        
        nameLbl.text = self.pokeman.name.capitalizedString
        thumbImg.image = UIImage(named: "\(self.pokeman.pokedexId)")
    }
}
