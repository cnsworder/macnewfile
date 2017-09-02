//
//  ViewController.swift
//  MacNewFile
//
//  Created by 陈冰峰 on 01/09/2017.
//  Copyright © 2017 MajorEssense. All rights reserved.
//

import Cocoa


extension String {
    var localized: String {
        return NSLocalizedString(self, tableName: nil, bundle: Bundle.main, value: "", comment: "")
    }
}

class ViewController: NSViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.labelMain.stringValue = "PutFileTo".localized
    }

    override var representedObject: Any? {
        didSet {
        // Update the view, if already loaded.
        }
    }
    
    @IBAction func onclick(_ sender: NSButton) {
        openMyFolder()
    }
    
    
    @IBAction func showSite(_ sender: NSButton) {
        if let url = URL(string: "https://github.com/majoressense/macnewfile"), NSWorkspace.shared().open(url) {
            print("default browser was successfully opened")
        }
    }
    
    func makeSureTheFolder()
    {
        
        // check ~/.macnewfile path, if not exist, create it
        let fullPath = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Library/Containers/co.ch3n.MacNewFile.NewFileEx/Data/MacNewFile")
        
        if !FileManager.default.fileExists(atPath: fullPath.path) {
            // file does not exist
            do {
                NSLog(fullPath.absoluteString)
                try FileManager.default.createDirectory(at: fullPath, withIntermediateDirectories: false, attributes: nil)
            } catch let error as NSError {
                NSLog(error.localizedDescription);
            }
            NSLog("not exist")
        }
    }
    
    func openMyFolder()
    {
        // check ~/.macnewfile path, if not exist, create it, finally, open it in finder window
        let fullPath = FileManager.default.homeDirectoryForCurrentUser.appendingPathComponent("Library/Containers/co.ch3n.MacNewFile.NewFileEx/Data/MacNewFile")
        
        makeSureTheFolder()
        
        NSWorkspace.shared().selectFile(nil, inFileViewerRootedAtPath: fullPath.path)
        
        do {
            let directoryContents = try FileManager.default.contentsOfDirectory(atPath: fullPath.path)
            print(directoryContents)
        } catch let error as NSError {
            print(error.localizedDescription)
        }

    }

    @IBOutlet weak var labelMain: NSTextField!
    
    
}

