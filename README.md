# BlockStore


A public key-value storage space on the blockchain.

## To access the live contract 

*TODO : put on blockchain and put address here*

## To use the BlockStore

#### To store a value

`BlockStore.store( 'my_variable_name', 'my variable value' )`

#### To retrieve a value

`BlockStore.fetch.call( 'my_variable_name' )`

####Via `truffle console` :

```
> BlockStore.deployed().then( function(instance) { b = instance; } )     
> b.store( 'my_var', 'my first successful store' )
> b.fetch.call( 'my_var' )
```
 
## Other Notes

Here are my working notes from start to finish creating an ethereum solidity smart contract : [docs/GettingStarted.md](docs/GettingStarted.md)