//
//  PokemonDetailView.swift
//  PokemonMaster
//
//  Created by Maximiliano Ovando Ramírez on 12/07/23.
//

import UIKit
import SwiftUI

final class PokemonDetailView: UIView {

    // MARK: - UIComponets
    var headerPokemonInfoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .fillProportionally
        stack.alignment = .bottom
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    var pokemonNameLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = LocalizedKeys.GeneralTexts.dummyPokemonName
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var pokemonIDLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = LocalizedKeys.GeneralTexts.dummyID
        label.font = .systemFont(ofSize: 18, weight: .bold)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var generalPokemonInfoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .equalSpacing
        stack.alignment = .bottom
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    var tagsPokemonInfoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .horizontal
        stack.spacing = 5
        stack.distribution = .fillEqually
        stack.alignment = .bottom
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    var pokemonTagDefaultLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = LocalizedKeys.GeneralTexts.dummyType
        label.font = .systemFont(ofSize: 15, weight: .bold)
        label.textAlignment = .center
        label.backgroundColor = .whiteTrasnparent
        label.clipsToBounds = true
        label.layer.cornerRadius = 10
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var pokemonTypeLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = LocalizedKeys.GeneralTexts.dymmyTypePokemon
        label.font = .systemFont(ofSize: 12, weight: .bold)
        label.textAlignment = .right
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var logoPokeballImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .pokeballLogo?.withRenderingMode(.alwaysTemplate)
        imageView.contentMode = .scaleAspectFit
        imageView.tintColor = .white
        imageView.alpha = 0.5
        imageView.startRotationAnimation(animationDuration: 5.0)
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var elementDecorationView: ElementView = {
        let view = ElementView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var circulesElementDecorationView: CirculesElementView = {
        let view = CirculesElementView()
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var pokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .pokemonDummy?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .black
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var beforePokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .pokemonDummy?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .black
        imageView.alpha = 0.50
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var nextPokemonImage: UIImageView = {
        let imageView = UIImageView()
        imageView.image = .pokemonDummy2?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .black
        imageView.alpha = 0.50
        imageView.contentMode = .scaleAspectFill
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()

    var contentInfoView: UIView = {
        let view = UIView()
        view.backgroundColor = .white
        view.clipsToBounds = true
        view.layer.cornerRadius = 25
        view.layer.maskedCorners = [.layerMaxXMinYCorner, .layerMinXMinYCorner]
        view.translatesAutoresizingMaskIntoConstraints = false
        return view
    }()

    var aboutPokemonLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = LocalizedKeys.GeneralTexts.aboutTitle
        label.font = .systemFont(ofSize: 28, weight: .bold)
        label.textAlignment = .center
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var aboutContentPokemonLabel: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = LocalizedKeys.GeneralTexts.dummyStringContent
        label.font = .systemFont(ofSize: 18)
        label.numberOfLines = 0
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()

    var descriptionScroll: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.bounces = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    var contentPokemonInfoStack: UIStackView = {
        let stack = UIStackView()
        stack.axis = .vertical
        stack.spacing = 5
        stack.distribution = .fill
        stack.translatesAutoresizingMaskIntoConstraints = false
        return stack
    }()

    var loaderView: UIView = {
        let view = UIView()
        view.backgroundColor = .whiteTrasnparent
        view.translatesAutoresizingMaskIntoConstraints = false

        let pokeballImage = UIImageView()
        pokeballImage.image = .pokeballLogo
        pokeballImage.contentMode = .scaleAspectFill
        pokeballImage.translatesAutoresizingMaskIntoConstraints = false

        view.addSubview(pokeballImage)

        NSLayoutConstraint.activate([
            pokeballImage.centerYAnchor.constraint(equalTo: view.centerYAnchor),
            pokeballImage.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            pokeballImage.heightAnchor.constraint(equalTo: pokeballImage.widthAnchor, multiplier: 1),
            pokeballImage.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 7/8)
        ])

        pokeballImage.startRotationAnimation(animationDuration: 5.0)
        return view
    }()

    // MARK: - Inicializadores
    override init(frame: CGRect) {
        super.init(frame: .zero)
        backgroundColor = .firePokemonColor
        clipsToBounds = true
        setup()
    }

    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }

    private func setup() {
        addSubviews()
        configureConstraints()
    }

    private func addSubviews() {

        // MARK: - Primera capa de vista
        [elementDecorationView, circulesElementDecorationView, headerPokemonInfoStack, generalPokemonInfoStack, logoPokeballImage, contentInfoView, pokemonImage, nextPokemonImage, beforePokemonImage, loaderView].forEach(addSubview)
        [pokemonNameLabel, pokemonIDLabel].forEach(headerPokemonInfoStack.addArrangedSubview)

        // MARK: - Segunda capa de vista
        [tagsPokemonInfoStack, pokemonTypeLabel].forEach(generalPokemonInfoStack.addArrangedSubview)
        [pokemonTagDefaultLabel].forEach(tagsPokemonInfoStack.addArrangedSubview)

        // MARK: - Tercera capa de vista
        [aboutPokemonLabel, descriptionScroll].forEach(contentInfoView.addSubview)
        [contentPokemonInfoStack].forEach(descriptionScroll.addSubview)
        [aboutContentPokemonLabel].forEach(contentPokemonInfoStack.addArrangedSubview)

    }

    private func configureConstraints() {

        setupHeadersConstrains()
        setupImagesConstrains()
        setupContentConstrains()
        setupLoadingConstrains()

    }

    private func setupHeadersConstrains() {

        // Constrains de los elementos visuales
        NSLayoutConstraint.activate([

            elementDecorationView.topAnchor.constraint(equalTo: topAnchor),
            elementDecorationView.leadingAnchor.constraint(equalTo: leadingAnchor),
            elementDecorationView.heightAnchor.constraint(equalToConstant: 120),
            elementDecorationView.widthAnchor.constraint(equalToConstant: 120),

            circulesElementDecorationView.topAnchor.constraint(equalTo: topAnchor),
            circulesElementDecorationView.centerXAnchor.constraint(equalTo: centerXAnchor, constant: 60),
            circulesElementDecorationView.heightAnchor.constraint(equalToConstant: 70),
            circulesElementDecorationView.widthAnchor.constraint(equalToConstant: 100)

        ])

        // Constrains de los elementos centrales
        NSLayoutConstraint.activate([

            headerPokemonInfoStack.topAnchor.constraint(equalTo: safeAreaLayoutGuide.topAnchor, constant: 20),
            headerPokemonInfoStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            headerPokemonInfoStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),

            generalPokemonInfoStack.topAnchor.constraint(equalTo: headerPokemonInfoStack.bottomAnchor, constant: 10),
            generalPokemonInfoStack.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 30),
            generalPokemonInfoStack.trailingAnchor.constraint(equalTo: trailingAnchor, constant: -30),

            logoPokeballImage.centerYAnchor.constraint(equalTo: contentInfoView.topAnchor),
            logoPokeballImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            logoPokeballImage.heightAnchor.constraint(equalToConstant: 250),
            logoPokeballImage.widthAnchor.constraint(equalTo: logoPokeballImage.heightAnchor, multiplier: 1)

        ])

    }

    private func setupImagesConstrains() {

        NSLayoutConstraint.activate([

            pokemonImage.centerXAnchor.constraint(equalTo: centerXAnchor),
            pokemonImage.bottomAnchor.constraint(equalTo: contentInfoView.topAnchor, constant: 60),
            pokemonImage.topAnchor.constraint(equalTo: generalPokemonInfoStack.bottomAnchor, constant: 30),
            pokemonImage.widthAnchor.constraint(equalTo: logoPokeballImage.heightAnchor, multiplier: 1),

            beforePokemonImage.centerYAnchor.constraint(equalTo: pokemonImage.centerYAnchor),
            beforePokemonImage.centerXAnchor.constraint(equalTo: leadingAnchor, constant: -15),
            beforePokemonImage.heightAnchor.constraint(equalTo: pokemonImage.heightAnchor, multiplier: 0.4),
            beforePokemonImage.widthAnchor.constraint(equalTo: beforePokemonImage.heightAnchor, multiplier: 1),

            nextPokemonImage.centerYAnchor.constraint(equalTo: pokemonImage.centerYAnchor),
            nextPokemonImage.centerXAnchor.constraint(equalTo: trailingAnchor, constant: 15),
            nextPokemonImage.heightAnchor.constraint(equalTo: pokemonImage.heightAnchor, multiplier: 0.4),
            nextPokemonImage.widthAnchor.constraint(equalTo: nextPokemonImage.heightAnchor, multiplier: 1)

        ])

    }

    private func setupContentConstrains() {

        NSLayoutConstraint.activate([

            contentInfoView.topAnchor.constraint(equalTo: generalPokemonInfoStack.bottomAnchor, constant: 250),
            contentInfoView.leadingAnchor.constraint(equalTo: leadingAnchor, constant: 0),
            contentInfoView.trailingAnchor.constraint(equalTo: trailingAnchor, constant: 0),
            contentInfoView.bottomAnchor.constraint(equalTo: bottomAnchor, constant: 0),

            aboutPokemonLabel.topAnchor.constraint(equalTo: pokemonImage.bottomAnchor),
            aboutPokemonLabel.leadingAnchor.constraint(equalTo: contentInfoView.leadingAnchor, constant: 20),
            aboutPokemonLabel.trailingAnchor.constraint(equalTo: contentInfoView.trailingAnchor, constant: -20),

            descriptionScroll.topAnchor.constraint(equalTo: aboutPokemonLabel.bottomAnchor, constant: 20),
            descriptionScroll.leadingAnchor.constraint(equalTo: contentInfoView.leadingAnchor, constant: 20),
            descriptionScroll.trailingAnchor.constraint(equalTo: contentInfoView.trailingAnchor, constant: -20),
            descriptionScroll.bottomAnchor.constraint(equalTo: contentInfoView.bottomAnchor, constant: -20),

            contentPokemonInfoStack.topAnchor.constraint(equalTo: descriptionScroll.topAnchor),
            contentPokemonInfoStack.leadingAnchor.constraint(equalTo: descriptionScroll.leadingAnchor),
            contentPokemonInfoStack.trailingAnchor.constraint(equalTo: descriptionScroll.trailingAnchor),
            contentPokemonInfoStack.bottomAnchor.constraint(equalTo: descriptionScroll.bottomAnchor),
            contentPokemonInfoStack.widthAnchor.constraint(equalTo: descriptionScroll.widthAnchor, multiplier: 1)

        ])

    }

    private func setupLoadingConstrains() {

        NSLayoutConstraint.activate([

            loaderView.topAnchor.constraint(equalTo: topAnchor),
            loaderView.leadingAnchor.constraint(equalTo: leadingAnchor),
            loaderView.trailingAnchor.constraint(equalTo: trailingAnchor),
            loaderView.bottomAnchor.constraint(equalTo: bottomAnchor)

        ])

    }

    // MARK: - Funciones
    public func setPokemonInformation(pokemonData info: PokemonInformation) {

        // Pokemon General Information
        pokemonNameLabel.text = info.pokemonName
        pokemonIDLabel.text = info.pokemonID
        setTypesInfo(pokemonTypes: info.pokemonTypes)
        pokemonTypeLabel.text = info.pokemonType
        aboutContentPokemonLabel.text = info.pokemonDescription.clearText()

        // Ajuste en los colores y contraste
        [pokemonNameLabel, pokemonIDLabel, pokemonTypeLabel].forEach({$0.textColor = info.pokemonColorText})
        backgroundColor = info.pokemonBackground

        // Integracion de los tipos
        tagsPokemonInfoStack.subviews.forEach { view in
            if let labelTag = view.subviews.first as? UILabel {
                labelTag.textColor = info.pokemonColorText
            }
        }

        // Configuracion de Imagenes de pokemon
        self.pokemonImage.image = info.pokemonImage ?? UIImage.pokemonDummy2
        self.pokemonImage.contentMode = .scaleAspectFill

        beforePokemonImage.isHidden = true
        nextPokemonImage.isHidden = true

        if let beforePokemonImage = info.beforePokemonImage {
            self.beforePokemonImage.image = beforePokemonImage.withRenderingMode(.alwaysTemplate)
            self.beforePokemonImage.contentMode = .scaleAspectFill
            self.beforePokemonImage.isHidden = false
        }

        if let nextPokemonImage = info.nextPokemonImage {
            self.nextPokemonImage.image = nextPokemonImage.withRenderingMode(.alwaysTemplate)
            self.nextPokemonImage.contentMode = .scaleAspectFill
            self.nextPokemonImage.isHidden = false
        }

    }

    public func addGesture(viewController: UIViewController, beforeSelected: Selector, nextSelected: Selector, swipeSeleted: Selector) {
        beforePokemonImage.isUserInteractionEnabled = true
        nextPokemonImage.isUserInteractionEnabled = true
        pokemonImage.isUserInteractionEnabled = true

        beforePokemonImage.addGestureRecognizer(UITapGestureRecognizer(target: viewController, action: beforeSelected))

        nextPokemonImage.addGestureRecognizer(UITapGestureRecognizer(target: viewController, action: nextSelected))

        let swipeGestureRecognizer = UISwipeGestureRecognizer(target: viewController, action: swipeSeleted)
        swipeGestureRecognizer.direction = .left

        pokemonImage.addGestureRecognizer(swipeGestureRecognizer)

        let swipeGestureRecognizer2 = UISwipeGestureRecognizer(target: viewController, action: swipeSeleted)
        swipeGestureRecognizer2.direction = .right

        pokemonImage.addGestureRecognizer(swipeGestureRecognizer2)

    }

    private func setTypesInfo(pokemonTypes types: [String]) {
        tagsPokemonInfoStack.subviews.forEach({$0.removeFromSuperview()})
        pokemonTagDefaultLabel.isHidden = true

        let tags: [UIView] = types.compactMap({ type in
            return .getTagView(type: type)
        })

        tags.forEach(tagsPokemonInfoStack.addArrangedSubview)
    }

}

 struct PokemonDetailView_Previews: PreviewProvider {
    static var previews: some View {
        ViewControllerPreview {
            PokemonDetailViewController.create(with: PokemonDetailViewModel())
        }
    }
 }
