pragma solidity ^0.4.11;

import "truffle/Assert.sol";
import "truffle/DeployedAddresses.sol";
import "../contracts/Purchase.sol";

contract Testpurchase
{
	Purchase purchase = Purchase(DeployedAddresses.Purchase());

	function testUserCanPurchaseVeggie()
	{
		uint returnedId = purchase.buy(8);
		uint expected = 8;

		Assert.equal(returnedId, expected, "purchase of veg ID 8 should be recorded.");
	}
	function testGetPurchasersAddressByVegIdInArray()
	{
		address expected = this;
		address[16] memory purchasers = purchase.getPurchasers();

		Assert.equal(purchasers[8], expected, "Owner of veg ID 8 should be recorded.");
	}
}
