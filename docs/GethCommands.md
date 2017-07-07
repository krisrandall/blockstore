# Handy Geth Commands

##### See balance of (all) account(s)

`> for (var i=0; i<web3.eth.accounts.length; i++) { console.log(web3.eth.accounts[i]+" has "+web3.eth.getBalance(web3.eth.accounts[i])); }`


##### Fix "ReferenceError: 'accounts' is not defined". 

`> web3.eth.defaultAccount = web3.eth.accounts[0]`

##### Fix "Error: authentication needed: password or unlock"

`> personal.unlockAccount(web3.eth.defaultAccount, 'password')`


