//
//  ViewController.swift
//  URLSession
//
//  Created by Salih Yusuf Göktaş on 13.06.2023.
//

import UIKit

class ViewController: UIViewController {
	
	override func viewDidLoad() {
		super.viewDidLoad()
		
		//kisiEkle()
		//kisiSil()
		//kisiGuncelle()
		tumKisilerAl()
		//aramaYap()
	}
	
	func kisiEkle() {
		
		var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/insert_kisiler.php")!)
		
		request.httpMethod = "POST"
		
		let postString = "kisi_ad=TESTad&kisi_tel=TESTtel"
		
		request.httpBody = postString.data(using: .utf8)
		
		URLSession.shared.dataTask(with: request) { (data,response,error) in
			
			if error != nil || data == nil {
				print("Error")
				return
			}
			
			do {
				if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
					print(json)
				}
			} catch {
				print(error.localizedDescription)
			}
		}.resume()
		
	}
	
	func kisiSil() {
		
		var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/delete_kisiler.php")!)
		
		request.httpMethod = "POST"
		
		let postString = "kisi_id=119"
		
		request.httpBody = postString.data(using: .utf8)
		
		URLSession.shared.dataTask(with: request) { (data,response,error) in
			
			if error != nil || data == nil {
				print("Error")
				return
			}
			
			do {
				if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
					print(json)
				}
			} catch {
				print(error.localizedDescription)
			}
		}.resume()
		
	}
	
	func kisiGuncelle() {
		
		var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/update_kisiler.php")!)
		
		request.httpMethod = "POST"
		
		let postString = "kisi_id=118&kisi_ad=TESTadx&kisi_tel=TESTtelx"
		
		request.httpBody = postString.data(using: .utf8)
		
		URLSession.shared.dataTask(with: request) { (data,response,error) in
			
			if error != nil || data == nil {
				print("Error")
				return
			}
			
			do {
				if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
					print(json)
				}
			} catch {
				print(error.localizedDescription)
			}
		}.resume()
		
	}
	
	func tumKisilerAl() {
		
		var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler.php")!)
		
		URLSession.shared.dataTask(with: request) { (data,response,error) in
			
			if error != nil || data == nil {
				print("Error")
				return
			}
			
			do {
				if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
					
					if let kisiler = json["kisiler"] as? [[String:Any]] {
						
						for kisi in kisiler {
							
							print("Kisi id  : \(kisi["kisi_id"]!)")
							print("Kisi ad  : \(kisi["kisi_ad"]!)")
							print("Kisi tel : \(kisi["kisi_tel"]!)")
						}
					}
					
				
				}
			} catch {
				print(error.localizedDescription)
			}
		}.resume()
		
	}
	
	func aramaYap() {
		
		var request = URLRequest(url: URL(string: "http://kasimadalan.pe.hu/kisiler/tum_kisiler_arama.php")!)
		
		request.httpMethod = "POST"
		
		let postString = "kisi_ad=x"
		
		request.httpBody = postString.data(using: .utf8)
		
		URLSession.shared.dataTask(with: request) { (data,response,error) in
			
			if error != nil || data == nil {
				print("Error")
				return
			}
			
			do {
				if let json = try JSONSerialization.jsonObject(with: data!, options: []) as? [String:Any] {
					print(json)
				}
			} catch {
				print(error.localizedDescription)
			}
		}.resume()
		
	}
	
}
