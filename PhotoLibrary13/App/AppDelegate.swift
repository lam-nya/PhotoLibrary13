//
//  AppDelegate.swift
//  PhotoLibrary13
//
//  Created by Igor Kuzmin on 18.01.2022.
//

import UIKit

@main
class AppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?

    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        let tabBarController = UITabBarController()

        let mediaLibraryViewController = UIViewController()
        mediaLibraryViewController.view.backgroundColor = .white
        mediaLibraryViewController.tabBarItem = UITabBarItem(title: "Медиатека", image: .add, tag: 0)

        let forYouViewController = UIViewController()
        forYouViewController.view.backgroundColor = .white
        forYouViewController.tabBarItem = UITabBarItem(title: "Для Вас", image: .add, tag: 1)

//        let albumViewController = PhotoLibraryView()
//        albumViewController.tabBarItem = UITabBarItem(title: "Альбомы", image: .add, tag: 2)

        let navigationController = UINavigationController.init(rootViewController: PhotoLibraryView())
        navigationController.tabBarItem = UITabBarItem(title: "Альбомы", image: .add, tag: 2)

        let searchViewController = UIViewController()
        searchViewController.view.backgroundColor = .white
        searchViewController.tabBarItem = UITabBarItem(title: "Поиск", image: .add, tag: 3)

        tabBarController.setViewControllers([
            mediaLibraryViewController,
            forYouViewController,
            navigationController,
            searchViewController
        ], animated: true)

        window = UIWindow(frame: UIScreen.main.bounds)
        window?.rootViewController = tabBarController
        window?.makeKeyAndVisible()
        return true
    }

}
