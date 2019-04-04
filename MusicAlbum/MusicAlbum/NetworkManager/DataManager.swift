//
//  DataManager.swift
//  MusicAlbum
//
//  Created by shyam on 4/4/19.
//

import UIKit
import CoreData

class DataManager: NSObject {
    
    public func initializeData() {
        if !isDataAvailable() {
            createData()
        }
    }
    
    fileprivate func isDataAvailable() -> Bool {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return false}
        let managedContext = appDelegate.persistentContainer.viewContext
        let fetchRequest = NSFetchRequest<NSFetchRequestResult>(entityName: "AlbumData")
        do {
            let result = try managedContext.fetch(fetchRequest)
            if result.count > 0{
                return true
            } else { return false }
        } catch {
            print("Error in fetching data")
        }
        return true
    }
    
    fileprivate func createData() {
        
        let albumData: Array = [AlbumViewModel(album: AlbumModel(albumId: 1, albumName: "Green Day", imageURL: "http://www.billboard.com/files/styles/900_wide/public/media/Green-Day-American-Idiot-album-covers-billboard-1000x1000.jpg", name: "American Idiot")),
                                AlbumViewModel(album: AlbumModel(albumId: 2, albumName: "The Coast", imageURL: "https://spark.adobe.com/images/landing/examples/design-music-album-cover.jpg", name: "Shipwreck")),
                                AlbumViewModel(album: AlbumModel(albumId: 3, albumName: "Devil's Gun", imageURL: "https://www.smashingmagazine.com/images/music-cd-covers/43.jpg", name: "Shipwreck")),
                                AlbumViewModel(album: AlbumModel(albumId: 4, albumName: "Perfectly Chilled", imageURL: "http://www.designformusic.com/wp-content/uploads/2016/01/perfectly-chilled-album-cover-artwork-design-500x500.jpg", name: "Roland Greco")),
                                AlbumViewModel(album: AlbumModel(albumId: 5, albumName: "Sunset chaser", imageURL: "https://marketplace.canva.com/MACF48yCzKk/1/0/thumbnail_large/canva-sunset-chaser-album-cover-MACF48yCzKk.jpg", name: "Yoko Marie")),
                                AlbumViewModel(album: AlbumModel(albumId: 6, albumName: "BLIND", imageURL: "https://s-media-cache-ak0.pinimg.com/736x/16/c3/76/16c3766892135064af70cf1b077f2dc9.jpg", name: "unknown")),
                                AlbumViewModel(album: AlbumModel(albumId: 7, albumName: "TROPICO", imageURL: "https://marketplace.canva.com/MAB9YpuFzIs/1/0/thumbnail_large/canva-music-cd-cover-28alb%20um-cover29-MAB9YpuFzIs.jpg", name: "PARADIS")),
                                AlbumViewModel(album: AlbumModel(albumId: 8, albumName: "THE RESISTANCE", imageURL: "http://4.bp.blogspot.com/-ABhte_JFzcI/UM6m49lkKYI/AAAAAAAADJc/DUIkgMrHmhs/s1600/the_%20resistance_wallpaper_muse-norm%20al.jpg", name: "MUSE")),
                                AlbumViewModel(album: AlbumModel(albumId: 9, albumName: "Coldplay", imageURL: "https://i.pinimg.com/originals/65/55/91/655591e1e8ca1cf23171b726691aabf5.jpg", name: "MUSE")),
                                AlbumViewModel(album: AlbumModel(albumId: 10, albumName: "KISS", imageURL: "https://cdn.tutsplus.com/psd/uploads/legacy/0612_Typographic_Covers/Kiss_first_album_cover.jpg", name: "UNKNOWN")),
                                AlbumViewModel(album: AlbumModel(albumId: 11, albumName: "PHLEARN", imageURL: "https://i.ytimg.com/vi/kiZD_JHV_-8/maxresdefault.jpg", name: "FT. DJ SWIZZLE STIX")),
                                AlbumViewModel(album: AlbumModel(albumId: 12, albumName: "MASTERMIND", imageURL: "https://theboombox.com/files/2014/02/RickRoss_Mastermind.jpg", name: "RICKY ROXX")),
                                AlbumViewModel(album: AlbumModel(albumId: 13, albumName: "EMINEM RECOVERY", imageURL: "https://i.pinimg.com/originals/e4/7b/01/e47b01f57dcae2838199b781b2899c29.jpg", name: "UNKNOWN")),
                                AlbumViewModel(album: AlbumModel(albumId: 14, albumName: "THINK THANK", imageURL: "https://upload.wikimedia.org/wikipedia/en/d/d1/Think_tank_album_cover.jpg", name: "UNKNOWN")),
                                AlbumViewModel(album: AlbumModel(albumId: 15, albumName: "LINKIN PARK", imageURL: "https://i.pinimg.com/originals/50/f4/d5/50f4d510a9c309d587c3108606ae8ac1.jpg", name: "UNKNOWN"))]
        
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else { return }
        let managedContext = appDelegate.persistentContainer.viewContext
        let albumEntity = NSEntityDescription.entity(forEntityName: "AlbumData", in: managedContext)!
        
        for i in 0..<albumData.count {
            let albumViewModel = albumData[i]
            let album = NSManagedObject(entity: albumEntity, insertInto: managedContext)
            album.setValue(albumViewModel.albumId, forKey: "albumId")
            album.setValue(albumViewModel.songThumbnailImageURL, forKey: "albumImageURL")
            album.setValue(albumViewModel.songTitle, forKey: "albumTitle")
            album.setValue(albumViewModel.singerName, forKey: "singerName")
        }
        do {
            try managedContext.save()
        } catch let error as NSError {
            print("Could not save, \(error.localizedDescription) error occurred")
        }
    }
}
