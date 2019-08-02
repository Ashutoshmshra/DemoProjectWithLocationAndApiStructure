// Hemant Soni

import Foundation
import UIKit

enum ErrorCodes : Int {
    case BadRequest = 400
    case UnAuthorized = 401
    case Forbidden = 403
    case NotFound = 404
    case ParameterMissing = 406
    case UserAlreadyExists = 409
    case ServerError = 500
    case NotModified = 304
    case NoInternetConnection = -1009
    case NoInternetConnectionAgain = -1004
    case ConnectionTimeOut = -1001
}

enum MSFeedViewType: Int{
    case VPNone = -1
    case VPResearchType = 0
    case VPProductOnly = 1
    case VPArticleAndProduct = 2
    case VPArticleOnly = 3
    case VPArticleWithBannerOnly = 4
}


