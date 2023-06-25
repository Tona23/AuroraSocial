// SPDX-License-Identifier: MIT

pragma solidity ^0.8.0;

contract AuroraSocial {
    address public owner;    
    uint256 public totalContrato;
    uint256 public tCommentPost;
    uint256 public tCommentCode;
    uint256 public tCommentVote;
    uint256 public tCommentBet;
    uint256 public totalPost;
    uint256 public totalCode;
    uint256 public totalVote;
    uint256 public totalBet;

    event Deposit(address indexed from, uint256 amount);

    constructor() {
        owner = msg.sender;
    }

    struct Persona {
        uint256 depositedAprove;
        uint256 depositedDisaprove;
        address wallet;
    }

    struct Id {
        uint256 id;
        address ownerContract;
        uint256 totalDeposited;
        uint256 totalAprove;
        uint256 totalDisaprove;
        uint256 like;
        string type_;
    }

    mapping(uint => mapping(uint => Persona)) public Contrato;
    mapping(uint256 => Id) public totalPersona;
    mapping(uint => mapping(uint => Comment)) public NewPost;
    mapping(uint256 => Post) public contratoPost;
    mapping(uint => mapping(uint => Comment)) public NewCode;
    mapping(uint256 => Code) public contratoCode;
    mapping(uint => mapping(uint => Comment)) public NewVote;
    mapping(uint256 => Vote) public contratoVote;
    mapping(uint => mapping(uint => Comment)) public NewBet;
    mapping(uint256 => Bet) public contratoBet;


    struct Post {
        string title;
        string content;
        uint256 comments;
        address wallet;
    }

    struct Code {
            string title;
            string code;
            uint256 comments;
            address wallet;
        }

    struct Vote {
        string title;
        string question;
        string optionA;
        string optionB;
        uint256 comments;
        address wallet;
    }
    
    struct Bet {
        string title;
        string bet;
        string resultA;
        string resultB;
        string date;
        uint256 comments;
        address wallet;
    }

    struct Comment {
        string date;
        address wallet;
    }

    function setPost(string memory type_post,string memory title,string memory content) public {

        if (keccak256(abi.encodePacked(type_post)) == keccak256(abi.encodePacked("Post"))) {
            totalContrato++;
            totalPersona[totalContrato] = Id(
                0,
                msg.sender,
                0,
                0,
                0,
                0,
                type_post
            );

            totalPost++;
            contratoPost[totalPost] = Post(
                title,
                content,
                0,
               msg.sender
            );

        } 
       
    }

    function setPostComment(uint256 contrato,string memory comment) public {

            NewPost[contrato][contratoPost[contrato].comments] = Comment(
                   
                    comment,
                    msg.sender
            );
             contratoPost[contrato].comments++;
        
    }

       
    
    function getPost(uint256 contrato) public view returns ( string memory, string memory, address)  {

        require(contrato <= totalPost, "Indice fuera de rango");
            Post memory post = contratoPost[contrato];
            return (
                post.title,
                post.content,
                post.wallet
        );
            
    }

     function getPostComment(uint256 contrato,uint256 comentario) public view returns ( string memory, address)  {

        require(contrato <= contratoPost[contrato].comments, "Indice fuera de rango");
            Comment memory comment = NewPost[contrato][comentario];
            return (
                comment.date,
                comment.wallet
        );
            
    }

      function setCode(string memory type_post,string memory title,string memory content) public {

        if (keccak256(abi.encodePacked(type_post)) == keccak256(abi.encodePacked("Code"))) {
            totalContrato++;
            totalPersona[totalContrato] = Id(
                0,
                msg.sender,
                0,
                0,
                0,
                0,
                type_post
            );

            totalCode++;
            contratoCode[totalCode] = Code(
                title,
                content,
                0,
               msg.sender
            );

        } 
       
    }

    function setCodeComment(uint256 contrato,string memory comment) public {

            NewCode[contrato][contratoCode[contrato].comments] = Comment(
                   
                    comment,
                    msg.sender
            );
             contratoCode[contrato].comments++;
        
    }

       
    
    function getCode(uint256 contrato) public view returns ( string memory, string memory, address)  {

        require(contrato <= totalCode, "Indice fuera de rango");
            Code memory cod = contratoCode[contrato];
            return (
                cod.title,
                cod.code,
                cod.wallet
        );
            
    }

     function getCodeComment(uint256 contrato,uint256 comentario) public view returns ( string memory, address)  {

        require(contrato <= contratoCode[contrato].comments, "Indice fuera de rango");
            Comment memory comment = NewCode[contrato][comentario];
            return (
                comment.date,
                comment.wallet
        );
            
    }

     function setVote(string memory type_post,string memory title,string memory question,string memory optionA,string memory optionB) public {

        if (keccak256(abi.encodePacked(type_post)) == keccak256(abi.encodePacked("Vote"))) {
            totalContrato++;
            totalPersona[totalContrato] = Id(
                0,
                msg.sender,
                0,
                0,
                0,
                0,
                type_post
            );

            totalVote++;
            contratoVote[totalVote] = Vote(
                title,
                question,
                optionA,
                optionB,
                0,
               msg.sender
            );

        } 
       
    }

    function setVoteComment(uint256 contrato,string memory comment) public {

            NewVote[contrato][contratoVote[contrato].comments] = Comment(
                   
                    comment,
                    msg.sender
            );
             contratoVote[contrato].comments++;
        
    }

       
    
    function getVote(uint256 contrato) public view returns ( string memory, string memory,string memory,string memory, address)  {

        require(contrato <= totalVote, "Indice fuera de rango");
            Vote memory vot = contratoVote[contrato];
            return (
                vot.title,
                vot.question,
                vot.optionA,
                vot.optionB,
                vot.wallet
        );
            
    }

     function getVoteComment(uint256 contrato,uint256 comentario) public view returns ( string memory, address)  {

        require(contrato <= contratoVote[contrato].comments, "Indice fuera de rango");
            Comment memory comment = NewVote[contrato][comentario];
            return (
                comment.date,
                comment.wallet
        );
            
    }

     function setBet(string memory type_post,string memory title,string memory bet,string memory resultA,string memory resultB,string memory date) public {

        if (keccak256(abi.encodePacked(type_post)) == keccak256(abi.encodePacked("Bet"))) {
            totalContrato++;
            totalPersona[totalContrato] = Id(
                0,
                msg.sender,
                0,
                0,
                0,
                0,
                type_post
            );

            totalBet++;
            contratoBet[totalBet] = Bet(
                title,
                bet,
                resultA,
                resultB,
                date,
                0,
               msg.sender
            );

        } 
       
    }

    function setBetComment(uint256 contrato,string memory comment) public {

            NewBet[contrato][contratoBet[contrato].comments] = Comment(
                   
                    comment,
                    msg.sender
            );
             contratoBet[contrato].comments++;
        
    }

       
    
    function getBet(uint256 contrato) public view returns ( string memory, string memory,string memory,string memory,string memory, address)  {

        require(contrato <= totalBet, "Indice fuera de rango");
            Bet memory bett = contratoBet[contrato];
            return (
                bett.title,
                bett.bet,
                bett.resultA,
                bett.resultB,
                bett.date,
                bett.wallet
        );
            
    }

     function getBetComment(uint256 contrato,uint256 comentario) public view returns ( string memory, address)  {

        require(contrato <= contratoBet[contrato].comments, "Indice fuera de rango");
            Comment memory comment = NewBet[contrato][comentario];
            return (
                comment.date,
                comment.wallet
        );
            
    }

    
     function getContratos(uint256 contrato) public view returns (uint256,string memory)  {

         return (totalContrato,totalPersona[contrato].type_);
            
    }
    //si idContract es igual a 0 , se hace  
    //bolean para depositedAprove,depositedDisaprove para hacer multiples transacciones
    function depositContract(uint256 idContract, string memory deposited) external payable {//10000000000000000
    //0x2646c2ACe34fB61c4DE4d003d71a20906aEe81c5
        //require(idContract < totalContrato, "Indice fuera de rango en Contrato");

        if(idContract>0&&msg.value>0){

            Contrato[idContract][totalPersona[idContract].id].wallet=msg.sender;

            if (keccak256(abi.encodePacked(deposited)) == keccak256(abi.encodePacked("Aprove"))) {

                Contrato[idContract][totalPersona[idContract].id].depositedAprove += msg.value;
                totalPersona[idContract].totalAprove+= msg.value;
                } 

            else if (keccak256(abi.encodePacked(deposited)) == keccak256(abi.encodePacked("Disaprove"))) {
                
                Contrato[idContract][totalPersona[idContract].id].depositedDisaprove += msg.value;
                totalPersona[idContract].totalDisaprove+= msg.value;

             }

            totalPersona[idContract].id++;
            totalPersona[idContract].totalDeposited += msg.value;

            emit Deposit(msg.sender,msg.value);

        }

    }

    //condicional dividir el total depositado entre el numero de wallets 
    //entregar reglias dependiendo de la cantidad depositada
    function withdrawBet(uint256 idContrato,string memory win) external {
        
      //  require(msg.sender == totalPersona[idContrato].ownerContract, "Solo el propietario puede realizar");
        //require(idContrato < totalContrato, "Indice fuera de rango en Contrato");
        //require(totalPersona[idContrato].totalDeposited!=0, "Deposito vacio");

        uint256 pay;
        if(totalPersona[idContrato].totalDeposited!=0&&totalPersona[idContrato].ownerContract==msg.sender){
                              
            for(uint i=0;int(i)<=int(totalPersona[idContrato].id);i++){
                if (keccak256(abi.encodePacked(win)) == keccak256(abi.encodePacked("Aprove"))&&int(Contrato[idContrato][i].depositedAprove)!=0) {
                    
                    pay=totalPersona[idContrato].totalDeposited*Contrato[idContrato][i].depositedAprove/totalPersona[idContrato].totalAprove;
                    payable(Contrato[idContrato][i].wallet).transfer(pay);

                } else if (keccak256(abi.encodePacked(win)) == keccak256(abi.encodePacked("Disaprove"))&&int(Contrato[idContrato][i].depositedDisaprove)!=0) {
                    pay=totalPersona[idContrato].totalDeposited*Contrato[idContrato][i].depositedDisaprove/totalPersona[idContrato].totalDisaprove;
                    payable(Contrato[idContrato][i].wallet).transfer(pay);
                }
            }
            totalPersona[idContrato].totalDeposited=0;
            totalPersona[idContrato].totalAprove= 0;
            totalPersona[idContrato].totalDisaprove= 0;
            pay = totalPersona[idContrato].like;
            payable(totalPersona[idContrato].ownerContract).transfer(pay);
            totalPersona[idContrato].like=0;
        }
       
    }

     function withdrawVote(uint256 idContrato) external {

        uint256 pay;
        if(totalPersona[idContrato].totalDeposited!=0&&totalPersona[idContrato].ownerContract==msg.sender){
            
            pay=totalPersona[idContrato].totalDeposited/totalPersona[idContrato].id;
         
            for(uint i=0;int(i)<=int(totalPersona[idContrato].id-1);i++){

                    payable(Contrato[idContrato][i].wallet).transfer(pay);

            }
            totalPersona[idContrato].totalDeposited=0;
            totalPersona[idContrato].totalAprove= 0;
            totalPersona[idContrato].totalDisaprove= 0;
            pay = totalPersona[idContrato].like;
            payable(totalPersona[idContrato].ownerContract).transfer(pay);
            totalPersona[idContrato].like=0;
        }
       
    }

    function withdraw(uint256 idContrato) external {
        
        uint256 pay;
        pay = totalPersona[idContrato].like;
        payable(totalPersona[idContrato].ownerContract).transfer(pay);
        totalPersona[idContrato].like=0;
       
    }

     function deposit(address payable usser ) external payable {
       usser.transfer(msg.value);
    }

  function like(uint256 idContract ) external payable {
       
        totalPersona[idContract].like += msg.value;
        emit Deposit(msg.sender,msg.value);
    }
}