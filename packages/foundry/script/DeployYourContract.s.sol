//SPDX-License-Identifier: MIT
pragma solidity ^0.8.19;

import "../contracts/Strange.sol";
import "../contracts/DimSumVault.sol";
import "./DeployHelpers.s.sol";


contract DeployYourContract is ScaffoldETHDeploy {
  function run() external ScaffoldEthDeployerRunner {
    // Deploy STRANGE token
    STRANGE strangeToken = new STRANGE(10000000000000000000000); // 10,000

    address recipient = 0x57A6583F0aB367809ea6475C2452264789817440;
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
