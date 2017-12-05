//
//  CervejasTableViewController.swift
//  RM35605
//
//  Created by Washington Alexandre Silva on 02/12/2017.
//  Copyright © 2017 Washington Alexandre Silva. All rights reserved.
//

import UIKit
import Kingfisher

class CervejasTableViewController: UITableViewController {
    
    var cervejas: [Cerveja] = []
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    func carregarCervejas() {
        RestCerveja.carregaCervejas { (cervejas: [Cerveja]?) in
            if let cervejas = cervejas {
                self.cervejas = cervejas
                DispatchQueue.main.async {
                    self.tableView.reloadData()
                }
            }
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        self.navigationController?.navigationBar.topItem?.title = "Lista de Cervejas"
        carregarCervejas()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let vc = segue.destination as! DetalheViewController
        vc.cerveja = cervejas[tableView.indexPathForSelectedRow!.row]
    }
    
    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return cervejas.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "cervejaCell", for: indexPath) as! CervejaTableViewCell
        let cerveja = cervejas[indexPath.row]
        cell.lbName.text = cerveja.name
        cell.lbAbv.text = "Teor Alcoolico: \(cerveja.abv)"
        if let url = URL(string: cerveja.img_url) {
            cell.ivImg.kf.setImage(with: url)
        }
        return cell
    }
}
