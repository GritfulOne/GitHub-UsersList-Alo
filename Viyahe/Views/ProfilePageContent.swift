//
//  ProfilePageContent.swift
//  Viyahe
//
//  Created by Gino Simon Alo on 5/5/21.
//

import UIKit
import AlamofireImage
import SnapKit

class ProfilePageContent: UIView {
    
    var user: User? {
        didSet {
            guard let user = user else { return }
            avatarImageView.image = nil
            if let avatarURL = user.getAvatarURL() {
                avatarImageView.af.setImage(withURL: avatarURL, cacheKey: avatarURL.absoluteString + "for-profile-content")
            }
            
            followingLabel.text = "Following: \(user.getFollowing() ?? 0)"
            followersLabel.text = "Followers: \(user.getFollowers() ?? 0)"
            
            let personalInfoLabels = ["NAME:", user.getFullName()?.capitalized ?? ""]
            userPersonalDetailsLabelsStackView.setup(labels: personalInfoLabels)
            
            let professionalInfoLabels = ["Account Type: \(user.getType())", "Organization: \(user.getOrganization() ?? "")"]
            userProfessionalDetailsLabelsStackView.setup(labels: professionalInfoLabels)
        }
    }
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView()
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 2
        imageView.layer.borderColor = UIColor.black.cgColor
        return imageView
    }()
    
    private let followingLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private let followersLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private let userPersonalDetailsLabelsStackView = LabelsStackView()
    private let userProfessionalDetailsLabelsStackView = LabelsStackView()
    
    init() {
        super.init(frame: .zero)
        
        addSubview(avatarImageView)
        addSubview(followingLabel)
        addSubview(followersLabel)
        addSubview(userPersonalDetailsLabelsStackView)
        addSubview(userProfessionalDetailsLabelsStackView)
        
        avatarImageView.snp.makeConstraints { (make) in
            make.top.leading.trailing.equalToSuperview().inset(16)
            make.height.equalTo(150)
        }
        
        followingLabel.snp.makeConstraints { (make) in
            make.leading.equalTo(avatarImageView).offset(16)
            make.top.equalTo(avatarImageView.snp.bottom).offset(8)
        }
        
        followersLabel.snp.makeConstraints { (make) in
            make.trailing.equalTo(avatarImageView.snp.trailing).offset(-16)
            make.top.equalTo(avatarImageView.snp.bottom).offset(8)
        }
        
        userPersonalDetailsLabelsStackView.snp.makeConstraints { (make) in
            make.top.equalTo(followingLabel.snp.bottom).offset(24)
            make.leading.trailing.equalTo(avatarImageView)
        }
        
        userProfessionalDetailsLabelsStackView.snp.makeConstraints { (make) in
            make.top.equalTo(userPersonalDetailsLabelsStackView.snp.bottom).offset(24)
            make.leading.trailing.equalTo(avatarImageView)
            make.bottom.equalToSuperview()
        }
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}

private final class LabelsStackView: UIView {
    init() {
        super.init(frame: .zero)

        layer.borderColor = UIColor.black.cgColor
        layer.borderWidth = 2
    }
    
    required init(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup(labels: [String?]) {
        subviews.forEach {
            $0.removeFromSuperview()
        }
        
        var lastSubview: UIView!
        for index in 0..<labels.count {
            let labelText = labels[index]
            let uiLabel = UILabel()
            uiLabel.font = UIFont.boldSystemFont(ofSize: 14)
            uiLabel.text = labelText
            
            addSubview(uiLabel)
            
            if index == 0 {
                uiLabel.snp.makeConstraints { (make) in
                    make.top.equalToSuperview().inset(8)
                    make.leading.trailing.equalToSuperview().inset(8)
                }
            } else {
                uiLabel.snp.makeConstraints { (make) in
                    make.top.equalTo(lastSubview.snp.bottom).offset(8)
                    make.leading.trailing.equalToSuperview().inset(8)
                }
                
                if index == labels.count - 1 {
                    uiLabel.snp.makeConstraints { (make) in
                        make.bottom.equalToSuperview().inset(8)
                    }
                }
            }
            
            lastSubview = uiLabel
        }

        setNeedsLayout()
        layoutIfNeeded()
    }
}
