# AuroraSocial
Hackathon Encode x Aurora
![Logo](https://raw.githubusercontent.com/Tona23/AuroraSocial/main/AuroraSocial.png)

Dapp development:
   - Contracts
      - Data Base
      - Royalties
      - Vote
      - Bet
      - Claim Royalties
   - Code
      - Interaction create new register
      - Interaction create new post
      - Interaction whith posts
   - Interface
      - Development of the pages
      - Templates 

Dapp:
   - Register
      - Usser
      - Mail
      - Sing_in
      - Sing_up
![Registro](https://raw.githubusercontent.com/Tona23/AuroraSocial/main/Registro.png)

   - Templates
      - New Post
      - Post New Code
      - Vote
      - Bet
![Post](https://raw.githubusercontent.com/Tona23/AuroraSocial/main/Post.png)

   - New Post
      - Create new post
      - Create Post New Code
      - Create Vote-
      - Create Bet
        ![Create](https://raw.githubusercontent.com/Tona23/AuroraSocial/main/create.png)

   - Update
      - See all community posts
      - Interact with posts
![Update](https://raw.githubusercontent.com/Tona23/AuroraSocial/main/publi.png)
![regalia](https://raw.githubusercontent.com/Tona23/AuroraSocial/main/Regalia.png)


Metapool and stNear integration:
   - Lock royalties for n months, while they are liquid staking
   - The user receives the original royalties and the performance remains on the platform to self-finance avoiding advertising and subscription charges, all transactions by the user will be through eth (soon with stNear, Aurora, stAurora)
![Metapool](https://raw.githubusercontent.com/Tona23/AuroraSocial/main/Metapool.png)

Yield management and monetization:
   - The wallet that created the contract will receive the royalties every n time, then they will take the crypto to metapool to put funds into Liquid Stake
   - After a while Unstake is made and the crypto are returned to the wallet, from the wallet they are deposited to the contract again to be able to distribute the royalties in eth Unstake
![Unstake](https://raw.githubusercontent.com/Tona23/AuroraSocial/main/Unstake.png)

Withdrawal of Royalty:
   - Users get their royalties by claiming after n months

# Code
- Download the AuroraSocial folder
- Install truffle in case you don't have it installed
- Create .env file in which you should place private key and api infiura
- If you want to compile a new contract you should write the following code in the project root "npx truffle migrate --network " followed by the name of the network you want to deploy to and delete the existing json files
- Edit all js files in the "NETWORK_ID" variable depending on the selected network
- Run local server
- Open in file "registro.html"

# Nota
- The contracts are not audited
- The Dapp is in the development stage, with your support an alpha version can be launched
- The interface usually has errors due to the connection between the code and the contracts, so it is necessary to close and reopen the dapp
