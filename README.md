# Dim Sum Vault Frontend

## Descripción

_Dim Sum Vault Frontend_ en una aplicación Next.js que sirve como frontend para la bóveda tokenizada [_Dim Sum Vault_](https://github.com/ccalvarez/dim-sum-vault) :rice: basada en el estándar ERC-4626, cuyo contrato Solidity se encuentra desplegado en la red de pruebas Ethereum Sepolia Testnet.

El objetivo es proveer la interfaz web para interactuar con la operación _**Stake**_ de la bóveda.

  <!-- prettier-ignore -->

![](/resources/dim-sum-vault-use-case.drawio.png) <br>_<small>Diagrama de casos de uso de la bóveda tokenizada Dim Sum Vault<small>_ :rice:

## Pruebas unitarias

Se escribieron [pruebas unitarias](packages\foundry\test\DimSumVault.t.sol) para las siguientes funcionalidades principales de la bóveda tokenizada:

- Stake
- Unstake
- Distribute Earnings

## Contratos validados

- [STRANGE Token (asset de la bóveda)](https://sepolia.etherscan.io/address/0x7EdDe69d363fCE3a8B39f9531Daf44dd20f46c09)

- [Dim Sum Vault](https://sepolia.etherscan.io/address/0x61568dc66EfB32796fb9d77d863c105723f9EbAC)

## Herramientas de desarrollo

Decidimos utilizar las siguientes herramientas de desarrollo del ecosistema de Ethereum:

- [Scaffold-ETH 2](https://scaffoldeth.io)

- [Foundry](https://book.getfoundry.sh)

## Herramientas de colaboración

Estamos dando seguimiento a las tareas con integración a GitHub por medio de [_Trello_](https://trello.com/b/oKAhGxl8/dim-sum) :bookmark_tabs:

## Integrantes del equipo

[@ccalvarez](https://github.com/ccalvarez) - Carolina Cordero\
[@fedejim](https://github.com/fedejim) - Federico Jiménez\
[@aorue1](https://github.com/aorue1) - Andrés Orué Moraga\
[@Z3R0BYT3](https://github.com/Z3R0BYT3) - Alejandro Cañas
