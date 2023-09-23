//
//  datatype.swift
//  iBiome
//
//  Created by MUNAVAR PM on 23/09/23.
//

//import Foundation
//
//
//// MARK: - Welcome
//struct Welcome: Codable {
//    let checksums: Checksums
//    let compilers: Compilers
//    let date: DateClass
//    let links: Links
//    let name, requires: String
//    let sdks: Sdks
//    let version: Version
//}
//
//// MARK: - Checksums
//struct Checksums: Codable {
//    let sha1: String?
//}
//
//// MARK: - Compilers
//struct Compilers: Codable {
//    let clang, swift: [Version]?
//}
//
//// MARK: - Version
//struct Version: Codable {
//    let build, number: String?
//    let release: Release?
//}
//
//// MARK: - Release
//struct Release: Codable {
//    let release: Bool?
//}
//
//// MARK: - DateClass
//struct DateClass: Codable {
//    let day, month, year: Int?
//}
//
//// MARK: - Links
//struct Links: Codable {
//    let download, notes: Download?
//}
//
//// MARK: - Download
//struct Download: Codable {
//    let url: String?
//}
//
//// MARK: - Sdks
//struct Sdks: Codable {
//    let iOS, macOS, tvOS, watchOS: [Version]?
//}
//
//
//    func fetchXcodeData() {
//        let welcome = [Welcome]()
//        print("Staerase")
//        let url = URL(string: "https://xcodereleases.com/data.json")!
//
//        Task {
//            do {
//                let (data, _) = try await URLSession.shared.data(from: url)
//                let result = try JSONDecoder().decode(Welcome.self, from: data) // Use Welcome.self here
//                print(result)
//                let welcome = result
//                print("\(welcome)🚀")
//            } catch {
//                print("\(error)🥹")
//            }
//        }
//    }






