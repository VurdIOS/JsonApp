//
//  ViewController.swift
//  JsonApp
//
//  Created by Камаль Атавалиев on 20.03.2023.
//

import UIKit
import SpringAnimation
final class PersonShowingViewController: UIViewController {
    
    @IBOutlet var personInfoLabel: UILabel!
    
    @IBOutlet var likeButton: UIButton!
    @IBOutlet var dislikeButton: UIButton!
    
    
    @IBOutlet var startMeetingButton: SpringButton!
    
    @IBOutlet var personImageView: UIImageView!
    
    var randomPerson: [Person] = []
    var randomPersonForTestOnView: [Person] = []
    let personModel = NetworkManager.shared
    
    override func viewDidLoad() {
        super.viewDidLoad()
      buttonsShowOrHidden(true)
        animatingstartButtonIN()


    }
    
   
    @IBAction func startMeetingTapped() {
        getPerson()
        animatingstartButtonOUT()
        buttonsShowOrHidden(false)
        

    }
    
    @IBAction func chooseButtonTapped(_ sender: UIButton) {
        switch sender {
        case likeButton:
            getPerson()
        default:
            getPerson()
        }
    }
    
    func getPerson() {
        personModel.fetchPerson(from: Link.api.url) { [weak self] result in
            switch result {
            case .success(let person):
                print(person)
                self?.randomPerson = person.results
                self?.unZipPerson()
            case .failure(let error):
                print(error)
            }
        }
    }
    
    func unZipPerson() {
        randomPerson.forEach { person in
            personInfoLabel.text =
"""
\(person.name.first) \(person.name.last) \(Int.random(in: 18...35))
Город: \(person.location.city)
Почта: \(person.email)
Национальность: \(person.nat)

"""
            personModel.fetchPersonImage(from: person.picture.large) { [weak self] result in
                switch result {
                case .success(let personImage):
                    self?.personImageView.image = UIImage(data: personImage)
                    
                case .failure(let error):
                    print(error)
                }
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
//        startMeetingButton.isHidden = !hidden
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
