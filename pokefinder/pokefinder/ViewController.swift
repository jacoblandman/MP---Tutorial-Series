//
//  ViewController.swift
//  pokefinder
//
//  Created by Jacob Landman on 1/18/17.
//  Copyright © 2017 Jacob Landman. All rights reserved.
//

import UIKit
import MapKit
import FirebaseDatabase

class ViewController: UIViewController, MKMapViewDelegate, CLLocationManagerDelegate {
    
    @IBOutlet weak var mapView: MKMapView!
    
    let locationManager = CLLocationManager()
    var mapHasCenteredOnce = false
    var geoFire: GeoFire!
    var geoFireRef: FIRDatabaseReference!
    var queries = [GFCircleQuery]()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        mapView.delegate = self
        mapView.userTrackingMode = MKUserTrackingMode.follow
        
        geoFireRef = FIRDatabase.database().reference()
        geoFire = GeoFire(firebaseRef: geoFireRef)
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        
        locationAuthStatus()
    }

    func locationAuthStatus() {
        if CLLocationManager.authorizationStatus() == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        } else {
            locationManager.requestWhenInUseAuthorization()
        }
    }
    
    func locationManager(_ manager: CLLocationManager, didChangeAuthorization status: CLAuthorizationStatus) {
        
        if status == .authorizedWhenInUse {
            mapView.showsUserLocation = true
        }
    }
    
    func centerMapOnLocation(location: CLLocation) {
        let coordinateRegion = MKCoordinateRegionMakeWithDistance(location.coordinate, 2000, 2000)
        
        mapView.setRegion(coordinateRegion, animated: true)
    }
    
    func mapView(_ mapView: MKMapView, didUpdate userLocation: MKUserLocation) {
        
        if let loc = userLocation.location {
            if !mapHasCenteredOnce {
                centerMapOnLocation(location: loc)
                mapHasCenteredOnce = true
            }
        }
    }
    
    func mapView(_ mapView: MKMapView, viewFor annotation: MKAnnotation) -> MKAnnotationView? {
        
        let annoIdentifier = "Pokemon"
        var annotationView: MKAnnotationView?
        
        if annotation.isKind(of: MKUserLocation.self) {
            annotationView = MKAnnotationView(annotation: annotation, reuseIdentifier: "User")
            annotationView?.image = UIImage(named: "ash")
        } else if let deqAnno = mapView.dequeueReusableAnnotationView(withIdentifier: annoIdentifier) {
            annotationView = deqAnno
            annotationView?.annotation = annotation
        } else {
            let av = MKAnnotationView(annotation: annotation, reuseIdentifier: annoIdentifier)
            av.rightCalloutAccessoryView = UIButton(type: .detailDisclosure)
            annotationView = av
        }
        
        if let annotationView = annotationView, let anno = annotation as? PokeAnnotation {
            // need to set annotation title to show callout
            annotationView.canShowCallout = true
            annotationView.image = UIImage(named: "\(anno.pokeId)")
            let btn = UIButton()
            btn.frame = CGRect(x: 0, y: 0, width: 30, height: 30)
            btn.setImage(UIImage(named: "map"), for: .normal)
            annotationView.rightCalloutAccessoryView = btn
            
            let btn2 = UIButton()
            btn2.frame = CGRect(x: 0, y: 0, width: 90, height: 30)
            btn2.setTitle("Remove", for: UIControlState.normal)
            btn2.setTitleColor(UIColor.red, for: .normal)
            annotationView.leftCalloutAccessoryView = btn2
        }
        
        return annotationView
    }
    
    func mapView(_ mapView: MKMapView, regionWillChangeAnimated animated: Bool) {
        let loc = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
        
        showSightingsOnMap(location: loc)
    }

    func createSighting(forLocation location: CLLocation, withPokemon pokeId: Int) {
        var key = Geohash.encode(latitude: location.coordinate.latitude, longitude: location.coordinate.longitude, length: 10)
        key = "\(key)\(pokeId)"
        geoFire.setLocation(location, forKey: key)
    }
    
    func showSightingsOnMap(location: CLLocation) {
        
        let annotations = mapView.annotations
        mapView.removeAnnotations(annotations)
        
        let circleQuery = geoFire!.query(at: location, withRadius: 2.5)
        _ = circleQuery?.observe(GFEventType.keyEntered, with: { (key, location) in
            
            if let key = key, let location = location {
                let keyLength = key.characters.count
                let charc = Array(key.characters)
                let idArray = charc.suffix(keyLength - 10)
                var id: String = ""
                for element in idArray { id.append(element) }
                let anno = PokeAnnotation(coordinate: location.coordinate, pokeId: Int(id)!, key: key)
                self.mapView.addAnnotation(anno)
                
            }
        })
    }
    
    func mapView(_ mapView: MKMapView, annotationView view: MKAnnotationView, calloutAccessoryControlTapped control: UIControl) {
        
        if control == view.leftCalloutAccessoryView  {
            if let anno = view.annotation as? PokeAnnotation {
                geoFire.removeKey("\(anno.key)")
                mapView.removeAnnotation(anno)
            }
        } else {
 
            if let anno = view.annotation as? PokeAnnotation {
                let place = MKPlacemark(coordinate: anno.coordinate)
                let destination = MKMapItem(placemark: place)
                destination.name = "Pokemon Sighting"
                let regionDistance: CLLocationDistance = 1000
                let regionSpan = MKCoordinateRegionMakeWithDistance(anno.coordinate, regionDistance, regionDistance)
    
                let options = [MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center), MKLaunchOptionsMapSpanKey:  NSValue(mkCoordinateSpan: regionSpan.span), MKLaunchOptionsDirectionsModeKey: MKLaunchOptionsDirectionsModeDriving] as [String : Any]
                
                MKMapItem.openMaps(with: [destination], launchOptions: options)
            }
        }
    }
    
    @IBAction func spotRandomPokemon(_ sender: Any) {
        
        let loc = CLLocation(latitude: mapView.centerCoordinate.latitude, longitude: mapView.centerCoordinate.longitude)
        
        let rand = arc4random_uniform(1) + 1
        createSighting(forLocation: loc, withPokemon: Int(rand))
    }

}

