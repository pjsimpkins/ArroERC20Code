require('dotenv').config();
const { env } = process;
const HDWalletProvider = require('@truffle/hdwallet-provider');

module.exports = {
  networks: {
    development: {
      protocol: 'http',
      host: 'localhost',
      port: 8545,
      gas: 5000000,
      gasPrice: 5e9,
      networkId: '*',
    },
    "arro-dev-setnet": {
      protocol: 'http',
      host: 'localhost',
      port: 8545,
      gas: 5000000,
      gasPrice: 5e9,
      networkId: '*',
    },
    "arro-dev-mainnet": {
      protocol: 'http',
      host: 'localhost',
      port: 8546,
      gas: 5000000,
      gasPrice: 5e9,
      networkId: '*',
    },
    ropsten: {
      provider: () => new HDWalletProvider(
        env.ROPSTEN_MNEMONIC, env.ROPSTEN_URL
      ),
      networkId: 3,
      gasPrice: 20e9
    },
    mainnet: {
      provider: () => new HDWalletProvider(
        env.MAINNET_PRIVATE_KEY, env.MAINNET_URL
      ),
      networkId: 1,
    }
  },
};
