//
//  AlbumModel.swift
//  MusicAlbum
//
//  Created by shyam on 4/4/19.
//

import Foundation

struct AlbumModel {
    var albumId: Int
    var songTitle: String
    var albumImageURL: String
    var singerName: String
    
    init(albumId: Int, albumName: String, imageURL: String, name: String) {
        self.albumId = albumId
        self.songTitle = albumName
        self.albumImageURL = imageURL
        self.singerName = name
    }
}
