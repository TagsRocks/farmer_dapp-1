pragma solidity ^0.4.4;

/*
** Code below from http://truffleframework.com/tutorials/pet-shop
** adapted for farmer_dapp
**
** Anselme
*/

contract Purchase
{
	address[16] public purchasers;

	function buy(uint vegId) public returns (uint)
	{
		require(vegId >= 0 && vegId <= 15);
		purchasers[vegId] = msg.sender;
		return vegId;
	}

	function getPurchasers() public returns (address[16])
	{
		return purchasers;
	}
}
