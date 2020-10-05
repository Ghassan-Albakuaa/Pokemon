//
//  PokeTableViewCell.swift
//  Pokemon
//
//  Created by Ghassan  albakuaa  on 10/4/20.
//

import UIKit

class PokeTableViewCell: UITableViewCell {
    
    static let reuseId: String = "pokeCell"
    
    var pokemonSpriteView: UIImageView = {
        let imageView = UIImageView(frame: .zero)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "img")
        return imageView
    }()
    var titleLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.translatesAutoresizingMaskIntoConstraints = false
        label.text = "Title"
        label.textAlignment = .left
        label.numberOfLines = 0
        return label
    }()
    
    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        self.setUp()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:)  not  implemented")
    }
    
    func setUp() {
        
        self.contentView.addSubview(self.pokemonSpriteView)
        self.contentView.addSubview(self.titleLabel)
        
        self.pokemonSpriteView.leadingAnchor.constraint(equalTo: self.contentView.leadingAnchor, constant: 8).isActive = true
        self.pokemonSpriteView.topAnchor.constraint(equalTo: self.contentView.topAnchor, constant: 8).isActive = true
        self.pokemonSpriteView.bottomAnchor.constraint(equalTo: self.contentView.bottomAnchor, constant: -8).isActive = true
        self.pokemonSpriteView.heightAnchor.constraint(equalToConstant: 100).isActive = true
        self.pokemonSpriteView.widthAnchor.constraint(equalToConstant: 70).isActive = true
        self.pokemonSpriteView.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
        
        self.titleLabel.leadingAnchor.constraint(equalTo: self.pokemonSpriteView.trailingAnchor, constant: 8).isActive = true
        self.titleLabel.trailingAnchor.constraint(equalTo: self.contentView.trailingAnchor, constant: -8).isActive = true
        self.titleLabel.centerYAnchor.constraint(equalTo: self.contentView.centerYAnchor).isActive = true
    }
    
}

