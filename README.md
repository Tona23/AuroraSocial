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


Integración de Metapool y stNear:
   - Bloquear las regalias por n meses, mientras estan en liquid staking  
   - El usuario recibe las regalias originales y el rendimiento se queda en la plataforma para autofinanciarse evitando publicidad y cobro por suscripcion, todas las transacciones por parte del usuario seran a travez de eth (proximamente con stNear,Aurora, stAurora)
![Metapool](https://raw.githubusercontent.com/Tona23/AuroraSocial/main/Metapool.png)

Gestión de rendimientos y monetización:
   - La wallet creadora del contrato recibira las regalias cada n tiempo , depues se llevaran las crypto a metapool para meter fondos a Liquid Stake  
   - Despues de n tiempo se hace Unstake y se regresan las crypto a la wallet, de la wallet se depositan al contrato de nuevo para poder repartir las regalias en eth
![Unstake](https://raw.githubusercontent.com/Tona23/AuroraSocial/main/Unstake.png)

Retiro de Regalias:
   - Los usuarios obtienen sus regalias haciendo claim despues de n meses

# Code
- Descargar la carpeta AuroraSocial
- Instalar truffle en caso de no tenerlo instalado 
- crear archivo .env en el cual debera colocar llave privada y api infiura
- Si desea compilar un nuevo contrato debera escribir el siguiente codigo en la raiz del proyecto
   "npx truffle migrate --network " seguido del nombre de la network en la que quiere hacer deploy y eliminar los archivos json existentes
- Editar todos los archivo js en la variable "NETWORK_ID" dependiendo de la network seleccionada
- Correr servidor local
- Abrir en archivo "registro.html"

# Nota
- Los contratos no estan Auditados
- La Dapp se encuentra en etapa de desarrollo , con tu apoyo podra lanzarse una version alpha
- La interfaz suele tener errores por la conexion entre el codigo y los contratos, por lo que es necesario cerrar y abrir de nuevo la dapp
