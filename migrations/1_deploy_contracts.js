const EcoCoin = artifacts.require("EcoCoin");
const EcoNFT = artifacts.require("EcoNFT");
const GreenDonation = artifacts.require("GreenDonation");

module.exports = async function (deployer) {
  await deployer.deploy(EcoCoin, 1000000); // Başlangıç arzı
  await deployer.deploy(EcoNFT);
  await deployer.deploy(GreenDonation, EcoCoin.address);
};
