//
//  ViewControllerDetallePelicula.swift
//  buscadorPeliculas
//
//  Created by Alumno on 30/10/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import Foundation
import UIKit
import Alamofire

class ViewControllerDetallePelicula: UIViewController{
    
    @IBOutlet weak var lblTitulo: UILabel!
    @IBOutlet weak var lblDirector: UILabel!
    @IBOutlet weak var lblDuracion: UILabel!
    @IBOutlet weak var lblRating: UILabel!
    @IBOutlet weak var lblGenero: UILabel!
    @IBOutlet weak var lblYear: UILabel!
    
    
    var titulo : String = ""
    var urlPelicula : String?
    
    
    
    override func viewDidLoad() {
        
        titulo = titulo.addingPercentEncoding(withAllowedCharacters: .urlPathAllowed)!
        
        urlPelicula = "https://www.omdbapi.com/?apikey=f6a3d230&t=\(titulo)"
        
        
        Alamofire.request(urlPelicula!).responseJSON{
          response in
            
            if let dictSearch = response.result.value as? NSDictionary{
                
                if let title = dictSearch.value(forKey: "Title") as? String
                {
                    self.lblTitulo.text = title
                }
                
                if let director = dictSearch.value(forKey: "Director") as? String
                {
                    self.lblDirector.text = director
                }
                
                if let duracion = dictSearch.value(forKey: "Runtime") as? String
                {
                    self.lblDuracion.text = duracion
                }
                
                if let clasificacion = dictSearch.value(forKey: "Rating") as? String
                {
                    self.lblRating.text = clasificacion
                }
                if let year = dictSearch.value(forKey: "Year") as? String
                {
                    self.lblYear.text = year
                }
                if let genre = dictSearch.value(forKey: "Genre") as? String
                {
                    self.lblGenero.text = genre
                }
                
                
            }
            
        }
        
        
        
        
                
    }
    
    
}
