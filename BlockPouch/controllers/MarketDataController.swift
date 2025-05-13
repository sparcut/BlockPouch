//
//  MarketDataController.swift
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
    let price_change_percentage_24h: Double?
}

@MainActor
class MarketDataController: ObservableObject {
    private var useAPI: Bool = true
    private var timer: Timer?
    private var isAutoFetching: Bool = false
    private var isFetching: Bool = false
    private var lastFetch: Date?
    @Published var assets: [String: AssetModel] = [:]
    @Published var selectedCurrency: CurrencyModel = CurrencyModel.all[0] {
        didSet {
            Task {
                await fetchData()
            }
        }
    }
    
    init(useAPI: Bool) {
        self.useAPI = useAPI
    }
    
    func startFetching(interval: TimeInterval = TimeInterval(45)) {
        if(!self.isAutoFetching) {
            self.isAutoFetching = true
            
//            Task {
//                await fetchData()
//            }
            timer = Timer.scheduledTimer(withTimeInterval: interval, repeats: true) { [weak self] _ in
                Task { [weak self] in
                    await self?.fetchData()
                }
            }
        } else {
            // TODO: throw error
            print("Auto fetch already running")
        }
    }
    
    func stopFetching() {
        if(self.isAutoFetching) {
            self.isAutoFetching = false
            timer?.invalidate()
            timer = nil
        } else {
            // TODO: Throw error
            print("Auto fetch not running")
        }
    }
    
    func fetchData() async {
        guard !isFetching else { return }
        isFetching = true
        
        // Sets isFetching to false at end of code no matter what happends
        defer { self.isFetching = false }
        
        if(self.useAPI) {
            let fetchURL: URL = URL(string: "https://api.coingecko.com/api/v3/coins/markets?vs_currency=\(selectedCurrency.id.lowercased())&ids=bitcoin,ethereum,ripple,binancecoin,solana,usd-coin,dogecoin,cardano,tron&sparkline=false")!
            
            var req = URLRequest(url: fetchURL)
            req.setValue("application/json", forHTTPHeaderField: "Accept")
            
            do {
                let (data, _) = try await URLSession.shared.data(for: req)
                
                do {
                    let decodedJson = try JSONDecoder().decode([CoinGeckoResponse].self, from: data)
                    
                    for fetchedAsset in decodedJson {
                        let assetId = fetchedAsset.symbol.uppercased()
                        
                        self.assets[assetId] = AssetModel(
                            id: assetId,
                            name: fetchedAsset.name,
                            price: fetchedAsset.current_price,
                            priceDate: Date(),
                            priceChange24h: fetchedAsset.price_change_24h ?? 0,
                            percentChange24h: fetchedAsset.price_change_percentage_24h ?? 0
                        )
                    }
                } catch {
                    print("Error from API: \(String(bytes: data, encoding: String.Encoding.utf8) ?? "<Unreadable>")")
                }
                
            } catch {
                print("Error decoding Coin API Data: \(error)")
            }
            

//            
//            URLSession.shared.dataTask(with: req) { data, res, err in
//                guard let data = data else { return }
//                do {
//                    let decodedJson = try JSONDecoder().decode([CoinGeckoResponse].self, from: data)
//                    DispatchQueue.main.async {
//                        for fetchedAsset in decodedJson {
//                            let assetId = fetchedAsset.symbol.uppercased()
//                            
//                            self.assets[assetId] = AssetModel(
//                                id: assetId,
//                                name: fetchedAsset.name,
//                                price: fetchedAsset.current_price,
//                                priceDate: Date(),
//                                priceChange24h: fetchedAsset.price_change_24h ?? 0,
//                                percentChange24h: fetchedAsset.price_change_percentage_24h ?? 0
//                            )
//                        }
//                    }
//                } catch {
//                    print("Error decoding Coin API Data: \(String(describing: err))")
//                }
//            }.resume()
        } else {
            assets = [
                "BTC": AssetModel(id: "BTC", name: "Bitcoin", price: 65235.84, priceDate: Date(), priceChange24h: 1629.24, percentChange24h: 2),
                "ETH": AssetModel(id: "ETH", name: "Ethereum", price: 2932.27, priceDate: Date(), priceChange24h: -121.79, percentChange24h: -0.01)
            ]
        }
    }
}
