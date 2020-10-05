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
    ropsten: {
      provider: () => new HDWalletProvider(
        env.ROPSTEN_MNEMONIC, env.ROPSTEN_URL
      ),
      networkId: 3,
      gasPrice: 10e9
    }
  },
};
