const AuroraSocial = artifacts.require("AuroraSocial");

module.exports = async function (deployer) {
  await deployer.deploy(AuroraSocial);
};