//
//  ViewController.swift
//  myPokemonList
//
//  Created by toms.siemaskevics on 24/04/2023.
//

import UIKit

class PokemonViewController: UIViewController {

    @IBOutlet weak var tableViewOutlet: UITableView!
    var poke: [Card] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Pokemon Collection"
        getPokemonData()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func reloadButtonTapped(_ sender: Any) {
      getPokemonData()
    }
   
    func getPokemonData(){
        let jsonUrl = "https://api.pokemontcg.io/v1/cards"
        guard let url = URL(string: jsonUrl) else {return}
        var request = URLRequest(url: url)
        request.httpMethod = "GET"
        let config = URLSessionConfiguration.default
        config.waitsForConnectivity = true
        
        URLSession(configuration: config).dataTask(with: request) { data, response, error in
            if error != nil {
                print((error?.localizedDescription)!)
            }
            guard let data = data else {
                print(String(describing: error))
                return
            }
            do {
                let jsonData = try JSONDecoder().decode(Pokemon.self, from: data)
                dump(jsonData)
                self.poke = jsonData.cards
                DispatchQueue.main.async {
                    self.tableViewOutlet.reloadData()
                }
            }catch{
                print("Error::::", error)
            }
            
        }.resume()
    }

}
extension PokemonViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return poke.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as? PokeTableViewCell else {
            return UITableViewCell()
        }
        let pokey = poke[indexPath.row]
        cell.setupUI(withDataFrom: pokey)
        return cell
    }
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 250
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "pokemon" {
            guard let destinationVC = segue.destination as?
                    PokeDetailViewController, let row = tableViewOutlet.indexPathForSelectedRow?.row else {
                return
                }
            destinationVC.pokemon = poke[row]
        
        }
    }
    
}
