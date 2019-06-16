//
//  HDKeyChainTests.swift
//
//  Copyright © 2018 Kishikawa Katsumi
//  Copyright © 2018 BitcoinKit developers
//
//  Permission is hereby granted, free of charge, to any person obtaining a copy
//  of this software and associated documentation files (the "Software"), to deal
//  in the Software without restriction, including without limitation the rights
//  to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
//  copies of the Software, and to permit persons to whom the Software is
//  furnished to do so, subject to the following conditions:
//
//  The above copyright notice and this permission notice shall be included in
//  all copies or substantial portions of the Software.
//
//  THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
//  IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
//  FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
//  AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
//  LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
//  OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
//  THE SOFTWARE.
//

import XCTest
@testable import BitcoinKit

class HDKeyChainTests: XCTestCase {
    func testHDKeychain() {
        // Master: 000102030405060708090a0b0c0d0e0f
        let seed = Data(hex: "000102030405060708090a0b0c0d0e0f")!

        let keychain = HDKeychain(seed: seed, network: .mainnet)
        let privateKey = try! keychain.derivedKey(path: "m")

        XCTAssertEqual(privateKey.extendedPublicKey().extended(), "xpub661MyMwAqRbcFtXgS5sYJABqqG9YLmC4Q1Rdap9gSE8NqtwybGhePY2gZ29ESFjqJoCu1Rupje8YtGqsefD265TMg7usUDFdp6W1EGMcet8")
        XCTAssertEqual(privateKey.extended(), "xprv9s21ZrQH143K3QTDL4LXw2F7HEK3wJUD2nW2nRk4stbPy6cq3jPPqjiChkVvvNKmPGJxWUtg6LnF5kejMRNNU3TGtRBeJgk33yuGBxrMPHi")

        // m/0'
        let m0prv = try! keychain.derivedKey(path: "m/0'")
        XCTAssertEqual(m0prv.extendedPublicKey().extended(), "xpub68Gmy5EdvgibQVfPdqkBBCHxA5htiqg55crXYuXoQRKfDBFA1WEjWgP6LHhwBZeNK1VTsfTFUHCdrfp1bgwQ9xv5ski8PX9rL2dZXvgGDnw")
        XCTAssertEqual(m0prv.extended(), "xprv9uHRZZhk6KAJC1avXpDAp4MDc3sQKNxDiPvvkX8Br5ngLNv1TxvUxt4cV1rGL5hj6KCesnDYUhd7oWgT11eZG7XnxHrnYeSvkzY7d2bhkJ7")

        // m/0'/1
        let m01prv = try! keychain.derivedKey(path: "m/0'/1")
        XCTAssertEqual(m01prv.extendedPublicKey().extended(), "xpub6ASuArnXKPbfEwhqN6e3mwBcDTgzisQN1wXN9BJcM47sSikHjJf3UFHKkNAWbWMiGj7Wf5uMash7SyYq527Hqck2AxYysAA7xmALppuCkwQ")
        XCTAssertEqual(m01prv.extended(), "xprv9wTYmMFdV23N2TdNG573QoEsfRrWKQgWeibmLntzniatZvR9BmLnvSxqu53Kw1UmYPxLgboyZQaXwTCg8MSY3H2EU4pWcQDnRnrVA1xe8fs")

        // m/0'/1/2'
        let m012prv = try! keychain.derivedKey(path: "m/0'/1/2'")
        XCTAssertEqual(m012prv.extendedPublicKey().extended(), "xpub6D4BDPcP2GT577Vvch3R8wDkScZWzQzMMUm3PWbmWvVJrZwQY4VUNgqFJPMM3No2dFDFGTsxxpG5uJh7n7epu4trkrX7x7DogT5Uv6fcLW5")
        XCTAssertEqual(m012prv.extended(), "xprv9z4pot5VBttmtdRTWfWQmoH1taj2axGVzFqSb8C9xaxKymcFzXBDptWmT7FwuEzG3ryjH4ktypQSAewRiNMjANTtpgP4mLTj34bhnZX7UiM")

        // m/0'/1/2'/2
        let m0122prv = try! keychain.derivedKey(path: "m/0'/1/2'/2")
        XCTAssertEqual(m0122prv.extendedPublicKey().extended(), "xpub6FHa3pjLCk84BayeJxFW2SP4XRrFd1JYnxeLeU8EqN3vDfZmbqBqaGJAyiLjTAwm6ZLRQUMv1ZACTj37sR62cfN7fe5JnJ7dh8zL4fiyLHV")
        XCTAssertEqual(m0122prv.extended(), "xprvA2JDeKCSNNZky6uBCviVfJSKyQ1mDYahRjijr5idH2WwLsEd4Hsb2Tyh8RfQMuPh7f7RtyzTtdrbdqqsunu5Mm3wDvUAKRHSC34sJ7in334")
    }
    
    func testHDKeyChain_private_key_31_bytes_1() {
        let seed = Data(hex: "19502a4da953671250f05068576f3437fef68331fd184a7a2e49ae2707db522b6c5bf38259791c48329717a96cd6713255ac20ddc727d692b8bf5a6a27cad029")!
        
        let keychain = HDKeychain(seed: seed, network: .mainnetBTC)
        let privateKey = try! keychain.derivedKey(path: "m/44'")
        
        
        XCTAssertEqual(privateKey.extendedPublicKey().extended(), "xpub68rykGyJxxSq2TfLjtwb2RdBt3fnKsbqgZTsuMfR1CJtKqmrCEbuaHjkvkL7rysfxVydrCDgjrBsYYytUWBYZm3UkjS1oNnF8SRAXTjtMuD")
        XCTAssertEqual(privateKey.extended(), "xprv9usdLmSR8atXoyasdsQafHgTL1qHvQszKLYH6yFoSrmuT3ShehHf2VRH5VAxa2qFftKpgWNNMnmeKxhUpQVAoTJBb8LGWwqVMBfAHAKiBm8")
    }
    
    func testHDKeyChain_private_key_31_bytes_2() {
        let seed = Data(hex: "19502a4da953671250f05068576f3437fef68331fd184a7a2e49ae2707db522b6c5bf38259791c48329717a96cd6713255ac20ddc727d692b8bf5a6a27cad029")!
        
        let keychain = HDKeychain(seed: seed, network: .mainnetBTC)
        let privateKey = try! keychain.derivedKey(path: "m/44'/175'")
        
        
        XCTAssertEqual(privateKey.extendedPublicKey().extended(), "xpub6A6x3t3hfK3seYFy6S7K5HuB1unyHxwLEhm8dY2GUwctkumkYpNa8fA8E5qLL2C6utqAunWHjYTUWTAizB5LhgjvzN7G3rPb5jxGj4jtPXp")
        XCTAssertEqual(privateKey.extended(), "xprv9w7beNWopwVaS4BVzQaJi9xSTsxUtWDUsUqXq9cevc5ut7Sc1H4KarqeNoC1hQSsL8EoUqDsokgDgTeh63Evb36ziTya8izhb4VDTZELoHR")
    }
    
    func testHDKeyChain_private_key_31_bytes_3() {
        let seed = Data(hex: "19502a4da953671250f05068576f3437fef68331fd184a7a2e49ae2707db522b6c5bf38259791c48329717a96cd6713255ac20ddc727d692b8bf5a6a27cad029")!
        
        let keychain = HDKeychain(seed: seed, network: .mainnetBTC)
        let privateKey = try! keychain.derivedKey(path: "m/44'/175'/0'")
        
        
        XCTAssertEqual(privateKey.extendedPublicKey().extended(), "xpub6CszeXzpHwiu37iaJ7S7p9YoyF4w6NMPeXted3AuXwCK7yiHowzE1gpFTzGaATVnHZsarG3jGBEagMxUWUcjjcxrSexXjHcy7TQRJgPKxcU")
        XCTAssertEqual(privateKey.extended(), "xprv9yteF2TvTaAbpde7C5u7T1c5RDESgudYHJy3pemHybfLFBP9GQfyTtVmcjmFfyVok5a4EXmNFbZK6R42jQQRS2PVwbaYGcueutPdVvJjr17")
    }
    
    
}
