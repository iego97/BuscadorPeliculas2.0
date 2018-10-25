//
//  PeliculaBusqueda.swift
//  buscadorPeliculas
//
//  Created by Alumno on 25/10/18.
//  Copyright © 2018 Alumno. All rights reserved.
//

import Foundation

class PeliculaBusqueda{
    
    var titleBusqueda : String?
    var yearBusqueda : String?
    
    init(titulo : String, year: String)
    {
        
        self.titleBusqueda = titulo
        self.yearBusqueda = year
        
    }
}
