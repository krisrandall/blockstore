# BlockStore


A key-value storage space on the blockchain.

## Live BlockStore

**Address** [0xd9889b8649E8CC758782490229eb4F7F9A1d64d9](https://etherscan.io/address/0xd9889b8649e8cc758782490229eb4f7f9a1d64d9)

**ABI** `[ { "constant": false, "inputs": [ { "name": "_key", "type": "string" } ], "name": "fetch", "outputs": [ { "name": "_value", "type": "string" } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "_key", "type": "string" }, { "name": "_value", "type": "string" } ], "name": "store", "outputs": [ { "name": "_stored_val", "type": "string" } ], "payable": false, "type": "function" }, { "inputs": [], "payable": false, "type": "constructor" } ]`



## To use the BlockStore  

In Geth :

#### To access the live BlockStore

```
> var abi = [ { "constant": false, "inputs": [ { "name": "_key", "type": "string" } ], "name": "fetch", "outputs": [ { "name": "_value", "type": "string" } ], "payable": false, "type": "function" }, { "constant": false, "inputs": [ { "name": "_key", "type": "string" }, { "name": "_value", "type": "string" } ], "name": "store", "outputs": [ { "name": "_stored_val", "type": "string" } ], "payable": false, "type": "function" }, { "inputs": [], "payable": false, "type": "constructor" } ];         
> var address = '0xd9889b8649E8CC758782490229eb4F7F9A1d64d9';       
> var blockStore = eth.contract(abi).at(address);    
```

#### To store a value

~~> blockStore.store( 'my\_variable\_name', 'my variable value' )~~

Use mist - I can't figure out how to call the store method succesfully using geth.


#### To retrieve a value

`> blockStore.fetch.call( 'my_variable_name' )`


## State of the Daaps

Block Store is listed on the State of the Dapps website :

* https://dapps.ethercasts.com/dapp/block-store
 
## Other Notes

Here are some of my working notes from start to finish creating an ethereum solidity smart contract :   
    
* [Getting started with Ethereum and writing Smart Contracts](docs/GettingStarted.md)      
* [Getting a Contract onto the live Ethereum blockchain](docs/ContractOnLiveChain.md).   
* [Other handy geth commands](docs/GethCommands.md)
