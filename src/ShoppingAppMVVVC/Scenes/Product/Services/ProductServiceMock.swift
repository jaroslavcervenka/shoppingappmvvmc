//
// Created by Jaroslavc Cervenka on 05/09/2019.
// Copyright (c) 2019 Oriflame Software. All rights reserved.
//

import Foundation
import SwiftyJSON

class ProductServiceMock: ProductService{
    func getList() -> [ProductModel] {
        let jsonString = """
                         [
                           {
                             "code":"22815",
                             "brand": "Zpevňující oční krém Royal Velvet",
                             "price": 99.0,
                             "name": "Nové, vylepšené složení zpevňuje a obnovuje kontury pleti kolem očí a zmírňuje viditelnost tmavých kruhů a otoků. Zároveň redukuje jemné linky a vrásky. Naneste malé množství krému vedle vnějších koutků očí a jemně vklepejte do pleti směrem k nosu.",
                             "imageUrl": "https://media-ce-cdn.oriflame.com/-/media/Images/Catalog/Products/_global/02/22/228/22815.ashx?u=0101010000&q=90&imageFormat=Jpeg"
                           },
                         {
                             "code":"22815",
                             "brand": "Giordani Gold",
                             "price": 49.0,
                             "name": "Kuličkový antiperspirant deodorant Miss Giordani",
                             "imageUrl": "https://media-ce-cdn.oriflame.com/-/media/Images/Catalog/Products/_global/3/34/340/34079.ashx?u=0101010000&q=90&imageFormat=Jpeg"
                           }
                         ,
                         {
                             "code":"22815",
                             "brand": "Péče od hlavy až k patě",
                             "price": 199.0,
                             "name": "Tělový olej Dream Sleep",
                             "imageUrl": "https://media-ce-cdn.oriflame.com/-/media/Images/Catalog/Products/_global/3/34/341/34179.ashx?u=0101010000&q=90&imageFormat=Jpeg"
                           }                          
                         ,
                         {
                             "code":"22815",
                             "brand": "Péče od hlavy až k patě",
                             "price": 99.0,
                             "name": "Zklidňující krém na ruce s arnikou",
                             "imageUrl": "https://media-ce-cdn.oriflame.com/-/media/CZ/Images/products-1/34926.ashx?u=1812180653&q=90&imageFormat=Jpeg"
                           }
                         ,
                         {
                             "code":"22815",
                             "brand": "Feet Up",
                             "price": 89.0,
                             "name": "Krém na nohy s mangem a ženšenem Feet Up",
                             "imageUrl": "https://media-ce-cdn.oriflame.com/-/media/Images/Catalog/Products/_global/3/34/349/34933.ashx?u=0101010000&q=90&imageFormat=Jpeg"
                           },
                         {
                             "code":"22815",
                             "brand": "Swedish Spa",
                             "price": 149.0,
                             "name": "Tělové máslo Swedish Spa",
                             "imageUrl": "https://media-ce-cdn.oriflame.com/-/media/Images/Catalog/Products/_global/3/34/340/34025.ashx?u=0101010000&q=90&imageFormat=Jpeg"
                           },
                         {
                             "code":"22815",
                             "brand": "Milk & Honey Gold",
                             "price": 149.0,
                             "name": "Tělové mléko do sprchy Milk & Honey Gold",
                             "imageUrl": "https://media-ce-cdn.oriflame.com/-/media/Images/Catalog/Products/_global/3/34/340/34074.ashx?u=0101010000&q=90&imageFormat=Jpeg"
                           },
                         {
                             "code":"22815",
                             "brand": "Hand Care",
                             "price": 39.0,
                             "name": "Zvláčňující krém na ruce s avokádovým olejem",
                             "imageUrl": "https://media-ce-cdn.oriflame.com/-/media/Images/Catalog/Products/_global/3/34/349/34934.ashx?u=0101010000&q=90&imageFormat=Jpeg"
                           },
                         {
                             "code":"22815",
                             "brand": "Feet Up",
                             "price": 249.0,
                             "name": "Antiperspirační sprej na nohy 36h Feet Up Advanced",
                             "imageUrl": "https://media-ce-cdn.oriflame.com/-/media/Images/Catalog/Products/_global/3/33/330/33034.ashx?u=0101010000&q=90&imageFormat=Jpeg"
                           },
                         {
                             "code":"22815",
                             "brand": "Péče od hlavy až k patě",
                             "price": 39.0,
                             "name": "Ochranný krém na ruce s rakytníkovým olejem",
                             "imageUrl": "https://media-ce-cdn.oriflame.com/-/media/Images/Catalog/Products/_global/3/33/336/33642.ashx?u=0101010000&q=90&imageFormat=Jpeg"
                           }
                         ]
                         """
        if let jsonData = jsonString.data(using: .utf8)
        {
            let products = try! JSONDecoder().decode([ProductModel].self, from: jsonData)
            return products
        } else {
            return []
        }
    }
}