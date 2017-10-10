//
//  Web3.swift
//  StoreDapp
//
//  Created by Grumbach on 10/2/17.
//  Copyright © 2017 AIEParis. All rights reserved.
//

import Foundation
import JavaScriptCore
import Geth

class Web3
{
    var coinBase:String? = nil

    init() {self.coinBase = getCoinbase()}

//    func test()
//    {
//        var text = ""
//
//        let datadir = (NSSearchPathForDirectoriesInDomains(.documentDirectory, .userDomainMask, true) as NSArray).firstObject as! String
//        let am = GoGethNewAccountManager(datadir + "/keystore2", GoGethStandardScryptN, GoGethStandardScryptP)
//
//        var newAcc: GoGethAccount?; try! am.newAccount("Creation password", ret0_: &newAcc)
//        text = text + "JSON: " + (NSString(data: jsonKey!, encoding: NSUTF8StringEncoding) as! String) + "\n"
//
//        try! am.deleteAccount(newAcc!, passphrase: "Creation password")
//        text = text + "Accs: " + String(am.getAccounts().size()) + "\n"
//
//        var impAcc: GoGethAccount?; try! am.importKey(jsonKey, passphrase: "Export password", newPassphrase: "Import password", ret0_: &impAcc)
//        text = text + "Imp: " + impAcc!.getAddress().getHex()
//
//        print ("OUTPUT --[\(text)]--")
//    }



    private func    getCoinbase() -> String?
    {
        let jsSource = """
        function    web3_getCoinbase(){
            var coinbase = web3.eth.coinbase;
            return (coinbase)}
        """
        if let context = JSContext()
        {
            context.evaluateScript(jsSource)
            if let jsFunction = context.objectForKeyedSubscript("web3_getCoinbase"){
                if let result = jsFunction.call(withArguments:[]){
                    return result.toString()}}
        }
        return nil
    }
    func    getBalance(coinbase : String) -> Int32?
    {
        let jsSource = """
        function    web3_getBalance(coinbase){
            var balance = web3.eth.balanceAt(coinbase);
            return (balance)}
        """
        if let context = JSContext()
        {
            context.evaluateScript(jsSource)
            if let jsFunction = context.objectForKeyedSubscript("web3_getCoinbase"){
                if let result = jsFunction.call(withArguments:[coinbase]){
                    return result.toInt32()}}
        }
        return nil
    }
}
