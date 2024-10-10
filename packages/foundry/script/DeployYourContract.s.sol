//SPDX-License-Identifier: MIT
pragma solidity ^0.8.27;

import "../contracts/MockERC20.sol";
import "../contracts/DimSumVault.sol";
import "./DeployHelpers.s.sol";


contract DeployYourContract is ScaffoldETHDeploy {
  // use `deployer` from `ScaffoldETHDeploy`

  

  function run() external ScaffoldEthDeployerRunner {

    MockERC20 mockERC20 = new MockERC20(10000000000000000000); //10_000 tokens

    address recipient = 0x57A6583F0aB367809ea6475C2522647898175555; // dummy address
    uint256 amount = 100 * 10 ** 18;

    bool success = mockERC20.transfer(recipient, amount);
    require(success, "Transfer failed");

    DimSumVault vaultContract = new DimSumVault(ERC20(address(strangeToken)));

    console.logString(
      string.concat(
        "DimSumVault deployed at: ", vm.toString(address(vaultContract))
      )
    );
  }
}
