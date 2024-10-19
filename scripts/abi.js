(async()=>{
    const adress = "0x26b989b9525Bb775C8DEDf70FeE40C36B397CE67"
    const abi =  [
		{
			"inputs": [],
			"name": "data",
			"outputs": [
				{
					"internalType": "uint256",
					"name": "",
					"type": "uint256"
				}
			],
			"stateMutability": "view",
			"type": "function"
		},
		{
			"inputs": [
				{
					"internalType": "uint256",
					"name": "param",
					"type": "uint256"
				}
			],
			"name": "setint",
			"outputs": [],
			"stateMutability": "nonpayable",
			"type": "function"
		}
	];
    const contractinst = new web3.eth.Contract(abi,adress);
    console.log(await contractinst.methods.data().call());
    let accounts = await web3.eth.getAccounts();
    await contractinst.methods.setint(900).send({from: accounts[0]});

    console.log(await contractinst.methods.data().call());

})()