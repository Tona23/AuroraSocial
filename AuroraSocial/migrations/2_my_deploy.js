const DataBase = artifacts.require("DataBase");

module.exports = async function (deployer) {
  await deployer.deploy(DataBase);
};