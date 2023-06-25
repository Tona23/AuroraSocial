// SPDX-License-Identifier: MIT
pragma solidity ^0.8.0;
//Crear matriz 
contract DataBase {

   struct Persona {
        string usuario;     
        string correo;
        address wallet;
    }

    mapping(uint256 => Persona) public personas;
    uint256 public totalPersonas;

     function setPersona(
        string memory _usuario,
        string memory _correo,
        address _wallet
    ) public {
        personas[totalPersonas] = Persona(
  
             _usuario,
             _correo,
            _wallet
        );
        totalPersonas++;
    }

    function getPersona(uint256 _indice)
        public
        view
        returns (
            string memory,
            string memory,
            address
        )
    {
        require(_indice < totalPersonas, "Indice fuera de rango");
        Persona memory persona = personas[_indice];
        return (

            persona.usuario,
            persona.correo,
            persona.wallet
        );
    }


    function getCorreo(uint256 _indice)
        public
        view
        returns (
            string memory
        )
    {
        require(_indice < totalPersonas, "Indice fuera de rango");
   
           return personas[_indice].correo;

    }

    function setCorreo(
        uint256 _indice,string memory _correo

    ) public {
        personas[_indice].correo = _correo;
    }

    function getUsuario(uint256 _indice)
        public
        view
        returns (
            string memory
        )
    {
        require(_indice < totalPersonas, "Indice fuera de rango");
       
           return personas[_indice].usuario;
     }

    function setUsuario(
        uint256 _indice,string memory _usuario

    ) public {
        personas[_indice].usuario = _usuario;
    }

    function getWallet(uint256 _indice)
        public
        view
        returns (
            address
        )
    {
        require(_indice < totalPersonas, "Indice fuera de rango");
    
           return personas[_indice].wallet;
    }

}