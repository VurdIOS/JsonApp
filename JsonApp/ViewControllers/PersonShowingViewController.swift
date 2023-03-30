//
//  ViewController.swift
//  JsonApp
//
//  Created by Камаль Атавалиев on 20.03.2023.
//

var favoriteList: [[User]] = []

import UIKit
import SpringAnimation
final class PersonShowingViewController: UIViewController {
    
    @IBOutlet var personInfoLabel: UILabel!
    
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var dislikeButton: UIButton!
    
    
    @IBOutlet var startMeetingButton: SpringButton!
    
    @IBOutlet var personImageView: UIImageView!
    
    var randomPerson: [User] = []
    let personModel = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
        buttonsShowOrHidden(true)
        animatingstartButtonIN()
    }
    
    @IBAction func startMeetingTapped() {
        downloadData()
        animatingstartButtonOUT()
        buttonsShowOrHidden(false)
    }
    
    @IBAction func chooseButton(_ sender: UIButton) {
        switch sender {
        case likeButton:
            downloadData()
            favoriteList.append(randomPerson)
        default:
            downloadData()
        }
    }

    func downloadData () {
        personModel.fetchPerson { [self] result in
            switch result {
            case .success(let person):
                self.randomPerson = person
                self.setPersonLabels()
                print(self.randomPerson)
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func setPersonLabels() {
        let person = randomPerson[0]
        
        personInfoLabel.text =
"""
\(person.name.first) \(person.name.last), \(Int.random(in: 18...35))
\(person.location.country), \(person.location.city)
Почта: \(person.email)
Национальность: \(person.nat)

"""
        personModel.fetchPersonData(from: person.picture.large) { [self] result in
            switch result {
            case .success(let imageData):
                self.personImageView.image = UIImage(data: imageData)
            case .failure(let error):
                print(error)
            }
        }
    }
}


extension PersonShowingViewController {
    
    func buttonsShowOrHidden(_ hidden: Bool) {
        likeButton.isHidden = hidden
        dislikeButton.isHidden = hidden
        personInfoLabel.isHidden = hidden
        tabBarController?.tabBar.isHidden = hidden
        startMeetingButton.isHidden = !hidden
    }
    func animatingstartButtonIN() {
        startMeetingButton.animation = "shake"
        startMeetingButton.curve = "easeInOutCubic"
        startMeetingButton.force = 0.57
        startMeetingButton.duration = 1.79
        startMeetingButton.delay = 0.5
        startMeetingButton.animate()
    }
    func animatingstartButtonOUT() {
        startMeetingButton.animation = "fadeOut"
        startMeetingButton.curve = "linear"
        startMeetingButton.force = 1.4
        startMeetingButton.duration = 2
        startMeetingButton.delay = 0
        startMeetingButton.animate()
    }
}
