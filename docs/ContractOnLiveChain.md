# Putting a contract onto the live chain

1. Download and install "geth" ([see here](https://www.ethereum.org/cli))

2. Run it for a few days (`$ geth`) until the entire blockchain is downloaded - it's ready when `> eth.getBlock("latest").number` (in the other terminal, see next step) returns something other than "0" .. and it seems that the very last few hundred blocks take much longer than the rest, but perhaps thats just because I was watching those ones.

3. in a 2nd terminal run `$ geth attach` and do the following from in there :

4. `> personal.newAccount('password');`

5. Save that address (and that 'password'), and transfer ether to it (eg. from [Poloniex](https://poloniex.com/))

6. This will take some time to happen, but once it is done you can see the value against your new account in the geth terminal : `> web3.eth.getBalance(web3.eth.accounts[0])`
 
7. Download Mist and use its easy GUI to install the contract onto the live chain : https://github.com/ethereum/mist/releases
 
> Ok - Deploying via mist worked ! 
> Contract is in this block  : https://etherscan.io/block/0x8a8a6b8210980d9f5dd58e063eba543ceccbdf6dc5985ee73f1d866c63ba6325
>  
> This is the Block Store contract on the live chain : 0xd9889b8649E8CC758782490229eb4F7F9A1d64d9
>  
> I think it cost about 0.01 ETH -- $3.50 AUD 


NB: a couple of other options to install would be (1) to use 
    the online compiler https://ethereum.github.io/browser-solidity/ and grab it's Web3 deploy code to use in geth (see [this doc](https://github.com/ethereum/go-ethereum/wiki/Contract-Tutorial)) 
    or (2) to install locally [a Solidity compiler](https://github.com/ethereum/solc-js) for geth/truffle 
    
NB2: if you get "authentication needed: password or unlock undefined" ,  do `> personal.unlockAccount(web3.eth.accounts[0], "password")`
     
NB3:   
[ETH to Gas Calculator](http://ethgasstation.info/calculator.php).   
[ETH to AUD Conversion](https://www.coingecko.com/en/price_charts/ethereum/aud).  	

 
