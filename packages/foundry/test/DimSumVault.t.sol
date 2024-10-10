// SPDX-License-Identifier: MIT
pragma solidity ^0.8.20;

import "forge-std/Test.sol";
import "../contracts/DimSumVault.sol";
import "@openzeppelin/contracts/token/ERC20/ERC20.sol";
import "forge-std/console.sol";


contract MockERC20 is ERC20 {
    constructor() ERC20("Mock Token", "MTK") {
        _mint(msg.sender, 1000000 * 10**18);
    }
}

contract MockERC20share is ERC20 {
    constructor() ERC20("Mock Token Share", "MTKs") {
        _mint(msg.sender, 1000000 * 10**18);
    }
}

contract DimSumVaultTest is Test {
    DimSumVault public vault;
    MockERC20 public asset;
    MockERC20share public share;
    address public owner;
    address public user1;
    address public user2;

    function setUp() public {
        owner = address(this);
        user1 = address(0x1);
        user2 = address(0x2);
        
        asset = new MockERC20();
        share = new MockERC20share();
        vault = new DimSumVault(asset);

        // Approve vault to spend tokens
        asset.approve(address(vault), type(uint256).max);
        share.approve(address(vault), type(uint256).max);
        vm.startPrank(user1);
        asset.approve(address(vault), type(uint256).max);
        share.approve(address(vault), type(uint256).max);
        vm.stopPrank();
        vm.startPrank(user2);
        asset.approve(address(vault), type(uint256).max);
        share.approve(address(vault), type(uint256).max);
        vm.stopPrank();
        // Transfer some tokens to users
        asset.transfer(user1, 1000 * 10**18);
        asset.transfer(user2, 1000 * 10**18);
    }

    function testStakeAndUnstake() public {
        uint256 stakeAmount = 100 * 10**18;
        
        vm.startPrank(user1);
        uint256 sharesBefore = vault.balanceOf(user1);
        vault.stake(stakeAmount, user1);
        uint256 sharesAfter = vault.balanceOf(user1);
        assertGt(sharesAfter, sharesBefore, "Shares should increase after staking");

        uint256 unstakeAmount = 50 * 10**18;
        uint256 assetsBefore = asset.balanceOf(user1);
        vault.unstake(unstakeAmount, user1, user1);
        uint256 assetsAfter = asset.balanceOf(user1);
        assertGt(assetsAfter, assetsBefore, "Assets should increase after unstaking");
        vm.stopPrank();
    }

   // ... (previous code remains the same)

function testDistributeEarnings() public {
    uint256 stakeAmount = 100 * 10**18;
    
    vm.prank(user1);
    vault.stake(stakeAmount, user1);
    vm.prank(user2);
    vault.stake(stakeAmount, user2);

    // Simulate some fees collected
    
    console.log(vault.balanceOf(user1));
    vm.prank(user1);
    vault.unstake(50 * 10**18, user1, user1);

    // Fast forward to the end of the cycle
    vm.warp(8 days);
    
    uint256 user1BalanceBefore = vault.balanceOf(user1);
    uint256 user2BalanceBefore = vault.balanceOf(user2);

    vault.distributeEarnings();

    uint256 user1BalanceAfter = vault.balanceOf(user1);
    uint256 user2BalanceAfter = vault.balanceOf(user2);

    assertGt(user1BalanceAfter, user1BalanceBefore, "User1 balance should increase after distribution");
    assertGt(user2BalanceAfter, user2BalanceBefore, "User2 balance should increase after distribution");
}

function testDistributeEarningsBeforeCycleEnd() public {
    vm.expectRevert("El ciclo de staking no ha terminado");
    vault.distributeEarnings();
}



}