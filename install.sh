# Farmer Dapp
# Set up
## Remove old blockchain (if it exists...) : datadir default location:
'''
Mac: ~/Library/Ethereum
Linux: ~/.ethereum
Windows: %APPDATA%\Ethereum
'''

## Set symlink if working in another dir
cd ~/Library/ && ln -s <path_to_other_dir> Ethereum

## Init private Blockchain
geth init <genesis_file.json>
# genesis_file.json
'''
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
'''

## Create an account
geth account new

## Set Up Static Nodes
'''
Geth supports a feature called static nodes if you have certain peers you always want to connect to. Static nodes are re-connected on disconnects. You can configure permanent static nodes by putting something like the following into <datadir>/static-nodes.json (this should be the same folder that the chaindata and keystore folders are in)
'''
# <datadir>/static-nodes.json
'''
[
"enode://34dfa58d9bcd0c03c570d8671921def5a820a9426c1a5d31e81caaad62bc6e7efe80070f2d919d37b49b0d68a16b0b870343b16e1e5a70c33bcff3232d9e6cb3@10.65.34.114:4242"
"enode://9790f7718cbdc72fcea02cf84a5edca87ec485ae636711095fc1c41d4a206c2bf463751fc8798439e4ff5cbb3aaf779e7747c1a477b0d458372d9a22f8dee70e@10.65.34.37:4242"
]
'''

## Launch with flags
geth --nodiscover --port 4242 --maxpeers 2 --networkid 4242 --rpc --rpccorsdomain * --verbosity 6 --mine console

## geth console commands
# my info
> admin.nodeInfo
# my accounts
> personal.listAccounts
# peers info
> admin.peers
# adding temporary peers (runtime only)
> admin.admin.addPeer("enode://cb32b5f9b4f6799cd728747d1fa55485758d0f1a0510acb02c6696915d0721b1ed16103cf80fd77942bc7e5dde1bc79b5b5618ff383eb2423b6106dd0cf184ce@10.65.34.114:4242")
# unblocking account
> personal.unlockAccount(web3.eth.coinbase, "password", 15000)

# Truffle
## Truffle project info
"
./contracts: Contains the Solidity source files for our smart contracts. There is an important contract in here called Migrations.sol, which we'll talk about later. Be sure not to delete this file!
./migrations: Truffle uses a migration system to handle smart contract deployments. A migration is an additional special smart contract that keeps track of changes.
./test: Contains both JavaScript and Solidity tests for our smart contracts.
./truffle.js: Truffle's configuration file.
"
## Start an empty project
> truffle init bare
## Start an example project
> truffle unbox pet-shop
## Start a project
> truffle init
## Compile contracts n ./contracts
> truffle compile
## Migrate those contracts to the Blockchain, fill in ./migration/2_ file
> truffle migrate
## Test the contracts in Solidity or JS
> truffle test






# References
https://github.com/ethereum/go-ethereum/wiki/Managing-your-accounts
https://github.com/trufflesuite/truffle

http://truffleframework.com/tutorials/pet-shop
https://www.codeooze.com/blockchain/ethereum-geth-private-blockchain/#troubleshooting
