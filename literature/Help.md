# Farmer Dapp
## Setup
A script already does all that for you (macOS or Linux) :
```
$> ./scripts/setup.bash
```
Manual setup :
* Remove old blockchain (if it exists...) : datadir default location:
```
Mac: ~/Library/Ethereum
Linux: ~/.ethereum
Windows: %APPDATA%\Ethereum
```

* Set symlink if working in another dir on macOS (optional)
```
$> cd ~/Library/ && ln -s <path_to_other_dir> Ethereum
```

* Init private Blockchain
```
$> geth init <genesis_file.json>
```
genesis_file.json looks like this :
```
{
	"config": {
		"chainId": 4242,
		"homesteadBlock":0,
		"eip150Block":0,
		"eip155Block":10,
		"eip158Block":10,
		"eip160Block":10
	},
	"nonce": "0x0000000000000042",
	"alloc": {
		"0x0000000000000000000000000000000000000001": {
			"balance": "42"
		},
		"0x0000000000000000000000000000000000000002": {
			"balance": "126"
		},
		"0x0000000000000000000000000000000000000003": {
			"balance": "503"
		}
	},
	"timestamp": "0x00",
	"parentHash": "0x0000000000000000000000000000000000000000000000000000000000000000",
	"extraData": "0x3535353535353535353535353535353535353535353535353535353535353535",
	"gasLimit": "0x1000000",
	"difficulty": "0x10",
	"mixhash": "0x0000000000000000000000000000000000000000000000000000000000000000",
	"coinbase": "0xffff000000000000000000000000000000000000"
}
```
* Create an account
```
$> geth account new
```
* Set Up Static Nodes

	Geth supports a feature called static nodes if you have certain peers you always want to connect to. Static nodes are re-connected on disconnects. You can configure permanent static nodes by putting something like the following into DATADIR/static-nodes.json
```
[
	"enode://<ID>@<IP>:<PORT>"
]
```

## Launch with flags
```
geth --nodiscover --port 4242 --maxpeers 2 --networkid 4242 --rpc --rpccorsdomain * --verbosity 6 --mine console
```

### Geth console commands
* my info
```
> admin.nodeInfo
```
* my accounts
```
> personal.listAccounts
```
* peers info
```
> admin.peers
```
* adding temporary peers (runtime only)
```
> admin.admin.addPeer("enode://<ID>@<IP>:<PORT>")
```
* unblocking account
```
> personal.unlockAccount(web3.eth.coinbase, "password")
```

### Truffle project info
./contracts: Contains the Solidity source files for our smart contracts.

./migrations: Truffle uses a migration system to handle smart contract deployments. A migration is an additional special smart contract that keeps track of changes.

./test: Contains both JavaScript and Solidity tests for our smart contracts.

./truffle.js: Truffle's configuration file.

* Start an empty project
```
$> truffle init bare
```
* Start an example project
```
$> truffle unbox pet-shop
```
* Start a project
```
$> truffle init
```
* Compile contracts n ./contracts
```
$> truffle compile
```
* Migrate those contracts to the Blockchain, fill in ./migration/2_ file
```
$> truffle migrate
```
* Test the contracts in Solidity or JS
```
$> truffle test
```

## References
* https://github.com/ethereum/go-ethereum/wiki/Managing-your-accounts
* https://github.com/trufflesuite/truffle

* http://truffleframework.com/tutorials/pet-shop
* https://www.codeooze.com/blockchain/ethereum-geth-private-blockchain/#troubleshooting
