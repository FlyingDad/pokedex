//
//  Pokeman.swift
//  pokedex
//
//  Created by Michael Kroth on 6/26/16.
//  Copyright © 2016 MGK Technology Solutions, LLC. All rights reserved.
//

import Foundation
import Alamofire

class Pokemon {
    
    private var _name: String!
    private var _pokedexId: Int!
    private var _description: String!
    private var _type: String!
    private var _defense: String!
    private var _height: String!
    private var _weight: String!
    private var _attack: String!
    private var _nextEvolutionTxt: String!
    
    private var _pokemonUrl: String!
    
    var name: String {
        return _name
    }
    
    var pokedexId: Int {
        return _pokedexId
    }
    
    var height: String {
        return _height
    }
    
    init(name: String, pokedexId: Int) {
        self._name = name
        self._pokedexId = pokedexId
        
        _pokemonUrl = "\(URL_BASE)\(URL_POKEMON)\(self._pokedexId)/"
    }
    
    func downloadPokemanDetails(complete: DownloadComplete) {
        
        let url = NSURL(string: _pokemonUrl)!
        Alamofire.request(.GET, url).responseJSON { response in
                //print(response.request)  // original URL request
                //print(response.response) // URL response
                //print(response.data)     // server data
                //print(response.result)   // result of response serialization
                
                // print response for testing
                //if let JSON = response.result.value {
                    //print("JSON: \(JSON)")
                //}
                
                if let dict = response.result.value as? Dictionary<String, AnyObject> {
                    //print(dict["name"])
                    if let weight = dict["weight"] as? String{
                        self._weight = weight
                    }
                    
                    if let height = dict["height"] as? String {
                        self._height = height
                    }
                    
                    if let attack = dict["attack"] as? Int {
                        self._attack = "\(attack)"
                    }
                    
                    if let defense = dict["defense"] as? Int {
                        self._defense = "\(defense)"
                    }
                    
                    if let types = dict["types"] as? [Dictionary<String, String>] where types.count > 0 {
                        if let name = types[0]["name"] {
                            self._type = name.capitalizedString
                        }
                        
                        if types.count > 1 {
                            
                            for x in 1...types.count {
                                if let name = types[x]["name"] {
                                    self._type! += "/\(name.capitalizedString)"
                                }
                            }
                            
                        }
                    } else {
                        self._type = ""
                    }

                    
                }
                
        }
    }
    
}
