//
//  MarketDataCollector.swift
//  BlockPouch
//
//  Created by Harrison on 12/5/2025.
//

import Foundation

struct CoinGeckoResponse: Decodable {
    let symbol: String
    let name: String
    let image: String
    let current_price: Double
    let price_change_24h: Double?
}


class MarketDataController: ObservableObject {
    private static var fetchURL: URL = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=usd&ids=bitcoin,ethereum,ripple,binancecoin,solana,usd-coin,dogecoin,cardano,tron&sparkline=false")!
    private let useAPI = true
    private var timer: Timer?
    private var isFetching = false
    @Published var assets: [AssetModel] = []
    
    init() {}
    
    func startFetching(interval: TimeInterval = TimeInterval(60)) {
        guard !isFetching else { return }
        isFetching = true
        
        fetchData()
        timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] _ in
            self?.fetchData()
        }
    }
    
    func stopFetching() {
        timer?.invalidate()
        timer = nil
        isFetching = false
    }
    
    func fetchData() {
        if(useAPI) {
            var req = URLRequest(url: MarketDataController.fetchURL)
            req.setValue("application/json", forHTTPHeaderField: "Accept")
            
            URLSession.shared.dataTask(with: req) { data, res, err in
                guard let data = data else { return }
                do {
                    let decoded = try JSONDecoder().decode([CoinGeckoResponse].self, from: data)
                    DispatchQueue.main.async {
                        self.assets = decoded.map {
                            return AssetModel(
                                id: $0.symbol.uppercased(),
                                name: $0.name,
                                priceUSD: $0.current_price,
                                priceDate: Date(),
                                changeLast24h: $0.price_change_24h ?? 0
                            )
                        }
                    }
                } catch {
                    print("Error decoding Coin API Data: \(String(describing: err))")
                }
            }.resume()
        } else {
            assets = [
                AssetModel(id: "BTC", name: "Bitcoin", priceUSD: 65235.84, priceDate: Date(), changeLast24h: 1629.24),
                AssetModel(id: "ETH", name: "Ethereum", priceUSD: 2932.27, priceDate: Date(), changeLast24h: -121.79)
            ]
        }
    }
    
    func fetchDataAsync() async {
        fetchData()
    }
}
