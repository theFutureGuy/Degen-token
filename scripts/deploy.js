const hre = require("hardhat");

async function main() {
  // Get the degen smart contract
  const Degen = await hre.ethers.getContractFactory("Degen");

  // Deploy it
  const degen = await Degen.deploy();
  await degen.waitForDeployment();

  // Display the contract address
  console.log(`degen token deployed to ${degen.target}`);
}

// Hardhat recommends this pattern to be able to use async/await everywhere
// and properly handle errors.
main().catch((error) => {
  console.error(error);
  process.exitCode = 1;
});
