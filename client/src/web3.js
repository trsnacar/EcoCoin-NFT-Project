import Web3 from "web3";

const getWeb3 = () => {
  return new Web3(Web3.givenProvider || "http://localhost:8545");
};

export default getWeb3;
