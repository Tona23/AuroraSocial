const NETWORK_ID = 11155111
var NFT_PRICE = null
var PRESALE_PRICE = null
var MAX_SUPPLY = null
var MAX_PRESALE_SUPPLY = null
var contract
var accounts
var web3
var balance
var available
var mint_amount

function network(){
// Crear una instancia de Web3 utilizando el proveedor de Metamask
const web3 = new Web3(window.ethereum);

// Cambiar a la red de Polygon (Matic)
web3.eth.net.getId()
  .then((networkId) => {
    if (networkId !== NETWORK_ID ) {
      window.ethereum.request({
        method: 'wallet_switchEthereumChain',
        params: [{ chainId: '0x4e454152' }], // Cambiar 3 por 2 para Mainnet
      })
      .then(() => {
        // Cambio de red exitoso
        console.log('Se cambió a la red de Polygon');
      })
      .catch((error) => {
        // Error al cambiar de red
        console.error('Error al cambiar a la red de Polygon:', error);
      });
    }
  })
  .catch((error) => {
    // Error al obtener el ID de la red actual
    console.error('Error al obtener el ID de la red:', error);
  })
}
network()

function metamaskReloadCallback()
{
  window.ethereum.on('accountsChanged', (accounts) => {
    document.getElementById("web3_message").textContent="Accounts changed, realoading...";
    window.location.reload()
  })
  window.ethereum.on('networkChanged', (accounts) => {
    document.getElementById("web3_message").textContent="Network changed, realoading...";
    window.location.reload()
  })
}

const getAccounts = async () => {
  metamaskReloadCallback()
  try {
    await window.ethereum.request({ method: "eth_requestAccounts" })
    resolve(web3)
  } catch (error) {
    console.log(error)
  }
}

const getWeb3 = async () => {
  return new Promise((resolve, reject) => {
    if(document.readyState=="complete")
    {
      if (window.ethereum) {
        const web3 = new Web3(window.ethereum)
        resolve(web3)
      } else {
        reject("must install MetaMask")
        document.getElementById("web3_message").textContent="Error: Please install Metamask";
      }
    }else
    {
      window.addEventListener("load", async () => {
        if (window.ethereum) {
          const web3 = new Web3(window.ethereum)
          resolve(web3)
        } else {
          reject("must install MetaMask")
          document.getElementById("web3_message").textContent="Error: Please install Metamask";
        }
      });
    }
  });
};

function handleRevertError(message) {
  alert(message)
}

async function getRevertReason(txHash) {
  const tx = await web3.eth.getTransaction(txHash)
  await web3.eth
    .call(tx, tx.blockNumber)
    .then((result) => {
      throw Error("unlikely to happen")
    })
    .catch((revertReason) => {
      var str = "" + revertReason
      json_reason = JSON.parse(str.substring(str.indexOf("{")))
      handleRevertError(json_reason.message)
    });
}

var contractR
var accountsR
var web3R

const getContractA = async (web3) => {
  const data = await getJSON("AuroraSocial.json")
  const netId = await web3.eth.net.getId()
  const deployedNetwork = data.networks[netId]
  const contract = new web3.eth.Contract(
    data.abi,
    deployedNetwork && deployedNetwork.address
  )
  return contract
}

function getJSON(url) {
  return new Promise(resolve => {
    var xhr = new XMLHttpRequest()
    xhr.open("GET", url, true)
    xhr.responseType = "json"
    xhr.onload = function () {
      resolve(xhr.response)
    }
    xhr.send()
  })
}

async function load() {
  var awaitWeb3 = async function () {
    web3R = await getWeb3()
    web3R.eth.net.getId((err, netId) => {
      var awaitContract = async function () {
        contractR = await getContractA(web3R)
        var awaitAccounts = async function () {
          accountsR = await web3R.eth.getAccounts()
          console.log("Web3 loaded")
        }
        awaitAccounts()
      }
      awaitContract()
    })
  }
  awaitWeb3()
}

load()

async function getPost() {
  var indice = document.getElementById('input_indice').value
  if(indice!=""){
     try {
    
    const persona = await contractR.methods.getPost(indice).call();
    document.getElementById("p_hello").innerHTML="Nombre: "+ persona[0]+"<br>Correo: "+ persona[1]+"<br>Wallet: "+ persona[2]
    console.log('Detalles de la persona:');
    console.log('Nombre:', persona[0]);
    console.log('Correo:', persona[1]);

    console.log('Dirección:', persona[2]);
  } catch (error) {
    console.error('Error al obtener persona:', error);
  }
  }
}

var key=""
var wallet=getWallet()

function getWallet(){
  
  if (typeof window.ethereum !== 'undefined') {
    const provider = window.ethereum;
  
    // Obtener la dirección de la billetera activa en Metamask
    provider.request({ method: 'eth_requestAccounts' })
      .then((accounts) => {
        
        wallet= accounts[0];
        
      })
      .catch((error) => {
        console.error('Error al obtener la dirección de la billetera:', error);
      });
     
  } else {
    console.error('Metamask no está instalado o no está disponible');
}
return wallet
}

const setLog = async () => {
  
  console.log("wallet: "+wallet)
    var nombre = document.getElementById('title').value
  var content = document.getElementById('content').value
  
  if(nombre!=""&&content!=""){

     const result = await contractR.methods.setPost("Post",nombre,content)
            .send({ from: accountsR[0], gas: 400000 })
            window.location.href = 'aurorasocial.html';
  }
}
