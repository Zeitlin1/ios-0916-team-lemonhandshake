//
//  GeoFire.swift
//  LemonHandshake
//
//  Created by Christopher Boynton on 11/22/16.
//  Copyright © 2016 Flatiron School. All rights reserved.
//

import Foundation
import CoreLocation
import GeoFire
import FirebaseDatabase
import FirebaseAuth

class FirebaseInteractor {
    private init() {}
    
    typealias Kilometers = Double
    
    static func geofireTest() -> [String] {
        
        
        var keys = [String]()
        
        print("KEY SAMPLE: \(FIRDatabase.database().reference().childByAutoId().key)")
        
        FIRAuth.auth()?.signInAnonymously(completion: { (user, error) in
            print("Authenticated")
            
            let center = CLLocation(latitude: 40.705248, longitude: -74.014068)
            
            let geofireRef = FIRDatabase.database().reference().child("geofire")
            let geoFire = GeoFire(firebaseRef: geofireRef)
            
            geofireRef.observeSingleEvent(of: .value, with: { (snapshot) in
                dump(snapshot)
            })
            
            var circleQuery = geoFire?.query(at: center, withRadius: 10)
            
            var queryHandle = circleQuery?.observe(.keyEntered) { (key, location) in
                print("Circle query observe")
                keys.append(key!)
            }
            
            
//            geoFire?.getLocationForKey("-KXCD5L2nf9SGjP_2QyT", withCallback: { (location, error) in
//                if let error = error {
//                    print("ERROR: \(error.localizedDescription)")
//                } else if let location = location {
//                    print("SUCCESS: \(location.coordinate)")
//                } else {
//                    print("FAILURE: No locations with key: \("-KXCD5L2nf9SGjP_2QyT")")
//                }
//            })
        })
        
        
    
        
//        print("Query Handle: \(queryHandle)")
        
        return keys
    }
}
