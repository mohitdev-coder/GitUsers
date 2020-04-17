//
//  UtilityClass.swift
//  MarkUs
//
//  Created by dev10 on 9/5/18.
//  Copyright © 2018 Dev. All rights reserved.
//

import Foundation
import Toast
import Alamofire

class UtilityClass: NSObject{
    
//    //MARK: User Utility
//    class func getCurrentUser () -> User_Data? {
//        let prefs = UserDefaults.standard;
//        let encodedObject = prefs.object(forKey: "userdata");
//        if ((encodedObject) != nil) {
//            //return NSKeyedUnarchiver.unarchiveObject(with: encodedObject as! Data) as! User?;
//            let user: User_Data = User_Data(dictionary: encodedObject as! NSDictionary)!
//            //return encodedObject as? User
//            return user
//        } else {
//            return nil;
//        }
//    }
//
//    class func setCurrentUser(_ user: User_Data! ){
//
//        let prefs = UserDefaults.standard;
//        //let encodedObject = NSKeyedArchiver.archivedData(withRootObject: user);
//        let dictUser: NSDictionary = user.dictionaryRepresentation()
//        prefs.set(dictUser, forKey: "userdata");
//        prefs.synchronize();
//    }
//
//    class func cleanCurrentUser(){
//        let prefs = UserDefaults.standard;
//        prefs.removeObject(forKey: "userdata");
//        prefs.removeObject(forKey: "localdata");
//        prefs.removeObject(forKey: "touchdata");
//        prefs.removeObject(forKey: "selectLocation")
//        prefs.removeObject(forKey: "tabid")
//        prefs.removeObject(forKey: "token");
//        prefs.removeObject(forKey: "EncryptedCredential")
//        prefs.removeObject(forKey: "socketLoginToken")
//        prefs.removeObject(forKey: "socketSubscribeURL")
//        prefs.removeObject(forKey: "socketDestinationURL")
//        prefs.synchronize();
//    }
//
//    class func OpenAppleMap(lat : Double,lng:Double,placeName:String){
//
//        let latitude: CLLocationDegrees = lat
//        let longitude: CLLocationDegrees = lng
//
//        let regionDistance:CLLocationDistance = 10000
//        let coordinates = CLLocationCoordinate2DMake(latitude, longitude)
//        let regionSpan = MKCoordinateRegionMakeWithDistance(coordinates, regionDistance, regionDistance)
//        let options = [
//            MKLaunchOptionsMapCenterKey: NSValue(mkCoordinate: regionSpan.center),
//            MKLaunchOptionsMapSpanKey: NSValue(mkCoordinateSpan: regionSpan.span)
//        ]
//        let placemark = MKPlacemark(coordinate: coordinates, addressDictionary: nil)
//        let mapItem = MKMapItem(placemark: placemark)
//        mapItem.name = placeName
//        mapItem.openInMaps(launchOptions: options)
//    }
//
//
//
//    class func showToastTop(message: String){
//        let window = UIApplication.shared.keyWindow!
//        let style: CSToastStyle? = nil
//        style?.messageNumberOfLines = 0
//        style?.titleAlignment = .center
//        window.makeToast(message, duration: 2.0, position: CSToastPositionTop , style: style)
//    }
//
//    class func setSWRevealViewController(){
//        let objHomeVC = UIStoryboard.loadInitialViewController() as BaseTabBarVC
//        let objMenuVC = UIStoryboard.loadInitialViewController() as MenuVC
//        appDelegate.mainRevealController.frontViewController = getNavigationControllerForViewController(viewController:objHomeVC)
//        appDelegate.mainRevealController.rearViewController = getNavigationControllerForViewController(viewController:objMenuVC)
//        appDelegate.window?.rootViewController = appDelegate.mainRevealController
//    }
//
//    class func cropToBounds(image: UIImage, width: Double, height: Double) -> UIImage {
//        let contextImage: UIImage = UIImage(cgImage: image.cgImage!)
//
//        let contextSize: CGSize = contextImage.size
//        var posX: CGFloat = 0.0
//        var posY: CGFloat = 0.0
//        var cgwidth: CGFloat = CGFloat(width)
//        var cgheight: CGFloat = CGFloat(height)
//
//        // See what size is longer and create the center off of that
//        if contextSize.width > contextSize.height {
//            posX = ((contextSize.width - contextSize.height) / 2)
//            posY = 0
//            cgwidth = contextSize.height
//            cgheight = contextSize.height
//        } else {
//            posX = 0
//            posY = ((contextSize.height - contextSize.width) / 2)
//            cgwidth = contextSize.width
//            cgheight = contextSize.width
//        }
//
//        let rect: CGRect = CGRect(x:posX, y:posY,width:cgwidth,height:cgheight)
//
//        // Create bitmap image from context using the rect
//        let imageRef: CGImage = (contextImage.cgImage?.cropping(to: rect))!
//        //imageRef: CGImage = CGImage.cropping imageRef: CGImage = CGImageCreateWithImageInRect(contextImage.cgImage!, rect)!
//
//        // Create a new image based on the imageRef and rotate back to the original orientation
//        let image: UIImage = UIImage(cgImage: imageRef, scale: image.scale, orientation: image.imageOrientation)
//
//        return image
//    }
//
//    //MARK: Get Color form Hex
    class func UIColorFromHex(rgbValue:UInt32, alpha:Double=1.0)->UIColor {
        let red = CGFloat((rgbValue & 0xFF0000) >> 16)/256.0
        let green = CGFloat((rgbValue & 0xFF00) >> 8)/256.0
        let blue = CGFloat(rgbValue & 0xFF)/256.0
        return UIColor(red:red, green:green, blue:blue, alpha:CGFloat(alpha))
    }
//
//    //MARK: Alert/Toast
//    class func showDualActionAlert(title: String, msg: String , completionHandler:@escaping (Bool)->()){
//        let alert = UIAlertController(title:title , message: msg, preferredStyle: UIAlertControllerStyle.alert)
//        alert.addAction(UIAlertAction(title: "No", style: UIAlertActionStyle.default, handler: {action in
//            completionHandler(false)
//        }))
//        alert.addAction(UIAlertAction(title: "Yes", style: UIAlertActionStyle.cancel, handler: {action in
//            completionHandler(true)
//        }))
//        presentControllerOnWindow(controller: alert)
//    }
//
//    class func showSingleActionAlert(title: String, msg: String){
//        let alert = UIAlertController(title: title, message: msg , preferredStyle: UIAlertControllerStyle.alert)
//        alert.addAction(UIAlertAction(title: "OK", style: UIAlertActionStyle.default, handler: nil))
//        presentControllerOnWindow(controller: alert)
//    }
//
//    class func showAlertForMessage(dict:NSDictionary){
//        let message: String = dict["message"] as! String
//        self.showSingleActionAlert(title:"Alert" , msg: message)
//    }
//
//    class func showToastForAPIDict(dict:NSDictionary){
//        let message: String = dict["message"] as! String
//        self.showToast(message:message)
//    }
//
    class func showToast(message: String){
        let window = UIApplication.shared.keyWindow!
        let style: CSToastStyle? = nil
        style?.messageNumberOfLines = 0
        style?.titleAlignment = .center
        window.makeToast(message, duration: 2.0, position: CSToastPositionBottom , style: style)
    }
//
//    class func presentControllerOnWindow(controller:UIViewController){
//        let alertWindow = UIApplication.shared.keyWindow!
//        alertWindow.windowLevel = UIWindowLevelAlert + 1
//        alertWindow.makeKeyAndVisible()
//        alertWindow.rootViewController?.present(controller, animated: true, completion: nil)
//
//    }
//
//    class func getDeviceDetails() ->NSDictionary{
//        let strToken = prefs.value(forKey: "fcmtoken")
//        prefs.synchronize()
//
//        let dictDevice: NSMutableDictionary = NSMutableDictionary()
//        dictDevice.setValue(self.getVersion(), forKey: "appVersion")
//        dictDevice.setValue(UIDevice.modelName, forKey: "deviceModel")
//        dictDevice.setValue(strToken, forKey: "token")
//        dictDevice.setValue(UIDevice.current.model, forKey: "deviceType")
//        dictDevice.setValue(UIDevice.current.identifierForVendor?.uuidString, forKey: "udid")
//        dictDevice.setValue(UIDevice.current.systemVersion, forKey: "version")
//        return dictDevice
//    }
//
//    class func checkCameraPermission(){
//        let cameraMediaType = AVMediaType.video
//        let cameraAuthorizationStatus = AVCaptureDevice.authorizationStatus(for: cameraMediaType)
//
//        switch cameraAuthorizationStatus {
//        case .denied: break
//        case .authorized: break
//        case .restricted: break
//
//        case .notDetermined:
//            // Prompting user for the permission to use the camera.
//            AVCaptureDevice.requestAccess(for: cameraMediaType) { granted in
//                if granted {
//                    print("Granted access to \(cameraMediaType)")
//                } else {
//                    print("Denied access to \(cameraMediaType)")
//                }
//            }
//        }
//    }
//
//    class func navigateToLogin(){
//        //self?.revealViewController().revealToggle(animated: true)
//        guard let window = UIApplication.shared.keyWindow else {
//            return
//        }
//        let loginViewController = UIStoryboard.loadInitialViewController() as LoginVC
//        let nav:UINavigationController = UINavigationController(rootViewController: loginViewController);
//        nav.isNavigationBarHidden = true
//
//        UIView.transition(with: window, duration: 0.3, options: .transitionFlipFromRight, animations: {
//            window.rootViewController = nav
//        }, completion: { completed in
//            // maybe do something here
//        })
//    }
//
//    //MARK: PDF download and view
//    class func savePdf(urlString:String, fileName:String) {
//        DispatchQueue.main.async {
//            let url = URL(string: urlString)
//            let pdfData = try? Data.init(contentsOf: url!)
//            let resourceDocPath = (FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)).last! as URL
//            let pdfNameFromUrl = fileName
//            let actualPath = resourceDocPath.appendingPathComponent(pdfNameFromUrl)
//            do {
//                try pdfData?.write(to: actualPath, options: .atomic)
//                print("pdf successfully saved!")
//            } catch {
//                print("Unexpected error: \(error).")
//                print ("Pdf could not be saved")
//            }
//        }
//    }
//
//    class func showSavedPdf(url:String, fileName:String) -> URL? {
//        if #available(iOS 10.0, *) {
//            do {
//                let docURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//                let contents = try FileManager.default.contentsOfDirectory(at: docURL, includingPropertiesForKeys: [.fileResourceTypeKey], options: .skipsHiddenFiles)
//                for url in contents {
//                    if url.description.contains(fileName) {
//                        // its your file! do what you want with it!
//                        return url
//                    }
//                }
//            } catch {
//                print("could not locate pdf file !!!!!!!")
//            }
//        }
//        return nil
//    }
//
//    // check to avoid saving a file multiple times
//    class func pdfFileAlreadySaved(url:String, fileName:String)-> Bool {
//        var status = false
//        if #available(iOS 10.0, *) {
//            do {
//                let docURL = try FileManager.default.url(for: .documentDirectory, in: .userDomainMask, appropriateFor: nil, create: false)
//                let contents = try FileManager.default.contentsOfDirectory(at: docURL, includingPropertiesForKeys: [.fileResourceTypeKey], options: .skipsHiddenFiles)
//                for url in contents {
//                    if url.description.contains(fileName) {
//                        status = true
//                    }
//                }
//            } catch {
//                print("could not locate pdf file !!!!!!!")
//            }
//        }
//        return status
//    }
//
//    //MARK: Get Current Timestamp
//    class func getCurrentTimeStamp(dateToConvert: NSDate) -> Int64 {
//        let objDateformat: DateFormatter = DateFormatter()
//        objDateformat.dateFormat = "yyyy-MM-dd HH:mm:ss"
//        let strTime: String = objDateformat.string(from: dateToConvert as Date)
//        let objUTCDate: NSDate = objDateformat.date(from: strTime)! as NSDate
//        let milliseconds: Int64 = Int64(objUTCDate.timeIntervalSince1970)
//        return milliseconds
//    }
//
//    //MARK: Convert seconds to Hour Minutes & Sec
//    class func secondsToHoursMinutesSeconds (seconds : Int) -> (Int, Int, Int) {
//        return (seconds / 3600, (seconds % 3600) / 60, (seconds % 3600) % 60)
//    }
//
//    class func differenceInTime(time:Int64)->String{
//        let currentTime: Int64 = UtilityClass.getCurrentTimeStamp(dateToConvert: Date() as NSDate)
//        let difference: Int64 = currentTime - (time/1000)
//        let (hours,minutes,seconds) = UtilityClass.secondsToHoursMinutesSeconds(seconds: Int(difference))
//
//        var strMsg: String = ""
//        if hours>0 {
//            strMsg = "\(hours) Hours \(minutes) Minutes"
//        }else if minutes>0{
//            strMsg = "\(minutes) Minutes"
//        }else if seconds > 30{
//            strMsg = "\(seconds) Seconds"
//        }else if seconds >= 0 || seconds < 30{
//            strMsg = "Now"
//        }
//        return strMsg
//    }
//
//    class func getNavigationControllerForViewController(viewController: UIViewController)-> UINavigationController{
//        let navigationController:UINavigationController
//        navigationController =  UINavigationController(rootViewController: viewController)
//        navigationController.navigationBar.isHidden = true
//        return navigationController
//    }
//
//    class func showAnimateView(view: UIView)
//    {
//        view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
//        view.alpha = 0.0;
//        UIView.animate(withDuration: 0.25, animations: {
//            view.alpha = 1.0
//            view.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
//        });
//    }
//
//    class func removeAnimateView(view: UIView)
//    {
//        UIView.animate(withDuration: 0.25, animations: {
//            view.transform = CGAffineTransform(scaleX: 1.3, y: 1.3)
//            view.alpha = 0.0;
//        }, completion:{(finished : Bool)  in
//            if (finished)
//            {
//                view.removeFromSuperview()
//            }
//        });
//    }
//
//    // Get current time zone
//    class func getTimeZone() -> String{
//        let seconds = TimeZone.current.secondsFromGMT()
//        let hours = seconds/3600
//        let newHour = hours * 60
//        let minutes = abs(seconds/60) % 60
//        let tempMinut = newHour + minutes
//        let strTimeZone = String(tempMinut)
//        return strTimeZone
//    }
//
//    class func dateToTimeStamp(userDob: Date) -> Int{
//
//        let timeInterval = userDob.timeIntervalSince1970 * 1000
//        let myInt = Int(timeInterval)
//        return myInt
//    }
//
//    class func dateToTimeStampinMinut(userDob: Date) -> Int{
//
//        let timeInterval = userDob.timeIntervalSince1970
//        let myInt = Int(timeInterval)
//        return myInt
//    }
//
//    class func strCurrentDate() -> String{
//        let date = Date()
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MM/dd/yyyy"
//        let result = formatter.string(from: date)
//        return result
//    }
//
//    class func currentDateType() -> Date{
//        let date = Date()
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MM/dd/yyyy"
//        return date
//    }
//
//    class func currentDateTimeType() -> Date{
//        let date = Date()
//        let formatter = DateFormatter()
//        formatter.dateFormat = "MM/dd/yyyy HH:mm"
//        return date
//    }
//
//    class func currentTimeType(userdate : Date) -> String{
//        let formatter = DateFormatter()
//        formatter.locale = Locale(identifier: "en_US_POSIX")
//        formatter.dateFormat = "h:mm a"
//        formatter.amSymbol = "AM"
//        formatter.pmSymbol = "PM"
//        let dateString = formatter.string(from: userdate)
//        return dateString
//    }
//
//    class func converTimeStampToTime(timestamp : Double) -> String{
//        let unixTimestamp = timestamp
//        let date = Date(timeIntervalSince1970: unixTimestamp)
//        let formatter = DateFormatter()
//        formatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
//        formatter.locale = NSLocale.current
//        formatter.dateFormat = "h:mm a"
//        formatter.amSymbol = "AM"
//        formatter.pmSymbol = "PM"
//        let strTime = formatter.string(from: date)
//        return strTime
//    }
//
//    class func timeStampToDate(timestamp : Double) -> String{
//        let date = Date(timeIntervalSince1970: timestamp)
//        let dateFormatter = DateFormatter()
//        dateFormatter.timeZone = TimeZone(abbreviation: "GMT") //Set timezone that you want
//        dateFormatter.locale = NSLocale.current
//        dateFormatter.dateFormat = "MM/dd/yyyy" //Specify your format that you want
//        let strDate = dateFormatter.string(from: date)
//        return strDate
//    }
//
//    class func timeInMmDYyFormat(timestamp : Double) -> String{
//        let date = Date(timeIntervalSince1970: timestamp / 1000.0)
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "dd/MM/yyyy" //Specify your format that you want
//
////        let strDateDay = dateFormatter.string(from: date) as? String
////        if strDateDay == "1" || strDateDay == "21" || strDateDay == "31" || strDateDay == "21"{
////            dateFormatter.dateFormat = "d'st' MMM,yy"
////        }else if strDateDay == "2" || strDateDay == "22"{
////            dateFormatter.dateFormat = "d'nd' MMM,yy"
////        }else if strDateDay == "3" || strDateDay == "23"{
////            dateFormatter.dateFormat = "d'rd' MMM,yy"
////        }else{
////            dateFormatter.dateFormat = "d'th' MMM,yy"
////        }
//
//        let strDate = dateFormatter.string(from: date)
//        return strDate
//    }
//
//    class func timeStampToDateActivity(timestamp : Double) -> String{
//        let date = Date(timeIntervalSince1970: timestamp / 1000.0)
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "MM/dd/yyyy"
//        let strDate = dateFormatter.string(from: date)
//        return strDate
//    }
//
//    class func getPreviousController(navigationController: UINavigationController) ->UIViewController{
//        let n: Int! = navigationController.viewControllers.count
//        let myUIViewController = navigationController.viewControllers[n-1] as UIViewController
//        return myUIViewController
//    }
//
//    class func getJsonString(jsonDict :[String : Any]) -> String{
//        let jsonData = try! JSONSerialization.data(withJSONObject: jsonDict)
//        let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)
//        return jsonString! as String
//    }
//
//    class func getJsonStringValue(jsonDict :String) -> String{
//        let jsonData = try! JSONSerialization.data(withJSONObject: jsonDict)
//        let jsonString = NSString(data: jsonData, encoding: String.Encoding.utf8.rawValue)
//        return jsonString! as String
//    }
//
//    class func jsonStringChatSend(groupId: String, fromId: String, message: String) -> String{
//        let dictionary = ["groupId":groupId,"fromUserId":fromId,"message":message,"token":prefs.value(forKey: "socketLoginToken")!,"type":"GROUP_MESSAGE","contentType":"TEXT"]
//        let getjsonString = self.getJsonString(jsonDict: dictionary)
//        return getjsonString
//    }
//
//    class func jsonStringSendPing(message: String) -> String{
//        let dictionary = ["groupId":"","fromUserId":"","message":message,"token":"","type":"PING","contentType":"TEXT"]
//        let getjsonString = self.getJsonString(jsonDict: dictionary)
//        return getjsonString
//    }
//
//    class func GetJsonFromString(Text: String)-> NSDictionary?{
//        var  json : AnyObject?
//        let data = Text.data(using: String.Encoding.utf8, allowLossyConversion: false)!
//        do {
//            json = try JSONSerialization.jsonObject(with: data, options: []) as! [String: AnyObject] as AnyObject
//
//        } catch let error as NSError {
//            print("Error from GetJsonFromString \(error)")
//            return nil
//        }
//        return json as? NSDictionary
//    }
//
    class func timeStamToTime(time : Int)  -> String{
        let date = Date(timeIntervalSince1970: TimeInterval(time/1000))
        let dateFormatter = DateFormatter()
        dateFormatter.timeStyle = DateFormatter.Style.medium //Set time style
        dateFormatter.dateStyle = DateFormatter.Style.medium //Set date style
        dateFormatter.dateFormat = "dd/MM/yyyy hh:mm a" //Specify your format that you want
        dateFormatter.timeZone = NSTimeZone() as TimeZone
        let strTime = dateFormatter.string(from: date)
        return strTime
    }
//
//    // connect to socket
//    class func loginInSocket(){
//        let masterTemp: MasterVC = MasterVC()
//        appDelegate.socketClient.disconnect()
//        let userData: User_Data  = UtilityClass.getCurrentUser()!
//        let strUserID = String(userData.id!)
//        let subscribeURL = "/user/\(strUserID)/chat"
//        let destinationURL = "/app/\(strUserID)/chat"
//        prefs.set(subscribeURL, forKey: "socketSubscribeURL")
//        prefs.set(destinationURL, forKey: "socketDestinationURL")
//        prefs.synchronize()
//        masterTemp.registerSocket()
//    }
//
//    class func muteNotificationApi() -> Bool{
//        var parameters: Parameters?
//        var blNotificationStatus : Bool! = true
//        func getParams(){
//            parameters = ["": ""]
//        }
//
//        getParams()
//        BackendUtilities.muteNotificationApi(parameters!, completionHandler: { (user,statusCode,message) in
//
//            if statusCode == Constant.SUCCESS{
//                blNotificationStatus = true
//            }else{
//                blNotificationStatus = false
//                UtilityClass.showToast(message: message)
//             }
//        })
//        return blNotificationStatus
//    }
//
//    //Update Language
//    class func updateLanguageApi(language: String){
//        var parameters: Parameters?
//        parameters = ["language": language]
//        BackendUtilities.updateLanguageApi(parameters!, completionHandler: { (user, statusCode, message) in
//            if statusCode == Constant.SUCCESS{
//                if language == "ENGLISH"{
//                    prefs.set("en", forKey: "language")
//                    prefs.synchronize()
//                }else if language == "TURKEY"{
//                    prefs.set("tr", forKey: "language")
//                    prefs.synchronize()
//                }
//            }else{
//                if language == "ENGLISH"{
//                    prefs.set("tr", forKey: "language")
//                    prefs.synchronize()
//                }else if language == "TURKEY"{
//                    prefs.set("en", forKey: "language")
//                    prefs.synchronize()
//                }
//            }
//        })
//    }
//
//    class func getVersion() -> String {
//        guard let version = Bundle.main.infoDictionary?["CFBundleShortVersionString"] as? String else {
//            return "no version info"
//        }
//        return version
//    }
}

