//
//  ViewController.swift
//  Pokemon
//
//  Created by Ghassan  albakuaa  on 10/4/20.
//



import UIKit

class MainViewController: UIViewController, UITableViewDelegate {
    
    var pokeTable: UITableView!
    
    var pokeList: [Pokemon] = []
    
    var currentPage: Int = 1

    var spritesList: [String: String] = [:]

    override func viewDidLoad() {
        super.viewDidLoad()
        
        NetworkManager.shared.fetchPokemon{ result in
               switch result {
               case .success(let pokemonList):
                self.pokeList = pokemonList.results
               case .failure(_):
                print("error")
                   //self.presentAlert(error: error)
               }
           }

        self.setUp()
    }
    
    private func setUp() {
        self.view.backgroundColor = .red
        print("setUP")
//        let poke = Pokemon(name: "dunsparce")
//        pokeList.append(poke)
        
        let table = UITableView(frame: .zero)
        table.translatesAutoresizingMaskIntoConstraints = false
        
        table.delegate = self
        table.dataSource = self
        table.register(PokeTableViewCell.self, forCellReuseIdentifier: PokeTableViewCell.reuseId)
        
        self.view.addSubview(table)
        table.boundToSuperView()
        self.pokeTable = table
        
    }
    

}

extension MainViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.pokeList.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: PokeTableViewCell.reuseId, for: indexPath) as? PokeTableViewCell else {
            return UITableViewCell()
        }
                
        
        cell.titleLabel.text = self.pokeList[indexPath.row].name
        cell.pokemonSpriteView.image = UIImage(named: "img")
        
        return cell
    }
    
}
