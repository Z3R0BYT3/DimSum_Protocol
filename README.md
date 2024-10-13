# Dim Sum Vault Frontend

## Descripción

_Dim Sum Vault Frontend_ en una aplicación Next.js que sirve como frontend para la bóveda tokenizada [_Dim Sum Vault_](https://github.com/ccalvarez/dim-sum-vault) :rice: basada en el estándar ERC-4626, cuyo contrato Solidity se encuentra desplegado en la red de pruebas Ethereum Sepolia Testnet.

El objetivo es proveer la interfaz web para interactuar con las operaciones _**Stake, Unstake**_ y _**Redeem**_ de la bóveda.

  <!-- prettier-ignore -->

![](/resources/dim-sum-vault-use-case.drawio.png) <br>_<small>Diagrama de casos de uso de la bóveda tokenizada Dim Sum Vault<small>_ :rice:

## Pruebas unitarias

Se escribieron [pruebas unitarias](packages/foundry/test/DimSumVault.t.sol) para las siguientes funcionalidades principales de la bóveda tokenizada:

- Stake
- Unstake
- Distribute Earnings

## Contratos validados

- [STRANGE Token (asset de la bóveda)](https://sepolia.etherscan.io/address/0x7EdDe69d363fCE3a8B39f9531Daf44dd20f46c09)

- [Dim Sum Vault](https://sepolia.etherscan.io/address/0x082c7d9448ffc9a596b00e99346e14137a30fd44)

## Instrucciones para el despliegue y verificación en Etherscan

Despliegue del contrato

```sh
forge create --rpc-url https://rpc2.sepolia.org --private-key <REPLACE-ME-FOR-PRIVATE-KEY> packages/foundry/contracts/DimSumVault.sol:DimSumVault --remappings @openzeppelin/contracts/=packages/foundry/lib/openzeppelin-contracts/contracts --constructor-args "REPLACE-ME-FOR-TOKEN-ADDRESS" --etherscan-api-key <REPLACE-ME-FOR-ETHERSCAN-API-KEY>
```

Verificación del contrato

```sh
forge verify-contract --chain-id 11155111 <REPLACE-ME-FOR-VAULT-ADDRESS> DimSumVault --etherscan-api-key <REPLACE-ME-FOR-ETHERSCAN-API-KEY> --watch --constructor-args "0x0000000000000000000000007edde69d363fce3a8b39f9531daf44dd20f46c09"
```

## Instrucciones para la publicación del frontend en Vercel

Generar el build para producción

```sh
yarn next:build
```

Publicar en Vercel

```sh
yarn vercel
```

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
