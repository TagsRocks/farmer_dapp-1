function    web3_getCoinbase()
{
	var coinbase = web3.eth.coinbase;
    return (coinbase)
}

function    web3_getBalance(coinbase)
{
    var balance = web3.eth.balanceAt(coinbase);
    return (balance)
}
