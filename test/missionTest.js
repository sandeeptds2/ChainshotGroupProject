const { assert } = require("chai");

describe("Mission", function () {
  let contract;
  let statement = "Chancellor of the Chainshot University";
  beforeEach(async () => {
    let founder1 = ethers.provider.getSigner(0);
    let founder2 = ethers.provider.getSigner(1);
    let founder3 = ethers.provider.getSigner(2);
    let founders = [founder1, founder2, founder3];

    const Mission = await ethers.getContractFactory("Mission");
    contract = await Mission.deploy(founders, statement);
    await contract.deployed();
  });

  it("should be found initially", async function () {
    let root = await contract.root();
    assert.equal(root.proposal, statement);
  });

});

