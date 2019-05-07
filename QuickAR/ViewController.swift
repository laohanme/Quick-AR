//
//  ViewController.swift
//  QuickAR
//
//  Created by laohanme on 07/05/2019.
//  Copyright © 2019 laohanme. All rights reserved.
//

import UIKit
import QuickLook

class ViewController: UITableViewController, QLPreviewControllerDelegate, QLPreviewControllerDataSource {
    
    let models = ["redchair", "cupandsaucer", "tulip"]
    let modelsCell = "modelCell"
    
    var thumbnails = [UIImage]()
    var thumbnailIndex = 0

    override func viewDidLoad() {
        super.viewDidLoad()
        
        title = "Quick AR"
        navigationController?.navigationBar.prefersLargeTitles = true
        navigationController?.navigationItem.largeTitleDisplayMode = .always
        
        tableView.tableFooterView = UIView()
        tableView.register(UINib(nibName: "ModelCell", bundle: nil), forCellReuseIdentifier: modelsCell)
        tableView.reloadData()
        
        for model in models {
            if let thumbnail = UIImage(named: "\(model).jpg") {
                thumbnails.append(thumbnail)
            }
        }
    }


    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return models.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: modelsCell, for: indexPath) as! ModelCell
        
        cell.modelImage.image = thumbnails[indexPath.item]
        let title = models[indexPath.item]
        cell.modelName.text = title.capitalized
        
        return cell
    }
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        thumbnailIndex = indexPath.item
        
        let previewController = QLPreviewController()
        previewController.dataSource = self
        previewController.delegate = self
        present(previewController, animated: true)
    }
    
    func numberOfPreviewItems(in controller: QLPreviewController) -> Int {
        return 1
    }
    
    func previewController(_ controller: QLPreviewController, previewItemAt index: Int) -> QLPreviewItem {
        let url = Bundle.main.url(forResource: models[thumbnailIndex], withExtension: "usdz")!
        return url as QLPreviewItem
    }
}

