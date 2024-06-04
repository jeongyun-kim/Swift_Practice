//
//  SceneDelegate.swift
//  Codebase_Newflix
//
//  Created by 김정윤 on 6/4/24.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?


    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        
        guard let windowScene = (scene as? UIWindowScene) else { return }
        // SceneDelegate의 프로퍼티에 설정
        window = UIWindow(windowScene: windowScene)
        
        // 각 뷰컨에 네비게이션 넣어주기
        let firstViewController = UINavigationController(rootViewController : ViewController())
        let secondViewController = UINavigationController(rootViewController: NewHotViewController())
        let thirdViewController = UINavigationController(rootViewController: SaveContentsViewController())
        
        // 탭바 구성
        let tabBarController = UITabBarController()
        tabBarController.setViewControllers([firstViewController, secondViewController, thirdViewController], animated: true)
        tabBarController.tabBar.tintColor = .white
        // 탭바 아이템 구성
        if let items = tabBarController.tabBar.items {
            items[0].selectedImage = UIImage(systemName: "play.house.fill")
            items[0].image = UIImage(systemName: "play.house")
            items[0].title = "홈"
            
            items[1].selectedImage = UIImage(systemName: "flame.fill")
            items[1].image = UIImage(systemName: "flame")
            items[1].title = "New & Hot"
            
            items[2].selectedImage = UIImage(systemName: "square.and.arrow.down.fill")
            items[2].image = UIImage(systemName: "square.and.arrow.down")
            items[2].title = "저장한 콘텐츠 목록"
        }
        
        // 처음 보여질 화면(=탭바)을 root로 설정하고 보여주기
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
    }

    func sceneDidDisconnect(_ scene: UIScene) {
        // Called as the scene is being released by the system.
        // This occurs shortly after the scene enters the background, or when its session is discarded.
        // Release any resources associated with this scene that can be re-created the next time the scene connects.
        // The scene may re-connect later, as its session was not necessarily discarded (see `application:didDiscardSceneSessions` instead).
    }

    func sceneDidBecomeActive(_ scene: UIScene) {
        // Called when the scene has moved from an inactive state to an active state.
        // Use this method to restart any tasks that were paused (or not yet started) when the scene was inactive.
    }

    func sceneWillResignActive(_ scene: UIScene) {
        // Called when the scene will move from an active state to an inactive state.
        // This may occur due to temporary interruptions (ex. an incoming phone call).
    }

    func sceneWillEnterForeground(_ scene: UIScene) {
        // Called as the scene transitions from the background to the foreground.
        // Use this method to undo the changes made on entering the background.
    }

    func sceneDidEnterBackground(_ scene: UIScene) {
        // Called as the scene transitions from the foreground to the background.
        // Use this method to save data, release shared resources, and store enough scene-specific state information
        // to restore the scene back to its current state.
    }


}

