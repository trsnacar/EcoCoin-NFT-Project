const EcoCoin = artifacts.require("EcoCoin");
const EcoNFT = artifacts.require("EcoNFT");
const GreenDonation = artifacts.require("GreenDonation");

module.exports = function (deployer) {
  deployer.deploy(EcoCoin, 1000000); // Başlangıç arzı
  deployer.deploy(EcoNFT);
  deployer.deploy(GreenDonation, EcoCoin.address);
};
