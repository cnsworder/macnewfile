//
//  FinderSync.swift
//  NewFileEx
//
//  Created by 陈冰峰 on 01/09/2017.
//  Copyright © 2017 MajorEssense. All rights reserved.
//

import Cocoa
import FinderSync

class FinderSync: FIFinderSync {
    
    var _fullPath = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("MacNewFile")
    
    override init() {
        super.init()
    }
    
    
    override var toolbarItemName: String {
        return "NewFile"
    }
    
    override var toolbarItemToolTip: String {
        return "New File"
    }
    
    override var toolbarItemImage: NSImage {
        return NSImage(named: NSImageNameAddTemplate)!
    }
    
    
    func makeSureTheFolder() {
        NSLog("make sure the folder from ext")
        
        if !FileManager.default.fileExists(atPath: _fullPath.path) {
            do {
                try FileManager.default.createDirectory(at: _fullPath, withIntermediateDirectories: false, attributes: nil)
                NSLog("create the folder")
            } catch let error as NSError {
                NSLog(error.localizedDescription);
            }
            NSLog("not exist")
        }
    }
    
    func getTemplateFileList() -> [String]{
        
        do {
            let directoryContents = try FileManager.default.contentsOfDirectory(atPath: _fullPath.path)
            print(directoryContents)
            return directoryContents
        } catch let error as NSError {
            print(error.localizedDescription)
        }
        return []
    }
    
    override func menu(for menuKind: FIMenuKind) -> NSMenu {
        makeSureTheFolder()
        let menu = NSMenu(title: "")
        var items = getTemplateFileList()
        items = items.filter{$0 != ".DS_Store"}
        for item in items {
            NSLog(item)
            menu.addItem(withTitle: item, action: #selector(addFile(_:)), keyEquivalent: "")

        }
        return menu
    }
    
    
    func genDesUrl(_ fileName:String) -> URL {
        var index = 0
       
        while index < 100 {
            
            let little_name = index > 0 ? String.init(format: "%d %@", index, fileName) : fileName
            print(little_name)
            let des_full_path = FIFinderSyncController.default().targetedURL()?.appendingPathComponent(little_name)
            if !FileManager.default.fileExists(atPath: des_full_path!.path) {
                return des_full_path!
            }
            index += 1
        }
        return FIFinderSyncController.default().targetedURL()!.appendingPathComponent(fileName)
    }
    
    @IBAction func addFile(_ item: NSMenuItem) {
        
        let little_path = item.title
        let src_full_path = _fullPath.appendingPathComponent(little_path)
        NSLog("src = %s", src_full_path.path)
        
        let des_full_path = genDesUrl(little_path)
        print(des_full_path)
        
        if !FileManager.default.fileExists(atPath: des_full_path.path){
            do {
                try FileManager.default.copyItem(at: src_full_path, to: des_full_path)
            } catch{
                
            }
        }
        
    }
}
