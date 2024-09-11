import React, { useEffect, useState } from "react";
import Web3 from "./web3";

function App() {
  const [account, setAccount] = useState("");
  const [balance, setBalance] = useState(0);

  useEffect(() => {
    loadBlockchainData();
  }, []);

  const loadBlockchainData = async () => {
    const web3 = Web3();
    const accounts = await web3.eth.getAccounts();
    setAccount(accounts[0]);

    // EcoCoin sözleşmesi adresi ve ABI'sini eklemen gerekiyor
    const ecoCoinContract = new web3.eth.Contract(EcoCoinABI, "EcoCoinContractAddress");
    const balance = await ecoCoinContract.methods.balanceOf(accounts[0]).call();
    setBalance(balance);
  };

  return (
    <div>
      <h1>EcoCoin Dapp</h1>
      <p>Hesap: {account}</p>
      <p>Bakiye: {balance}</p>
    </div>
  );
}

export default App;
