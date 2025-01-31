//
//  Resources.swift
//  FeetnessApp
//
//  Created by Руслан Новиков on 14.12.24.
//

import UIKit

enum R {
    enum Colors {
        static let active = UIColor(hexString: "#437BFE")
        static let inactive = UIColor(hexString: "#929DA5")
        
        static let backGround = UIColor(hexString: "#F8F9F9")
        static let separator = UIColor(hexString: "#E8ECEF")
        static let secondary = UIColor(hexString: "#F0F3FF")
        
        static let titleGray = UIColor(hexString: "#E545C77")
        
        static let subtitleGray = UIColor(hexString: "#D8D8D8")
        
    }
    enum Strings {
        enum TabBar {
            static func title(for tab: Tabs) -> String? {
                switch tab {
                case .overview: return "Overview"
                case .session: return "Session"
                case .progress: return "Progress"
                case .settings: return "Settings"
                }
            }
        }
        enum NavBar {
            static let overview = "Today"
            static let session = "High Intensity Cardio"
            static let progress = "Workout progress"
            static let settings = "Settings"
        }
        enum Overview {
            static var allWorkoutsButton: String {
                return "All Workouts"
            }
        }
        enum Session {
            static let navBarPause = "Pause"
            static let navBarFinish = "Finish"
            static let navBarStart = "Start    "
            
            static let elapsedTime = "Elapsed Time"
            static let remainingTime = "Reamaining Time"
            
            static let workoutStats = "Workout stats"
            static let averagePace = "Average pace"
            static let heartRate = "Heart rate"
            static let totalDistance = "Total distance"
            static let totalSteps = "Total steps"

            static let stepsCounter = "Steps Counter"
        }
        enum Progress {
            static let navBarLeft = "Export"
            static let navBarRight = "Datails"
            
            static let dailyPerformance = "Daily performance"
            static let last7Days = "Last 7 days"
            
            static let monthlyPerformance = "Monthly performance"
            static let last10Month = "Last 10 months"
        }
        enum Settigs {}
    }
    enum Images {
        enum Session {
            static let heartRate = UIImage(named: "Heart Beat Icon")
            static let totalSpeed = UIImage(named: "Steps Icon")
            static let totalDistane = UIImage(named: "Maps Icon")
            static let averagePace = UIImage(named: "Speed Icon")
        }
        enum TabBar {
            static func icon(for tab: Tabs) -> UIImage? {
                switch tab {
                case .overview: return UIImage(named: "overview")
                case .session: return UIImage(named: "session")
                case .progress: return UIImage(named: "progress")
                case .settings: return UIImage(named: "settings")
                }
            }
        }
        
        enum Common {//хранит вспомогательные объекты
            static let downArrow = UIImage(named: "DownArrow")
            static let addButton = UIImage(named: "AddButton")
        }
        
        enum Overview {
            static let rightArrow = UIImage(named: "Right Arrow")
            static let checkMarkDone = UIImage(named: "Checkemark Done")
            static let checkMarkNotDone = UIImage(named: "Oval")
        }
        
    }
    
    enum Fonts {
        static func helveticaRegular(with size: CGFloat) -> UIFont {
            UIFont(name: "helvetica", size: size) ?? UIFont()
        }
    }
}
