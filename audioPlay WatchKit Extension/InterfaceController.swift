//
//  InterfaceController.swift
//  audioPlay WatchKit Extension
//
//  Created by Drew Westcott on 15/02/2017.
//  Copyright © 2017 Drew Westcott. All rights reserved.
//

import WatchKit
import Foundation


class InterfaceController: WKInterfaceController {

	@IBOutlet var queueLabel: WKInterfaceLabel!
	@IBOutlet var audioButton: WKInterfaceButton!
	
	var playing = false
	var podPlayer : WKAudioFilePlayer!
	
    override func awake(withContext context: Any?) {
        super.awake(withContext: context)
        
        // Configure interface objects here.
    }
    
    override func willActivate() {
        // This method is called when watch view controller is about to be visible to user
        super.willActivate()
		audioButton.setTitle("99 Percent Invisible")
    }
    
    override func didDeactivate() {
        // This method is called when watch view controller is no longer visible
        super.didDeactivate()
    }

	@IBAction func audioTapped() {
		
		let filePath = Bundle.main.path(forResource: "246-Usonia", ofType: "mp3")!
		let fileURL = NSURL.fileURL(withPath: filePath)
		let asset = WKAudioFileAsset(url: fileURL)
		let playerItem = WKAudioFilePlayerItem(asset: asset)
		
		podPlayer = WKAudioFilePlayer(playerItem: playerItem)
		audioButton.setTitle("> 99 Percent Invisible")
		podPlayer.play()
		
	}
}
