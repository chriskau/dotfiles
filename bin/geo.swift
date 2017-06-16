#!/usr/bin/env swift

// Run this command line tool as a dynamic script or compile a binary
// using the following command:
//   swiftc -sdk `xcrun --show-sdk-path` LocateMe.swift

import Foundation
import CoreLocation

let args = Process.arguments

if args.count != 2 {
    print("usage: \(args[0]) <address string>")
    exit(-1)
}

let streetAddress = args[1]

var shouldKeepRunning = true
let runLoop = NSRunLoop.currentRunLoop()
let distantFuture = NSDate.distantFuture()

let geo = CLGeocoder()

geo.geocodeAddressString(streetAddress) { (placemarks, error) in
    if let error = error {
        NSLog("\(error)")
    } else {
        for placemark in placemarks! {
            print("\(placemark.location!.coordinate.latitude),\(placemark.location!.coordinate.longitude)")
        }
    }

    shouldKeepRunning = false
}

while shouldKeepRunning == true &&
    runLoop.runMode(NSDefaultRunLoopMode, beforeDate: distantFuture) {}
