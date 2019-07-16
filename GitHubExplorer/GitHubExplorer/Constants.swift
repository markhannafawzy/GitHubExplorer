//
//  Constants.swift
//  MarvelApp
//
//  Created by msaad on 1/23/19.
//  Copyright © 2019 msaad. All rights reserved.
//

import Foundation
//import CryptoSwift
class Constants {
//    static let apiKey : [String:String] = ["apikey":"ec3821d2d534efe01b049f07ec36ce47"]
//    static let privateApiKey : String = "1146e843424ebc26012f444efc479fc1ffeeb754"
    static let baseURL = Bundle.main.infoDictionary!["API_BASE_URL_ENDPOINT"] as! String
//    static var baseAuthParameters :[String:String] {
//        get{
//            let timeStamp = Date().timeIntervalSince1970
//            return ["ts": "\(timeStamp)" , "hash" : "\(timeStamp)\(privateApiKey)\(apiKey["apikey"]!)".md5()]
//
//        }
//    }
//    https://api.github.com/search/repositories?q=tetris+language:assembly&sort=stars&order=desc

//    static let characterTableViewCell : String = "CharacterTableViewCell"
//    static let detailsScreenCharacterImageTableViewCell : String = "DetailsScreenCharacterImageTableViewCell"
//    static let detailsScreenLabeledTableViewCell : String = "DetailsScreenLabeledTableViewCell"
//    static let detailsScreenCollectionViewCell : String = "DetailsScreenCollectionViewCell"
//    static let collectionViewCell : String = "CollectionViewCell"
//    static let basicCell :String = "basicCell"
//    static let charactersEndPointConfigurationName : String = "characters"
//    static let comicsEndPoint : String = "comics"
//    static let seriesEndPoint : String = "series"
//    static let storiesEndPoint : String = "stories"
//    static let eventsEndPoint : String = "events"
//    static let allCharactersPath : String = "/v1/public/characters"
//    static let characterDetailsTableViewController : String = "CharacterDetailsTableViewController"
//    static let tableViewHeaderTitles : [String] = ["","NAME","DESCRIPTION","COMICS","SERIES","STORIES","EVENTS" , "RELATED LINKS"]
//    static let retatedLinksSectionStrings : [String] = ["Detail" , "wiki" , "Comiclink"]
//    static let collectionViewIndexNumbers :[Int] = [3,4,5,6]
    static let searchPath = "/search/repositories"
}

