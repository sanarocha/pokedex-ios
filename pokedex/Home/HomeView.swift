//
//  HomeView.swift
//  pokedex
//
//  Created by Rossana Rocha on 13/07/22.
//

import UIKit

final class HomeView: UIView {
    
    private lazy var flowLayout: UICollectionViewFlowLayout = {
        let flowLayout = UICollectionViewFlowLayout()
        flowLayout.estimatedItemSize = UICollectionViewFlowLayout.automaticSize
        flowLayout.minimumInteritemSpacing = 8
        return flowLayout
    }()
    
    private lazy var collectionView: UICollectionView = {
        let collectionView = UICollectionView(frame: .zero, collectionViewLayout: self.flowLayout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.backgroundColor = .clear
        collectionView.collectionViewLayout = self.flowLayout
        collectionView.register(PokemonCollectionViewCell.self, forCellWithReuseIdentifier: "pokemonCell")
        collectionView.register(PokedexHeaderView.self,
                                forSupplementaryViewOfKind: UICollectionView.elementKindSectionHeader,
                                withReuseIdentifier: "pokedexHeaderView")
        collectionView.showsVerticalScrollIndicator = false
        return collectionView
    }()
    
    private let statusBarBackgroundView: UIView = {
        let view = UIView()
        view.backgroundColor = .lightGray.withAlphaComponent(0.8)
        view.isHidden = true
        return view
    }()
    
    // MARK: - Init
    init() {
        super.init(frame: .zero)
        self.backgroundColor = .background
        self.setupLayout()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}

// MARK: - Delegate and DataSource
extension HomeView: UICollectionViewDataSource, UICollectionViewDelegate, UICollectionViewDelegateFlowLayout  {

    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 20
    }

    func collectionView(_ collectionView: UICollectionView,
                        cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "pokemonCell", for: indexPath) as? PokemonCollectionViewCell
        return cell ?? UICollectionViewCell()
    }
    
    func collectionView(_ collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, at indexPath: IndexPath) -> UICollectionReusableView {
        let headerView = collectionView.dequeueReusableSupplementaryView(ofKind:
                                                                            UICollectionView.elementKindSectionHeader,
                                                                         withReuseIdentifier: "pokedexHeaderView",
                                                                         for: indexPath)
        return headerView
    }
    
    
    func collectionView(_ collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        return CGSize(width: collectionView.layer.bounds.width, height: 120) //add your height here
    }
    
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        UIView.animate(withDuration: 0.5) { [weak self] in
            guard let self = self else { return }
            let contentOffset = scrollView.contentOffset.y
            let safeAreaTopHeight = self.safeAreaInsets.top
            self.statusBarBackgroundView.isHidden = contentOffset < safeAreaTopHeight
        }
    }
    
}

// MARK: - Layout
extension HomeView {
    
    private func setupLayout() {
        setupCollectionView()
        setupStatusBarBackgroundView()
    }
    
    private func setupCollectionView() {
        self.addSubview(collectionView)
        
        collectionView.snp.makeConstraints { make in
            make.leading.trailing.equalToSuperview().inset(16)
            make.topMargin.bottom.equalToSuperview()
        }
    }
    
    private func setupStatusBarBackgroundView() {
        self.addSubview(statusBarBackgroundView)
        
        statusBarBackgroundView.snp.makeConstraints { make in
            make.leading.trailing.top.equalToSuperview()
            make.height.equalTo(45)
        }
    }
}
