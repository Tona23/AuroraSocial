# AuroraSocial
Hackathon Encode x Aurora
![Logo](https://raw.githubusercontent.com/Tona23/AuroraSocial/main/AuroraSocial.png)

Desarrollo de la plataforma web:
   - Contratos
      - Base de datos
      - Regalias
      - Votar
      - Apostar
      - Reclamar regalias
   - Codigo
      - Interaccion creando nuevo
      - Interaccion creando nuevas publicaciones
      - Interaccion con publicaciones
   - Interfaz
      - Desarrollo de las páginas
      - Plantillas 

Dapp:
   - Registro
      - Usuario
      - Correo
      - Sing_in
      - Sing_up 
   - Plantillas
      - New Post
      - Post New Code
      - Vote
      - Bet
   - New Post
      - Crear new post
      - Crear Post New Code
      - Crear Vote-
      - Crear Bet
   - Update
      - Ver todas las publicaciones de la comunidad
      - Interactuar con publicaciones

Integración de Metapool y stNear:
   - Bloquear las regalias por n meses, mientras estan en liquid staking  
   - El usuario recibe las regalias originales y el rendimiento se queda en la plataforma para autofinanciarse evitando publicidad y cobro por suscripcion, todas las transacciones por parte del usuario seran a travez de eth (proximamente con stNear,Aurora, stAurora)

Gestión de rendimientos y monetización:
   - La wallet creadora del contrato recibira las regalias cada n tiempo , depues se llevaran las crypto a metapool para meter fondos a Liquid Stake  
   - Despues de n tiempo se hace liquidity y se regresan las crypto a la wallet, de la wallet se depositan al contrato de nuevo para poder repartir las regalias en eth

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
