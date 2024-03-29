const { ethers, upgrades } = require("hardhat");

async function main() {
    const MintNFT_V1 = await ethers.getContractFactory("MintNFT_V1");
    const mintNFT = await upgrades.deployProxy(MintNFT_V1, [], {initializer: 'initialize'});

    await mintNFT.deployed();

    console.log("MintNFT deployed to:", mintNFT.address);
}

main().catch((error) => {
    console.error(error);
    process.exitCode = 1;
});
