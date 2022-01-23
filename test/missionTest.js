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

  it("should be deployed with arguments", async () => {
    const root = await contract.root()
    assert.equal(root.proposal, statement)
    assert.equal(root.level, 3)
    assert.equal(root.holder, contract.address)
  })

  it('gets the trust chain of its founders', async () => {
    const root = await contract.root()
    const chain1 = await contract.getTrustChain(founders[0])
    const chain2 = await contract.getTrustChain(founders[1])
    const chain3 = await contract.getTrustChain(founders[2])

    assert.equal(chain1.length, 1)
    assert.equal(chain2.length, 1)
    assert.equal(chain3.length, 1)
    assert((new Set(...chain1, ...chain2, ...chain3)).size, 3)
  })
})

