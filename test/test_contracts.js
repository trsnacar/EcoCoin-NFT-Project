const EcoCoin = artifacts.require("EcoCoin");

contract("EcoCoin", accounts => {
  it("should put 1000000 EcoCoin in the first account", async () => {
    const instance = await EcoCoin.deployed();
    const balance = await instance.balanceOf(accounts[0]);
    assert.equal(balance.toString(), '1000000000000000000000000'); // 1000000 ECO
  });
});
