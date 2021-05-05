//
//  UserTableViewCell.swift
//  Viyahe
//
//  Created by Gino Simon Alo on 5/4/21.
//

import UIKit
import SnapKit
import AlamofireImage

class UserTableViewCell: UITableViewCell {
    
    private let avatarImageView: UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 56, height: 56))
        imageView.contentMode = .scaleAspectFit
        imageView.layer.borderWidth = 2
        imageView.layer.cornerRadius = 28
        return imageView
    }()
    
    private let userNameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 18)
        return label
    }()
    
    private let htmlURLLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()
    
    private let nameLabel: UILabel = {
        let label = UILabel()
        label.font = UIFont.boldSystemFont(ofSize: 14)
        return label
    }()

    override init(style: UITableViewCell.CellStyle, reuseIdentifier: String?) {
        super.init(style: style, reuseIdentifier: reuseIdentifier)
        
        let containerView: UIView = {
            let view = UIView()
            view.layer.borderColor = UIColor.black.cgColor
            view.layer.borderWidth = 2
            return view
        }()
        
        let moreImageView = UIImageView(image: UIImage(named: "RightArrow")?.withTintColor(.appTheme))
        
        contentView.addSubview(containerView)
        
        containerView.snp.makeConstraints { (make) in
            make.top.bottom.equalToSuperview().inset(15)
            make.leading.trailing.equalToSuperview().inset(16)
        }
        
        containerView.addSubview(avatarImageView)
        containerView.addSubview(userNameLabel)
        containerView.addSubview(htmlURLLabel)
        containerView.addSubview(nameLabel)
        containerView.addSubview(moreImageView)
        
        avatarImageView.snp.makeConstraints { (make) in
            make.leading.equalTo(16)
            make.top.bottom.equalToSuperview().inset(24)
            make.size.equalTo(56).priority(.high)
        }
        
        moreImageView.snp.makeConstraints { (make) in
            make.trailing.equalToSuperview().inset(24)
            make.centerY.equalToSuperview()
        }
        
        htmlURLLabel.snp.makeConstraints { (make) in
            make.centerY.equalTo(avatarImageView)
            make.leading.equalTo(avatarImageView.snp.trailing).offset(16)
            make.trailing.equalTo(moreImageView.snp.leading).offset(-16)
        }
        
        userNameLabel.snp.makeConstraints { (make) in
            make.leading.trailing.equalTo(htmlURLLabel)
            make.bottom.equalTo(htmlURLLabel.snp.top)
        }
        
        nameLabel.snp.makeConstraints { (make) in
            make.top.equalTo(htmlURLLabel.snp.bottom)
            make.leading.trailing.equalTo(htmlURLLabel)
        }
        
    }
    
    func setup(withUser user: User?, avatarBorderColor: CGColor) {
        guard let user = user else { return }
        
        avatarImageView.image = nil //removes remnants of previous cell user's avatar
        avatarImageView.layer.borderColor = avatarBorderColor
        if let avatarURL = user.getAvatarURL() {
            let filter = AspectScaledToFillSizeWithRoundedCornersFilter(
                size: CGSize(width: 52, height: 52),
                radius: 26.0
            )
            avatarImageView.af.setImage(withURL: avatarURL, cacheKey: avatarURL.absoluteString, filter: filter)
        }
        
        userNameLabel.text = user.getUsername()
        htmlURLLabel.text = user.getHTMLURLString()
        nameLabel.text = user.getAlias()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}
