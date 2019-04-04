//
//  AlbumViewModel.swift
//  MusicAlbum
//
//  Created by shyam on 4/4/19.
//

import Foundation

struct AlbumViewModel {
    private var albumModel: AlbumModel
    
    var albumId: Int { return albumModel.albumId }
    
    var songTitle: String { return albumModel.songTitle }
    
    var songThumbnailImageURL: URL { return URL(string: albumModel.albumImageURL)!}
    
    var singerName: String { return albumModel.singerName }
    
    init(album: AlbumModel) {
        self.albumModel = album
    }
}
