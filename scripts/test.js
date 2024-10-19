( async () =>{
    let accounts = await web3.eth.getAccounts()
    console.log(accounts.length);
    console.log(accounts);
    console.log(accounts[0]);

})()