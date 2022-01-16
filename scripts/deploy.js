// import Escrow from './artifacts/contracts/Escrow.sol/Escrow';
// import {ethers} from 'ethers';

// const provider = new ethers.providers.Web3Provider(ethereum);

// export default async function deploy(arbiter, beneficiary, value) {
//   await ethereum.request({ method: 'eth_requestAccounts' });
//   const signer = provider.getSigner();
//   const factory = new ethers.ContractFactory(Escrow.abi, Escrow.bytecode, signer);
//   return factory.deploy(arbiter, beneficiary, { value });
// }

// async function main() {
//   const [deployer] = await ethers.getSigners();

//   console.log("Deploying contracts with the account:", deployer.address);

//   const weiAmount = (await deployer.getBalance()).toString();
  
//   console.log("Account balance:", (await ethers.utils.formatEther(weiAmount)));

//   // make sure to replace the "GoofyGoober" reference with your own ERC-20 name!
//   const Token = await ethers.getContractFactory("TrustToken");
//   const token = await Token.deploy();

//   console.log("Token address:", token.address);
// }

// main()
//   .then(() => process.exit(0))
//   .catch((error) => {
//     console.error(error);
//     process.exit(1);
// });

async function main() {
    const [deployer] = await ethers.getSigners();
  
    console.log("Deploying contracts with the account:", deployer.address);
  
    const weiAmount = (await deployer.getBalance()).toString();
    
    console.log("Account balance:", (await ethers.utils.formatEther(weiAmount)));
  
    const Token = await ethers.getContractFactory("TrustToken");
    const token = await Token.deploy();
  
    console.log("Token address:", token.address);
  }
  
  main()
    .then(() => process.exit(0))
    .catch((error) => {
      console.error(error);
      process.exit(1);
  });