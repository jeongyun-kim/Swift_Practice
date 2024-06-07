//
//  View.swift
//  StretchyHeaderView
//
//  Created by 김정윤 on 5/27/24.
//

import UIKit
import SnapKit

class View: UIView {
    let scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.contentInsetAdjustmentBehavior = .never
        return scrollView
    }()
    
    let containerView = UIView()
    
    let image: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "profile")
        imageView.contentMode = .scaleAspectFill
        return imageView
    }()
    
    let imageContainer = UIView()
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        backgroundColor = .white
        setup()
        makeConstraints()
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setup() {
        containerView.addSubview(imageContainer)
        scrollView.addSubview(image)
        scrollView.addSubview(containerView)
        addSubview(scrollView)
    }
    
    func makeConstraints() {
        // 최상위 뷰
        // 전체화면 크기와 동일하며 움직이면 안되므로 모든 edge 고정
        scrollView.snp.makeConstraints { make in
            make.edges.equalTo(0)
        }
        // 스크롤뷰 내의 보이지 않는 자식 뷰
        // 이미지뷰의 bottom constraint를 위해 생성
        // 화면의 가장 위쪽에 나타나야해 Left.right.top은 부모와 동일하게
        imageContainer.snp.makeConstraints { make in
            make.left.right.top.equalToSuperview()
            make.height.equalTo(150)
        }
        // 이미지는 스크롤 진행도에 따라 늘어나야하므로 최상단은 부모뷰의 top으로 잡거나 safeAreaLayoutGuide에 고정
        // bottom의 경우, 스크롤뷰 내 imageContainer의 bottom으로 잡아줘서 스크롤이 되도록 해줌!
        image.snp.makeConstraints { make in
            make.left.right.equalToSuperview()
            make.top.equalTo(safeAreaLayoutGuide)
            make.bottom.equalTo(imageContainer)
        }
        
        containerView.snp.makeConstraints { make in
            make.edges.equalTo(0)
            make.width.equalTo(frame.width)
            make.left.right.top.equalToSuperview()
            make.height.equalTo(1000)
        }
    }
}
