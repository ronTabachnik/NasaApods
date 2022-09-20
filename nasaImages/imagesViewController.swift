//
//  imagesViewController.swift
//  nasaImages
//
//  Created by Ron Tabachnik on 2022-09-10.
//

import UIKit
import Foundation


class imagesViewController: UIViewController,ApodManagerDelegate {
    
    
    @IBOutlet weak var spinner: UIActivityIndicatorView!
    @IBOutlet weak var apodsTableView: UITableView!
    var apodManager = ApodManager()
    var apod: [Apod] = []
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        spinner.startAnimating()
        spinner.hidesWhenStopped = true
        apodsTableView.isHidden = true
        apodManager.delegate = self
        apodsTableView.delegate = self
        apodsTableView.dataSource = self
        
        // Do any additional setup after loading the view.
        activateFunc()
        
    }
    func didUpdateApod(apods: [Apod]) {
        for i in apods{
            apod.append(i)
        }
        DispatchQueue.main.async {
            self.apodsTableView.reloadData()
            self.spinner.stopAnimating()
            self.apodsTableView.isHidden = false
        }
    }
    
    
    func activateFunc(){
        self.apodManager.performRequest()
    }
    
}

extension imagesViewController: UITableViewDataSource,UITableViewDelegate {
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 120
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        guard let vc = segue.destination as? ApodPage,
              let index = apodsTableView.indexPathForSelectedRow?.row
        else{
            return
        }
        vc.apod = apod[index]
    }
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
    }
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return apod.count
    }
    
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = apodsTableView.dequeueReusableCell(withIdentifier: "apodCell") as! CustomCell
        let selected = apod[indexPath.row]
        cell.selectionStyle = .blue
        cell.apodImageView.image = selected.image
        cell.apodImageView.layer.cornerRadius = 20
        cell.apodImageView.clipsToBounds = true
        cell.apodTitleView.text = selected.title
        cell.apodDateView.text = selected.date
        return cell
    }
    
}
