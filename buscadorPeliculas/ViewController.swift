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
        return DatosBusqueda.Datos.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let celda = tableView.dequeueReusableCell(withIdentifier: "celdaBusqueda") as! CeldaBusqueda
        
        celda.lblPelicula.text = DatosBusqueda.Datos[indexPath.row].titleBusqueda
        celda.lblYear.text = DatosBusqueda.Datos[indexPath.row].yearBusqueda
        
        return celda
        
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 85
    }
    

    @IBOutlet weak var tbBusqueda: UITableView!
    @IBOutlet weak var txtSearch: UITextField!
    @IBOutlet weak var aiCargarPelicula: UIActivityIndicatorView!
   
    
    @IBOutlet weak var lblNotFound: UILabel!
    var tituloBuscador : String?
    
    
    
    
    @IBAction func doTapSearch(_ sender: Any) {
        
        tituloBuscador = txtSearch.text
        
        let urlMovieSearch = "https://www.omdbapi.com/?apikey=f6a3d230&s=\(tituloBuscador!)"
        
        Alamofire.request(urlMovieSearch).responseJSON{
            response in
            
            var pelicula : PeliculaBusqueda
            
            self.aiCargarPelicula.startAnimating()
            
            if let dictSearch = response.result.value as? NSDictionary{
            
                //if let search = dictSearch.value(forKey: "Search") as? NSDictionary{
                
            if let arrayMovie = dictSearch.value(forKey: "Search") as? NSArray{
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
                                                           // }
                                                        }
                                        self.tbBusqueda.reloadData()
                                        self.aiCargarPelicula.stopAnimating()
                                                    }
                                            }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let destino = segue.destination as! ViewControllerDetallePelicula
        destino.titulo = DatosBusqueda.Datos[(tbBusqueda.indexPathForSelectedRow?.row)!].titleBusqueda!
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


}

