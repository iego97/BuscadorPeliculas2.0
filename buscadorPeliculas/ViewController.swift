//
//  ViewController.swift
//  buscadorPeliculas
//
//  Created by Alumno on 24/10/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import UIKit
import Alamofire

class ViewController: UIViewController, UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        <#code#>
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        <#code#>
    }
    

    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var aiCargarPelicula: UIActivityIndicatorView!
    @IBOutlet weak var lblMovie: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblGenre: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblRuntime: UILabel!
    @IBOutlet weak var imgPoster: UIImageView!
    
    @IBOutlet weak var lblNotFound: UILabel!
    var tituloBuscador : String?
    
    
    
    
    @IBAction func doTapSearch(_ sender: Any) {
        
        tituloBuscador = txtSearch.text
        
        let urlMovieSearch = "https://www.omdbapi.com/?apikey=f6a3d230&s=\(tituloBuscador!)"
        
        Alamofire.request(urlMovieSearch).responseJSON{
            response in
            
            var pelicula : PeliculaBusqueda
            
            self.aiCargarPelicula.startAnimating()
            
            if let arrayMovie = response.result.value as? NSArray{
                
                
                
                for resultadoPelicula in arrayMovie{
                    
                    if let dictMovie = resultadoPelicula as? NSDictionary{
                        
                        if let title = dictMovie.value(forKey: "Title") as? String
                        {
                            if let year = dictMovie.value(forKey: "Year") as? String
                            {
                                pelicula = PeliculaBusqueda(titulo: title, year: year)
                                DatosBusqueda.Datos.append(pelicula)
                            }
                        }
                        
                            }
                }
            }
            
            
            
            }
        
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
       
        
       
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

