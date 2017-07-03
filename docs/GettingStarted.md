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


## Putting this contract onto the live blockchain


 
 
