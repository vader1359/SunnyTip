
enum Currency {
    case USD
    case Yen
    
    func getCurrencyIdentifier() -> String {
        switch self {
        case .USD: return "en_US"
        case .Yen: return "ja_JP"
        }
    }
}
