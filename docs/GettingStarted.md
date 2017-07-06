# Getting Started with Ethereum & Solidity Smart Contract Writing
 
These are just my working notes, included here in case they can help others.

This is on my new mac too, so includes installing software.
 
Watch [good tut](https://www.youtube.com/watch?v=8jI1TuEaTro&t=1831s) - and the rest is basically following this :


Install geth, and do “geth --testnet” and leave that running in the background for later


Come up with cool idea : “blockstore” - like “localStorage” for the blockchain !


Make repo : https://github.com/krisrandall/blockstore


Download MacDown, and Visual Studio, and do View>Extensions>”Solidity”>Install


Start [experimenting with online contract writing](https://ethereum.github.io/browser-solidity/#version=soljson-v0.4.11+commit.68ef5810.js)


Install testrpc  (npm install -g ethereumjs-testrpc)


`$ truffle init`   ... put in my initial code (that i’ve been working on in that “solidity real time compiler” online)


`$ truffle compile` ...  (but first modify “2_deploy_contracts.js” to just compile my BlockStore before doing this)


`$ npm install -g truffle-expect truffle-config web3`


In another console : `$ testrpc` ...  (this is a local blockchain simulator)


`$ truffle migrate --reset` 


So . as I’ve made my initial code . in theory I can actually run the thing now, so that’s the next steps :


 
 
## Using the BlockStore Smart Contract
 
`$ truffle console`    (while testrpc is running in another console)


> var blockStore = BlockStore.deployed();     
> blockStore.store(‘my_var’, ‘my first test of my first contract!’);     


However this doesn’t work!
So I’m trying to figure this out at the moment :
https://ethereum.stackexchange.com/questions/19280/truffle-always-says-my-function-is-not-a-function 
...
OK - found an answer.


> BlockStore.deployed().then( function(instance) { b = instance; } )    
> b.store( 'my_var', 'my first successful store' )    
> b.fetch.call( 'my_var' )

NB: don’t use .call for the store, but do for the .fetch !


And that actually worked !!!
I’m going to now try to do this as another account to confirm that the stored value is unique to account.

I'm really struggling figuring out how to change accounts at the moment ... I want to test this with a different account to ensure we get different variables for each ... I'll put the answer here when I figure it out ..


## Attempting to Put this contract onto the live blockchain

1. Download and install "geth" ([see here](https://www.ethereum.org/cli))

2. Run it for a few days (`$ geth`) until the entire blockchain is downloaded ... seems to be when the entries start looking like this 

    > INFO [07-05|18:21:41] Imported new state entries               count=192 flushed=137 elapsed=291.528ms processed=794757 pending=17851 retry=890  duplicate=4114 unexpected=11619
   
    **Edit: that was wrong** - it's ready when `> eth.getBlock("latest").number` (in the other terminal, see next step) returns something other than "0" .. and it seems that the very last few hundred blocks take much longer than the rest, but perhaps thats just because I was watching those ones.

3. in a 2nd terminal run `$ geth attach` and do the following from in there :

4. `> personal.newAccount('password');`

5. Save that address (and that 'password'), and transfer ether to it (eg. from [Poloniex](https://poloniex.com/))

6. This will take some time to happen, but once it is done you can see the value against your new account in the geth terminal : `> web3.eth.getBalance(web3.eth.accounts[0])`
 
7. Now compile the contract using the online compiler (NB: could also install local compiler - see [this doc](https://github.com/ethereum/go-ethereum/wiki/Contract-Tutorial)) :
    1. https://ethereum.github.io/browser-solidity/
    2. Paste in the smart contract code, 
    3. click Create
    4. click Contract Details,
    5. and copy the Web3 deploy code
    
8. paste that Web3 deploy code into the geth console.   
     NB: I got "authentication needed: password or unlock undefined" at first, so need to do `> personal.unlockAccount(web3.eth.accounts[0], "password")` first, then paste in the code,    
     *the 2nd time I had insuffient gas, so need more - can tell how much gas is needed by getting the transaction cost shown on the online compiler and multiplying it by 0.001 (the ether price of gas [according to this redit thread](https://www.reddit.com/r/ethereum/comments/2udvau/what_is_the_difference_between_gas_and_ether/)) - for my contract this will be $145,852.00 AUD at the current exchange rate .. that is more than I'm willing (or able) to pay at this time ... I hope that is wrong ... i'm now transferring all my ether (0.06541081) about 22 dollars worth .. still insufficient funds .. thats a bit sad*
     
9. Now I'm going to try a "kris was 'ere" contract ... nope! :( I don't even have the funds for that.

Need to kind of reassess things at this point - I could do it on the test block chain, but the point is to actually do something real.
On the one hand I understand that installing a program of mine on thousands of peoples computers (probably millions in the future) for all eternity potentially should cost something .. on the other hand I'd really like to know exactly what that cost would be ... I haven't found a simple answer on the web .. all I know is that it's more than $22.

Hmmm... [here](http://ethgasstation.info/calculator.php) is a great calculator ... but according to that I should have plenty of ETH for this transaction ... perhaps I'm missing something ...

.. OK - I'm going to go with : I need to sign the contract with my own account, that makes sense anyways, and the error would make sense too - if the account that signs the contract upon compilation in the online compiler is a random on with no gas in it ... I'm making a few assumptions here .. but they are good ones ...

I'm going to commit these ramblings .. because once i've managed to achieve it all I'll probably clean this whole doc up again .. and I certainly wouldn't want this to be lost forever ..

    
    	
 Trying this : https://github.com/ethereum/solc-js
 
 Actually, first trying this : downloading mist : https://github.com/ethereum/mist/releases
 
 Ok - I think deploying via mist has worked ! 
 Contract is in this block ? : https://etherscan.io/block/0x8a8a6b8210980d9f5dd58e063eba543ceccbdf6dc5985ee73f1d866c63ba6325
 
 This is the Block Store contract on the live chain : 0xd9889b8649E8CC758782490229eb4F7F9A1d64d9
 
 I think it cost about 0.01 ETH -- $3.50 AUD -- this is ok.
 
 
Here is the site I used for conversion : https://www.coingecko.com/en/price_charts/ethereum/aud

I'm going to commit this now -- later today, or in the next few days, I will try storing and fetching something from the contract, then update all this documentation into something that is useful for both showing people how to easily use the contract, and also as a clear tut for putting your contract onto the blockchain.

