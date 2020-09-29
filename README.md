# Arro Token Contract
This repo contains the solidity contract code for the Arro.io (ARRO) ERC20 Token.
It uses OpenZeppelin SDK to create an upgradeable ERC20 Token contract.

### Installation
Install `yarn` and install dependencies
```
yarn install
```

### Development
Use a development blockchain to test the deployment of the smart contract.
In another tab / window run:
```
npx ganache-cli --deterministic
```

Take note of the accounts created.

Then compile and deploy 
```
npx oz compile
npx oz deploy
```

When deploying run the `initialize()` function with the expected owner.

To test instance methods on the contract use
```
npx oz call
```
Example:
```
? Pick a network development
? Pick an instance ArroToken at 0xA57B8a5584442B467b4689F1144D269d096A3daF
? Select which function owner()
✓ Method 'owner()' returned: 0xFFcf8FDEE72ac11b5c542428B35EEF5769C409f0
0xFFcf8FDEE72ac11b5c542428B35EEF5769C409f0
```

To test transactions similarly use
```
npx oz send-tx
```
Use the flag `-f` to specific `from` to test a transaction

### Testing
TDB

Any questions reach out to `oliver.w.garcia@gmail.com` or `evanscottgray@gmail.com`