//
//  PassManager.swift
//  ColdTurkey
//
//  Created by tarrask on 05/01/2022.
//

import Foundation

class PassManager: ObservableObject {
    /// This class logs and stores all password information.
    
    @Published var passes: [PassStore] {
        didSet {
            print(passes)
        }
    }
    
    init() {
        passes = [PassStore]()
        load()
    }
    
    private static var documentsFolder: URL {
        do {
            return try FileManager.default.url(for: .documentDirectory,
                                               in: .userDomainMask,
                                               appropriateFor: nil,
                                               create: false)
        } catch {
            fatalError("Can't find documents directory.")
        }
    }
    
    private static var passURL: URL {
        documentsFolder.appendingPathComponent("pass.data")
    }
    
    func load() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let data = try? Data(contentsOf: PassManager.passURL) else {
                return
            }

            guard let passes = try? JSONDecoder().decode([PassStore].self, from: data) else {
                fatalError("Can't decode saved  data.")
            }
            DispatchQueue.main.async {
                self?.passes = passes
            }
        }

        passes.sort {
            $0.service > $1.service
        }
    }

    func save() {
        DispatchQueue.global(qos: .background).async { [weak self] in
            guard let passes = self?.passes else { fatalError("Self out of scope") }
            guard let data = try? JSONEncoder().encode(passes) else { fatalError("Error encoding passesdata") }
            do {
                let outfile = Self.passURL
                try data.write(to: outfile)
            } catch {
                fatalError("Can't write passes to file")
            }
        }
    }
}
