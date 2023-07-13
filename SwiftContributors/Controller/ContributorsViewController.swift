//
//  ContributorsViewController.swift
//  SwiftContributors
//
//  Created by Cedrik on 13/07/2023.
//

import UIKit

class ContributorsViewController: UIViewController {
    
    private var viewModel = ContributorsViewModel()
    
    let contributorsCollectionView: UICollectionView = UICollectionView(frame: CGRect.zero, collectionViewLayout: UICollectionViewFlowLayout.init())
    let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout.init()
    
    // MARK: Lifecycle
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadContributors()
        setupViews()
        setupConstraints()
        
    }
    
    // MARK: Setup
    
    private func setupViews() {
        view.addSubview(contributorsCollectionView)
        layout.scrollDirection = UICollectionView.ScrollDirection.vertical
        contributorsCollectionView.setCollectionViewLayout(layout, animated: true)
        contributorsCollectionView.delegate = self
        contributorsCollectionView.dataSource = self
        contributorsCollectionView.register(CustomCollectionViewCell.self, forCellWithReuseIdentifier: "cell")
        contributorsCollectionView.backgroundColor = UIColor.clear
      
    }
    
    func setupConstraints() {
        contributorsCollectionView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            contributorsCollectionView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
            contributorsCollectionView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            contributorsCollectionView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
            contributorsCollectionView.trailingAnchor.constraint(equalTo: view.trailingAnchor)
        ])
    }
  
    private func loadContributors() {
        Task {
            await self.viewModel.getAllContributors()
            self.contributorsCollectionView.reloadData()
        }
    }
}
// MARK: - UICollectionViewDataSource

extension ContributorsViewController: UICollectionViewDataSource {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        viewModel.contributors.count
    }

    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = contributorsCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! CustomCollectionViewCell
        cell.configure(with: viewModel.contributors[indexPath.item])
        return cell
    }
    
}
// MARK: - UICollectionViewDelegate

extension ContributorsViewController: UICollectionViewDelegate {

    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("touched cell")
    }
}
// MARK: - UICollectionViewDelegateFlowLayout

extension ContributorsViewController: UICollectionViewDelegateFlowLayout {
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAt indexPath: IndexPath) -> CGSize {
        let width = (collectionView.bounds.width - 10) / 2
        return CGSize(width: width, height: 50)
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumLineSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }

    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, minimumInteritemSpacingForSectionAt section: Int) -> CGFloat {
        return 5
    }
}
