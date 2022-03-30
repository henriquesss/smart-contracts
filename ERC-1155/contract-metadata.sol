// SPDX-License-Identifier: MIT
pragma solidity ^0.8.4;
import "@openzeppelin/contracts/token/ERC1155/ERC1155.sol";
import "@openzeppelin/contracts/utils/Strings.sol";

contract MyToken is ERC1155 {
    string public name;
    
    constructor(string memory _name) ERC1155("https://your-ipfs-address.ipfs.nftstorage.link/{id}.json") {
        // O parêmtro _name vem de um campo que aparece antes de fazer o deploy no Remix
        name = _name;
        _mint(msg.sender, 1, 1, "");
    }

    /*
      Essa função uri é usada pois no momento que o contrato é chamado, o endereço montado não será dinâmico,
      e o padrão das plataformas de NFT como OpenSea é com o {id} dinâmico, tipo assim:

      https://your-ipfs-address.ipfs.nftstorage.link/1.json
    */
    function uri(uint256 _tokenId) override public pure returns (string memory) {
        return string(
            abi.encodePacked(
                "https://your-ipfs-address.ipfs.nftstorage.link/",
                Strings.toString(_tokenId),
                ".json"
            )
        );
    } 
}