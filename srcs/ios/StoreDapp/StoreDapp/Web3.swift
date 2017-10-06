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
