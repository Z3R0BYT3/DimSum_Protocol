//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "../contracts/Strange.sol";
import "../contracts/DimSumVault.sol";
import "./DeployHelpers.s.sol";


contract DeployYourContract is ScaffoldETHDeploy {
  function run() external ScaffoldEthDeployerRunner {
    // Deploy STRANGE token
    STRANGE strangeToken = new STRANGE(10000000000000000000000); // 10,000

    address recipient = 0x1d44b5731Bc33A7D9b910d9bA06BF50DA67792d7;
    uint256 amount = 100 * 10 ** 18; // 100 tokens, assuming 18 decimals

    // Transfer tokens to dummy wallet in frontend
    bool success = strangeToken.transfer(recipient, amount);
    require(success, "Transfer failed");

    // Deploy DimSumVault
    DimSumVault vaultContract = new DimSumVault(ERC20(address(strangeToken)));

    console.logString(
      string.concat(
        "DimSumVault deployed at: ", vm.toString(address(vaultContract))
      )
    );

    // Approve vault to spend tokens on behalf of recipient
    // vm.startPrank(recipient);
    // success = strangeToken.approve(address(vaultContract), amount);
    // require(success, "Approval failed");
    // vm.stopPrank();
  }
}
