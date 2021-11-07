//
//  main.swift
//  Icon Changer
//
//  Created by Eroxl on 2021-11-06.
//
// Sources

import AppKit
import ArgumentParser

// SOURCE: https://stackoverflow.com/questions/31155299/how-to-resize-nsimage-in-swift
func resize(image: NSImage, w: Int, h: Int) -> NSImage {
    let destSize = NSMakeSize(CGFloat(w), CGFloat(h))
    let newImage = NSImage(size: destSize)
    newImage.lockFocus()
    image.draw(in: NSMakeRect(0, 0, destSize.width, destSize.height), from: NSMakeRect(0, 0, image.size.width, image.size.height), operation: NSCompositingOperation.copy, fraction: CGFloat(1))
    newImage.unlockFocus()
    newImage.size = destSize
    return NSImage(data: newImage.tiffRepresentation!)!
}

struct ChangeIcon: ParsableCommand {
    static let configuration = CommandConfiguration(
        abstract: "A Swift command-line tool to automatically change a folder/applications icon"
    )
    
    @Argument(help: "Path to the new icons image.")
    var imagePath: String

    @Argument(help: "Path to the file you want to icon of updated.")
    var filePath: String

    mutating func run() throws {
        let workspace = NSWorkspace()
        if let image = NSImage(byReferencingFile: imagePath) {
            let succeeded = workspace.setIcon(
                resize(image: image, w: 256, h: 256),
                forFile: filePath
            )
            print(succeeded)
        }
    }
    
    init() { }
}

ChangeIcon.main()
