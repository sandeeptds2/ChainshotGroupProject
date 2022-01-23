const { assert } = require("chai")

describe("Mission", function () {
  let contract = null
  let founders = null
  let statement = "Chancellor of the Chainshot University"

  beforeEach(async () => {
    const Mission = await ethers.getContractFactory("Mission")
    founders = Array.from(await ethers.getSigners()).slice(
      0, 3).map(signer => signer.address)
    contract = await Mission.deploy(founders, statement)
    await contract.deployed()
  })

  it("should be deployed with arguments", async function () {
    const root = await contract.root()
    assert.equal(root.proposal, statement)
    assert.equal(root.level, 3)
    assert.equal(root.holder, contract.address)
  })
})

